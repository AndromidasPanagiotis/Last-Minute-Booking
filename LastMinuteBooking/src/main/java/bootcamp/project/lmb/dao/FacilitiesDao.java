/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.dao;

import bootcamp.project.lmb.model.Facilities;
import bootcamp.project.lmb.repos.FacilitiesRepo;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Panos
 */

@Service
public class FacilitiesDao {
    
    @Autowired
    FacilitiesRepo fr;
    
    public ArrayList <Facilities> getFacilities() {
        ArrayList <Facilities> facilities = (ArrayList <Facilities>) fr.findAll();
        return facilities;
    }
    
}
