/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.controllers;

import bootcamp.project.lmb.dao.HotelDao;
import bootcamp.project.lmb.dao.UserDao;
import bootcamp.project.lmb.model.User;
import java.util.ArrayList;
import java.util.Base64;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Panos
 */
@Controller
@RequestMapping(value = "/user")
public class LoginController {

    @Autowired
    UserDao ud;

    @Autowired
    HotelDao hd;

    public static Base64.Decoder decoder = Base64.getDecoder();

    @GetMapping("/prelogin")
    public String login(ModelMap model) {
        User u = new User();
        model.addAttribute("user", u);
        return "login";
    }

    @PostMapping("/login")
    public String doLogin(@ModelAttribute("user") User loginUser, HttpSession session, ModelMap model) {
        ArrayList<User> users = ud.getUsers();
        int counter = 0;
        for (User user : users) {
            String decryptedPassword = new String(decoder.decode(user.getPassword().getBytes()));
            if (user.getUsername().equals(loginUser.getUsername()) && decryptedPassword.equals(loginUser.getPassword())) {
                switch (user.getActive()) {
                    case 0:
                        model.addAttribute("pendingRegistration", "Confirmation of your registration is needed, please check your mail!");
                        return "login";
                    case 1:
                        session.setAttribute("loggedUser", user);
                        switch (user.getRole().getId()) {
                            case 1:
                                return "customer_central";
                            case 2:
                                return "redirect:/owner/owner_central";
                        }
                }
            }
            if (user.getUsername().equals(loginUser.getUsername()) && !decryptedPassword.equals(loginUser.getPassword())) {
                model.addAttribute("wrongPassword", "Wrong Password");
                return "login";
            }
        }
        return "failure";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, ModelMap model) {
        session.invalidate();
        User u = new User();
        model.addAttribute("user", u);
        return "login";
    }

    @GetMapping("/customerCentral")
    public String customerCentral(HttpSession session, ModelMap model) {

        return "customer_central";
    }
}
