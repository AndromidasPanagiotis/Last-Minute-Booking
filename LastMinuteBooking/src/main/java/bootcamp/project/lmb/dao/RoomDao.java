/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.dao;

import bootcamp.project.lmb.model.Room;
import bootcamp.project.lmb.repos.RoomRepo;
import java.util.ArrayList;
import java.util.Date;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Panos
 */

@Service
public class RoomDao {
    
    @Autowired
    RoomRepo rr;

    public ArrayList <Room> getRooms() {
        ArrayList <Room> rooms = (ArrayList <Room>) rr.findAll();
        return rooms;
    }
    
     public ArrayList <Room> getUserSearchRooms(Integer budget, Integer nights, Integer persons, Date checkin, Date checkout, Integer hotelId) {
        return rr.findSearchRooms(budget, nights, persons, checkin, checkout, hotelId);
    }

    public void insertRoom(Room room) {
        rr.save(room);
    }
    
    public void deleteRoom(Integer id) {
        rr.deleteById(id);
    }
    
    public Room getRoomByUserIdandName(int id, String name) {
        Room room = rr.getRoomByUserIdandName(id,name);
        return room;
    }
    
    public ArrayList <Room> getRoomByUserId(int id) {
        ArrayList <Room> rooms = rr.getRoomByUserId(id);
        return rooms;
    }
    
    public Room getRoomById(int id) {
        Room room = rr.getOne(id);
        return room;
    }
    
}
