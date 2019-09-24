/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.dao;

import bootcamp.project.lmb.model.Hotel;
import bootcamp.project.lmb.repos.HotelRepo;
import java.util.Date;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Panos
 */

@Service
public class HotelDao {
    
    @Autowired
    HotelRepo hr;
    
    public ArrayList <Hotel> getHotels() {
        ArrayList <Hotel> hotels = (ArrayList <Hotel>) hr.findAll();
        return hotels;
    }
    
    public ArrayList <Hotel> getUserSearchHotels(Integer budget, Integer nights, Integer persons, Date checkin, Date checkout) {
        return hr.findSearchHotels(budget, nights, persons, checkin, checkout);
    }
    
     public ArrayList <Hotel> getHotelsByUserId(int id) {
        ArrayList <Hotel> hotels = (ArrayList <Hotel>) hr.getHotelsByUserId(id);
        return hotels;
    }
    
    public Hotel getHotelsByUserIdandName(int id, String name) {
        Hotel hotel = hr.getHotelsByUserIdandName(id,name);
        return hotel;
    }
    
    public void insertHotel(Hotel hotel) {
        hr.save(hotel); 
    }
    
    public void deleteHotel(Integer id) {
        hr.deleteHotel(id); 
    }
    
    public  Hotel getHotelById(Integer id) {
        Hotel hotel= hr.getHotelById(id);
       
       return hotel;
    }
    
}
