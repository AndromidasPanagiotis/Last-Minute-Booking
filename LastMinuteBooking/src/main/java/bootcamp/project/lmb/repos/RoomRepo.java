/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.repos;

import bootcamp.project.lmb.model.Room;
import java.util.ArrayList;
import java.util.Date;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Panos
 */
@Repository
public interface RoomRepo extends JpaRepository<Room, Integer> {

    @Query(
            value = "select r.* from room r\n"
            + "inner join hotel h on r.hotel_id = h.id\n"
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
            + ")))"
            + "and h.id = :hotelid",
            nativeQuery = true
    )
    ArrayList<Room> findSearchRooms(@Param("budget") Integer budget, @Param("nights") Integer nights, @Param("persons") Integer persons,
            @Param("checkin") Date checkin, @Param("checkout") Date checkout, @Param("hotelid") Integer hotelId);

    @Query(value = "select room.* from room inner join hotel on room.Hotel_id=hotel.Id inner join user on hotel.Owner_id=user.Id where user.Id=?1 and room.name=?2 ;", nativeQuery = true)
    public Room getRoomByUserIdandName(int id, String name);

    @Query(value = "select room.* from room inner join hotel on room.Hotel_id=hotel.Id inner join user on hotel.Owner_id=user.Id where user.Id=?1 ;", nativeQuery = true)
    public ArrayList<Room> getRoomByUserId(int id);

}
