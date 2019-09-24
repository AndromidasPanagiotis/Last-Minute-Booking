/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.dao;

import bootcamp.project.lmb.model.Status;
import bootcamp.project.lmb.repos.StatusRepo;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Panos
 */

@Service
public class StatusDao {
    
    @Autowired
    StatusRepo sr;

    public ArrayList <Status> getStatus() {
        ArrayList <Status> status = (ArrayList <Status>) sr.findAll();
        return status;
    }
    
}
