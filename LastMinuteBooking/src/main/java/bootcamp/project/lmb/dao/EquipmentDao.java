/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.dao;

import bootcamp.project.lmb.model.Equipment;
import bootcamp.project.lmb.repos.EquipmentRepo;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Panos
 */

@Service
public class EquipmentDao {
    
    @Autowired
    EquipmentRepo er;
    
    public ArrayList <Equipment> getEquipment() {
        ArrayList <Equipment> equipment = (ArrayList <Equipment>) er.findAll();
        return equipment;
    }
    
}
