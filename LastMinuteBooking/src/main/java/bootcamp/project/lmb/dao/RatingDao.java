/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.dao;

import bootcamp.project.lmb.model.Rating;
import bootcamp.project.lmb.repos.RatingRepo;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Panos
 */
@Service
public class RatingDao {

    @Autowired
    RatingRepo rr;

    public ArrayList<Rating> getRatings() {
        ArrayList<Rating> ratings = (ArrayList<Rating>) rr.findAll();
        return ratings;
    }

    public ArrayList<Rating> getRatingsById(int hotelid) {
        ArrayList<Rating> ratings = rr.getRatingById(hotelid);
        return ratings;
    }

    public void insertRating(int userid, int hotelid, float rating, String Comments) {
        rr.insertRating(userid, hotelid, rating, Comments);

    }

    public double getHotelRating(Integer id) {
        return rr.getHotelRating(id);
    }

}
