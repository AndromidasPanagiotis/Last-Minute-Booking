/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.repos;

import bootcamp.project.lmb.model.Hotel;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
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
@Transactional
@Repository
public interface HotelRepo extends JpaRepository<Hotel, Integer> {

    @Query(
            value = "select distinct h.* from hotel h\n"
            + "inner join room r on r.hotel_id = h.id\n"
            + "inner join destination d on h.destination_id = d.id\n"
            + "where :budget > d.ticket_cost + (r.price_per_night*:nights)\n"
            + "and r.id in\n"
            + "(select r.id from room r\n"
            + "left join room_unavailability ru on ru.room_id=r.id\n"
            + "where (\n"
            + "r.capacity = :persons\n"
            + "and ((ru.start_date > :checkin and ru.start_date > :checkout)\n"
            + "or (ru.end_date < :checkin and ru.end_date < :checkout)\n"
            + "or (r.id not in (select ru.room_id from room_unavailability ru))\n"
            + ")))",
            nativeQuery = true
    )
    ArrayList<Hotel> findSearchHotels(@Param("budget") Integer budget, @Param("nights") Integer nights, @Param("persons") Integer persons,
            @Param("checkin") Date checkin, @Param("checkout") Date checkout);

    @Query(value = "select hotel.* from hotel inner join user on hotel.Owner_id=user.Id where user.Id=?1 ;", nativeQuery = true)
    List<Hotel> getHotelsByUserId(Integer id);

    @Query(value = "select hotel.* from hotel inner join user on hotel.Owner_id=user.Id where user.Id=?1 and hotel.name=?2 ;", nativeQuery = true)
    Hotel getHotelsByUserIdandName(int id, String name);

    @Query(value = "select * from hotel where Id=?1 ;", nativeQuery = true)
    Hotel getHotelById(int id);

    @Modifying
    @Query(value = "delete from hotel where Id= ?1 ;", nativeQuery = true)
    void deleteHotel(int id);

}
