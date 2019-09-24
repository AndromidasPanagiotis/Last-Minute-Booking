/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.dao;
import bootcamp.project.lmb.model.HotelFacilities;
import bootcamp.project.lmb.repos.HotelFacilitiesRepo;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 *
 * @author minas
 */
@Service
public class HotelFacilitiesDao {
    
    @Autowired
    HotelFacilitiesRepo hfr;
    
    public void insertHotelFacilities(int hotelid,int facilityid) {
        hfr.insertHotelFacilities(hotelid,facilityid);
        
    }
    
    public void deleteHotelFacilities(int hotelid) {
        hfr.deleteHotelFacilities(hotelid);
        
    }
    
    public ArrayList<HotelFacilities> getHotelFacilitiesByUserId(int userid){
       ArrayList <HotelFacilities> hotelFacilities = hfr.getHotelFacilitiesByUserId(userid);
        
       return hotelFacilities;
    }
    
}