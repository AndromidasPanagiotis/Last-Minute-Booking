/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.controllers;

import bootcamp.project.lmb.dao.RoleDao;
import bootcamp.project.lmb.dao.UserDao;
import bootcamp.project.lmb.model.Role;
import bootcamp.project.lmb.model.User;
import bootcamp.project.lmb.utils.UserRegistration;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Panos
 */

@Controller
@RequestMapping(value = "/user")
public class RegisterController {

    @Autowired
    UserDao ud;

    @Autowired
    RoleDao rd;

    @GetMapping(value = "/preregister")
    public String register(ModelMap model) {
        User u = new User();
        model.addAttribute("user", u);
        return "register";
    }

    @PostMapping(value = "/register")
    public String doRegister(@ModelAttribute("user") User newUser, ModelMap model, @RequestParam("pass") String pass, 
                                @RequestParam(value = "roleCheck", required = false, defaultValue = " ") String roleCheck) {
        Boolean usernameExists = false;
        for (User user : ud.getUsers()) {
            if (newUser.getUsername().equals(user.getUsername())) {
                usernameExists = true;
                break;
            }
        }
        if(!usernameExists) {
            if(newUser.getPassword().equals(pass)) {
                ArrayList <Role> roles = rd.getRoles();
                try {           
                    ud.insertUser(UserRegistration.registerUser(newUser, roles, roleCheck));
                } catch (MessagingException ex) {
                    Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
                }
                model.addAttribute("pendingRegistration", "Confirmation of your registration is needed, please check your mail!");
                return "login";
            }
            else {
                model.addAttribute("passwordMismatch", "Passwords do not match, try again...");
                model.addAttribute("user", new User());
                return "register";
            }
        }
        else {      
            model.addAttribute("usernameExists", "Username exists, try again...");
            model.addAttribute("user", new User());
            return "register";
        }
    }
    
    @GetMapping(value = "/confirmreg/{userSerial}")
    public String confirmRegister(@PathVariable(name = "userSerial") String userSerial, ModelMap model) {
        ArrayList <User> users = ud.getUsers();
        for (User user : users) {
            if(user.getSerial().equals(userSerial)) {
                ud.confirmUserRegistration(user);
                model.addAttribute("registrationSuccess", "You can now log in to our website!");
                model.addAttribute("user", user);
                return "login";
            }
        }                   
        return "failure";   
    }
}
