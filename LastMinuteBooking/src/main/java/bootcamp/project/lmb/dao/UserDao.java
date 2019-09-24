/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.dao;

import bootcamp.project.lmb.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bootcamp.project.lmb.repos.UserRepo;
import java.util.ArrayList;

/**
 *
 * @author Panos
 */

@Service
public class UserDao {
    
    @Autowired
    UserRepo ur;

    public ArrayList <User> getUsers() {
        ArrayList <User> users = (ArrayList <User>) ur.findAll();
        return users;
    }

    public void insertUser(User newUser) {
        ur.save(newUser);
    }
    
    
    public void confirmUserRegistration(User user) {
        ur.updateUserActivity(user.getId());
    }
}
