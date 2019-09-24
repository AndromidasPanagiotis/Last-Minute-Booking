/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.repos;

import bootcamp.project.lmb.model.Hotel;
import bootcamp.project.lmb.model.Room;
import bootcamp.project.lmb.model.RoomUnavailability;
import java.util.ArrayList;
import java.util.Date;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Panos
 */
@Transactional
@Repository
public interface RoomUnavailabilityRepo extends JpaRepository<RoomUnavailability, Integer> {

    @Query(
            value = "select ru.* from room_unavailability ru \n"
            + "left outer join rating r on ru.User_id=r.User_id and ru.Hotel_id=r.Hotel_id\n"
            + "where ru.End_date<CAST(CURRENT_TIMESTAMP AS DATE) and r.User_id is null and r.Hotel_id is null and ru.User_id= ?1 ;",
            nativeQuery = true
    )
    RoomUnavailability availableRatings(Integer userid);

    @Query(
            value = "select ru.* from hotel h\n"
            + "inner join room_unavailability ru\n"
            + "on h.Id=ru.Hotel_id \n"
            + "where ru.User_id= ?1 order by ru.End_date desc;",
            nativeQuery = true
    )
    ArrayList<RoomUnavailability> reservetions(Integer userid);

    @Modifying
    @Query(value = "delete from room_unavailability where Id= ?1 ;", nativeQuery = true)
    void deleteReservation(Integer id);
}
