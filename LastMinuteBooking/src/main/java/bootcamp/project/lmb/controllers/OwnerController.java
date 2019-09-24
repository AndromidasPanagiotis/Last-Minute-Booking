/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.controllers;

import bootcamp.project.lmb.dao.DestinationDao;
import bootcamp.project.lmb.dao.HotelDao;
import bootcamp.project.lmb.dao.HotelFacilitiesDao;
import bootcamp.project.lmb.dao.RoomDao;
import bootcamp.project.lmb.dao.RoomEquipmentDao;
import bootcamp.project.lmb.dao.RoomUnavailabilityDao;
import bootcamp.project.lmb.dao.UserDao;
import bootcamp.project.lmb.model.Hotel;
import bootcamp.project.lmb.model.Room;
import bootcamp.project.lmb.model.RoomUnavailability;
import bootcamp.project.lmb.model.User;
import bootcamp.project.lmb.repos.HotelRepo;
import bootcamp.project.lmb.repos.RoomRepo;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Base64;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author minas
 */
@Controller
@SessionAttributes({"loggedUser"})
@RequestMapping(value = "/owner")
public class OwnerController {

    @Autowired
    UserDao ud;

    @Autowired
    HotelDao hd;

    @Autowired
    HotelRepo hr;

    @Autowired
    RoomRepo rr;

    @Autowired
    DestinationDao dd;

    @Autowired
    HotelFacilitiesDao hfd;

    @Autowired
    RoomDao rd;

    @Autowired
    RoomEquipmentDao red;

    @Autowired
    RoomUnavailabilityDao rur;

