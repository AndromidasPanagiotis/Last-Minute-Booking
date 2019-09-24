/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.repos;

import bootcamp.project.lmb.model.Room;
import bootcamp.project.lmb.model.RoomEquipment;
import java.util.ArrayList;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author minas
 */
@Repository
@Transactional
public interface RoomEquipmentRepo extends JpaRepository<RoomEquipment, Integer> {

    @Modifying
    @Query(value = "insert into room_equipment(Room_id , Hotel_id , Equipment_id ) values ( ?1 , ?2 , ?3 ) ;", nativeQuery = true)
    void insertRoomEquipment(Integer roomid, Integer hotelid, Integer equipmentid);

    @Modifying
    @Query(value = "delete from room_equipment where Room_id=?1 ;", nativeQuery = true)
    void deleteRoomEquipment(Integer roomid);

    @Modifying
    @Query(value = "SELECT re.* FROM room_equipment re inner join hotel on hotel.Id=re.Hotel_Id where hotel.Owner_id = ?1 ;", nativeQuery = true)
    ArrayList<RoomEquipment> getRoomEquipmentByUserId(Integer userid);

    @Modifying
    @Query(value = "select re.* from room_equipment re\n"
            + "inner join room r on r.id=re.room_id\n"
            + "inner join hotel h on h.id = r.hotel_id\n"
            + "where h.id= ?1 ;", nativeQuery = true)
    ArrayList<RoomEquipment> getRoomEquipmentByHotelId(Integer hotelid);
}
