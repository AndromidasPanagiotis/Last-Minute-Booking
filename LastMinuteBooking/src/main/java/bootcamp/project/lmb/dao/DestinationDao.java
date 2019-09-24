/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.dao;

import bootcamp.project.lmb.model.Destination;
import bootcamp.project.lmb.repos.DestinationRepo;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Panos
 */

@Service
public class DestinationDao {
    
    @Autowired
    DestinationRepo dr;
    
    public ArrayList <Destination> getDestinations() {
        ArrayList <Destination> destinations = (ArrayList <Destination>) dr.findAll();
        return destinations;
    }
    
    public Destination getDestinationById(int id) {
        Destination destination = (Destination) dr.getDestinationById(id);
        return destination;
    }
    
    
    
}