    public static Base64.Encoder encoder = Base64.getEncoder();

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                dateFormat, false));
    }

    @GetMapping("/owner_central")
    public String ownerServices(ModelMap model, @SessionAttribute("loggedUser") User user, HttpSession session) {
        Hotel newhotel = new Hotel();
        Hotel updatehotel = new Hotel();
        Room newroom = new Room();
        Room updateroom = new Room();
        User updateUser = new User();
        RoomUnavailability roomUnavailability = new RoomUnavailability();

        session.setAttribute("hotelFacilities", hfd.getHotelFacilitiesByUserId(user.getId()));
        session.setAttribute("roomEquipments", red.getRoomEquipmentByUserId(user.getId()));
        session.setAttribute("hotels", hd.getHotelsByUserId(user.getId()));
        session.setAttribute("destinations", dd.getDestinations());
        session.setAttribute("rooms", rd.getRoomByUserId(user.getId()));
        model.addAttribute("newhotel", newhotel);
        model.addAttribute("updatehotel", updatehotel);
        model.addAttribute("newroom", newroom);
        model.addAttribute("updateroom", updateroom);
        model.addAttribute("updateUser", updateUser);
        model.addAttribute("roomUnavailability", roomUnavailability);

        return "owner_central";
    }

    @PostMapping("/addHotel")
    public String ownerAddHotel(ModelMap model,
            @ModelAttribute("newhotel") Hotel hotel,
            @SessionAttribute("loggedUser") User user,
            @RequestParam(value = "FamilyRooms", required = false, defaultValue = "false") boolean FamilyRooms,
            @RequestParam(value = "FreeWifi", required = false, defaultValue = "false") boolean FreeWifi,
            @RequestParam(value = "Nonsmokingroom", required = false, defaultValue = "false") boolean Nonsmokingroom,
            @RequestParam(value = "Parking", required = false, defaultValue = "false") boolean Parking,
            @RequestParam(value = "Petsallowed", required = false, defaultValue = "false") boolean Petsallowed,
            @RequestParam(value = "Swimmingpool", required = false, defaultValue = "false") boolean Swimmingpool,
            @RequestParam(value = "Spaandwellnesscenter", required = false, defaultValue = "false") boolean Spaandwellnesscenter,
            @RequestParam(value = "Bar", required = false, defaultValue = "false") boolean Bar
    ) {

//        Insert hotel
        hotel.setOwnerid(user);

        hd.insertHotel(hotel);
//        ------------

//        Insert HotelFacilities
        Hotel newhotel = hd.getHotelsByUserIdandName(user.getId(), hotel.getName());

        if (FreeWifi) {
            hfd.insertHotelFacilities(newhotel.getId(), 1);
        }
        if (Nonsmokingroom) {
            hfd.insertHotelFacilities(newhotel.getId(), 2);
        }
        if (FamilyRooms) {
            hfd.insertHotelFacilities(newhotel.getId(), 3);
        }
        if (Parking) {
            hfd.insertHotelFacilities(newhotel.getId(), 5);
        }
        if (Petsallowed) {
            hfd.insertHotelFacilities(newhotel.getId(), 6);
        }
        if (Swimmingpool) {
            hfd.insertHotelFacilities(newhotel.getId(), 8);
        }
        if (Spaandwellnesscenter) {
            hfd.insertHotelFacilities(newhotel.getId(), 9);
        }
        if (Bar) {
            hfd.insertHotelFacilities(newhotel.getId(), 10);
        }
//        ------------

        return "redirect:/owner/owner_central";
    }

    @PostMapping("/updateHotel")
    public String ownerUpdateHotel(ModelMap model,
            @ModelAttribute("updatehotel") Hotel hotel,
            @SessionAttribute("loggedUser") User user,
            @RequestParam(value = "FamilyRooms", required = false, defaultValue = "false") boolean FamilyRooms,
            @RequestParam(value = "FreeWifi", required = false, defaultValue = "false") boolean FreeWifi,
            @RequestParam(value = "Nonsmokingroom", required = false, defaultValue = "false") boolean Nonsmokingroom,
            @RequestParam(value = "Parking", required = false, defaultValue = "false") boolean Parking,
            @RequestParam(value = "Petsallowed", required = false, defaultValue = "false") boolean Petsallowed,
            @RequestParam(value = "Swimmingpool", required = false, defaultValue = "false") boolean Swimmingpool,
            @RequestParam(value = "Spaandwellnesscenter", required = false, defaultValue = "false") boolean Spaandwellnesscenter,
            @RequestParam(value = "Bar", required = false, defaultValue = "false") boolean Bar
    ) {

//        Insert hotel
        hotel.setOwnerid(user);
        hd.insertHotel(hotel);
//        ------------

//        Delete HotelFacilities with hotelId
        hfd.deleteHotelFacilities(hotel.getId());
//        ------------

//        Insert HotelFacilities
        if (FreeWifi) {
            hfd.insertHotelFacilities(hotel.getId(), 1);
        }
        if (Nonsmokingroom) {
            hfd.insertHotelFacilities(hotel.getId(), 2);
        }
        if (FamilyRooms) {
            hfd.insertHotelFacilities(hotel.getId(), 3);
        }
        if (Parking) {
            hfd.insertHotelFacilities(hotel.getId(), 5);
        }
        if (Petsallowed) {
            hfd.insertHotelFacilities(hotel.getId(), 6);
        }
        if (Swimmingpool) {
            hfd.insertHotelFacilities(hotel.getId(), 8);
        }
        if (Spaandwellnesscenter) {
            hfd.insertHotelFacilities(hotel.getId(), 9);
        }
        if (Bar) {
            hfd.insertHotelFacilities(hotel.getId(), 10);
        }
//        ------------

        return "redirect:/owner/owner_central";
    }

    @PostMapping("/addRoom")
    public String ownerAddRoom(ModelMap model,
            @ModelAttribute("newRoom") Room room,
            @SessionAttribute("loggedUser") User user,
            @RequestParam(value = "Kitchen", required = false, defaultValue = "false") boolean Kitchen,
            @RequestParam(value = "Privatebathroom", required = false, defaultValue = "false") boolean Privatebathroom,
            @RequestParam(value = "AirConditioning", required = false, defaultValue = "false") boolean AirConditioning,
            @RequestParam(value = "Bath", required = false, defaultValue = "false") boolean Bath,
            @RequestParam(value = "FlatscreenTV", required = false, defaultValue = "false") boolean FlatscreenTV,
            @RequestParam(value = "WashingMachine", required = false, defaultValue = "false") boolean WashingMachine,
            @RequestParam(value = "View", required = false, defaultValue = "false") boolean View,
            @RequestParam(value = "CoffeeteaMaker", required = false, defaultValue = "false") boolean CoffeeteaMaker,
            @RequestParam(value = "CoffeeMachine", required = false, defaultValue = "false") boolean CoffeeMachine,
            @RequestParam(value = "Electrickettle", required = false, defaultValue = "false") boolean Electrickettle,
            @RequestParam(value = "DoubleBed", required = false, defaultValue = "false") boolean DoubleBed,
            @RequestParam(value = "SingleBed", required = false, defaultValue = "false") boolean SingleBed
    ) {

        //        Insert hotel
        rd.insertRoom(room);
        //        ------------

        //        Insert RoomEquipment
        Room newroom = rd.getRoomByUserIdandName(user.getId(), room.getName());

        if (Kitchen) {
            red.insertRoomEquipment(newroom.getId(), room.getHotelid().getId(), 1);
        }
        if (Privatebathroom) {
            red.insertRoomEquipment(newroom.getId(), room.getHotelid().getId(), 2);
        }
        if (AirConditioning) {
            red.insertRoomEquipment(newroom.getId(), room.getHotelid().getId(), 3);
        }
        if (Bath) {
            red.insertRoomEquipment(newroom.getId(), room.getHotelid().getId(), 4);
        }
        if (FlatscreenTV) {
            red.insertRoomEquipment(newroom.getId(), room.getHotelid().getId(), 5);
        }
        if (WashingMachine) {
            red.insertRoomEquipment(newroom.getId(), room.getHotelid().getId(), 6);
        }
        if (View) {
            red.insertRoomEquipment(newroom.getId(), room.getHotelid().getId(), 7);
        }
        if (CoffeeteaMaker) {
            red.insertRoomEquipment(newroom.getId(), room.getHotelid().getId(), 8);
        }
        if (CoffeeMachine) {
            red.insertRoomEquipment(newroom.getId(), room.getHotelid().getId(), 9);
        }
        if (Electrickettle) {
            red.insertRoomEquipment(newroom.getId(), room.getHotelid().getId(), 10);
        }
        if (DoubleBed) {
            red.insertRoomEquipment(newroom.getId(), room.getHotelid().getId(), 11);
        }
        if (SingleBed) {
            red.insertRoomEquipment(newroom.getId(), room.getHotelid().getId(), 12);
        }

        return "redirect:/owner/owner_central";
    }

    @PostMapping("/updateRoom")
    public String ownerUpdateRoom(ModelMap model,
            @ModelAttribute("updateRoom") Room room,
            @SessionAttribute("loggedUser") User user,
            @RequestParam(value = "Kitchen", required = false, defaultValue = "false") boolean Kitchen,
            @RequestParam(value = "Privatebathroom", required = false, defaultValue = "false") boolean Privatebathroom,
            @RequestParam(value = "AirConditioning", required = false, defaultValue = "false") boolean AirConditioning,
            @RequestParam(value = "Bath", required = false, defaultValue = "false") boolean Bath,
            @RequestParam(value = "FlatscreenTV", required = false, defaultValue = "false") boolean FlatscreenTV,
            @RequestParam(value = "WashingMachine", required = false, defaultValue = "false") boolean WashingMachine,
            @RequestParam(value = "View", required = false, defaultValue = "false") boolean View,
            @RequestParam(value = "CoffeeteaMaker", required = false, defaultValue = "false") boolean CoffeeteaMaker,
            @RequestParam(value = "CoffeeMachine", required = false, defaultValue = "false") boolean CoffeeMachine,
            @RequestParam(value = "Electrickettle", required = false, defaultValue = "false") boolean Electrickettle,
            @RequestParam(value = "DoubleBed", required = false, defaultValue = "false") boolean DoubleBed,
            @RequestParam(value = "SingleBed", required = false, defaultValue = "false") boolean SingleBed
    ) {

        //        Insert hotel
        rd.insertRoom(room);
        //        ------------

        //        Delete RoomEquipment
        red.deleteRoomEquipment(room.getId());

        //        Insert RoomEquipment
        if (Kitchen) {
            red.insertRoomEquipment(room.getId(), room.getHotelid().getId(), 1);
        }
        if (Privatebathroom) {
            red.insertRoomEquipment(room.getId(), room.getHotelid().getId(), 2);
        }
        if (AirConditioning) {
            red.insertRoomEquipment(room.getId(), room.getHotelid().getId(), 3);
        }
        if (Bath) {
            red.insertRoomEquipment(room.getId(), room.getHotelid().getId(), 4);
        }
        if (FlatscreenTV) {
            red.insertRoomEquipment(room.getId(), room.getHotelid().getId(), 5);
        }
        if (WashingMachine) {
            red.insertRoomEquipment(room.getId(), room.getHotelid().getId(), 6);
        }
        if (View) {
            red.insertRoomEquipment(room.getId(), room.getHotelid().getId(), 7);
        }
        if (CoffeeteaMaker) {
            red.insertRoomEquipment(room.getId(), room.getHotelid().getId(), 8);
        }
        if (CoffeeMachine) {
            red.insertRoomEquipment(room.getId(), room.getHotelid().getId(), 9);
        }
        if (Electrickettle) {
            red.insertRoomEquipment(room.getId(), room.getHotelid().getId(), 10);
        }
        if (DoubleBed) {
            red.insertRoomEquipment(room.getId(), room.getHotelid().getId(), 11);
        }
        if (SingleBed) {
            red.insertRoomEquipment(room.getId(), room.getHotelid().getId(), 12);
        }

        return "redirect:/owner/owner_central";
    }

    @GetMapping(value = "/deletehotel/{hotelid}")
    public String deleteHotel(@PathVariable(name = "hotelid") Integer hotelid,
            ModelMap model,
            @SessionAttribute("loggedUser") User user) {

        hd.deleteHotel(hotelid);

        return "redirect:/owner/owner_central";
    }

    @GetMapping(value = "/deleteroom/{roomid}")
    public String deleteRoom(@PathVariable(name = "roomid") Integer roomid,
            ModelMap model,
            @SessionAttribute("loggedUser") User user) {

        rd.deleteRoom(roomid);

        return "redirect:/owner/owner_central";
    }

    @PostMapping("/unavailability")
    public String ownerUnavailability(ModelMap model,
            @ModelAttribute("roomUnavailability") RoomUnavailability roomUnavailability,
            @SessionAttribute("loggedUser") User user
    ) {

        rur.insertRoomUnavailability(roomUnavailability);

        return "redirect:/owner/owner_central";
    }

    @PostMapping("/updateOwnerSettings")
    public String ownerupdateUserSettings(ModelMap model,
            @SessionAttribute("loggedUser") User user,
            @ModelAttribute("updateUser") User updateUser,
            HttpSession session
    ) {

        String decryptedPassword = new String(encoder.encode(updateUser.getPassword().getBytes()));
        updateUser.setPassword(decryptedPassword);

        ud.insertUser(updateUser);
        session.setAttribute("loggedUser", updateUser);

        return "redirect:/owner/owner_central";
    }
}
