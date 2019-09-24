/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.repos;

import bootcamp.project.lmb.model.Rating;
import java.util.ArrayList;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Panos
 */
@Repository
@Transactional
public interface RatingRepo extends JpaRepository<Rating, Integer> {

    @Modifying
    @Query(value = "insert into rating(User_id,Hotel_id ,Customer_rating,Comments) values ( ?1 , ?2 , ?3 , ?4) ;", nativeQuery = true)
    void insertRating(int userid, int hotelid, float rating, String Comments);

    @Modifying
    @Query(value = "select r.* from rating r where Hotel_id= ?1 ;", nativeQuery = true)
    ArrayList<Rating> getRatingById(int hotelid);

    @Query(value = "SELECT avg(r.customer_rating) from rating r where r.hotel_id = :id", nativeQuery = true)
    Double getHotelRating(@Param("id") Integer id);

}


