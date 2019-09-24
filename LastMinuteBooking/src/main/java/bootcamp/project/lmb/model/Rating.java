/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Panos
 */
@Entity
@Table(name = "rating")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Rating.findAll", query = "SELECT r FROM Rating r")
    , @NamedQuery(name = "Rating.findByUserid", query = "SELECT r FROM Rating r WHERE r.ratingPK.userid = :userid")
    , @NamedQuery(name = "Rating.findByHotelid", query = "SELECT r FROM Rating r WHERE r.ratingPK.hotelid = :hotelid")
    , @NamedQuery(name = "Rating.findByCustomerrating", query = "SELECT r FROM Rating r WHERE r.customerrating = :customerrating")
    , @NamedQuery(name = "Rating.findByComments", query = "SELECT r FROM Rating r WHERE r.comments = :comments")})
public class Rating implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected RatingPK ratingPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Customer_rating")
    private float customerrating;
    @Size(max = 500)
    @Column(name = "Comments")
    private String comments;
    @JoinColumn(name = "Hotel_id", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Hotel hotel;
    @JoinColumn(name = "User_id", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;

    public Rating() {
    }

    public Rating(RatingPK ratingPK) {
        this.ratingPK = ratingPK;
    }

    public Rating(RatingPK ratingPK, float customerrating) {
        this.ratingPK = ratingPK;
        this.customerrating = customerrating;
    }

    public Rating(int userid, int hotelid) {
        this.ratingPK = new RatingPK(userid, hotelid);
    }

    public RatingPK getRatingPK() {
        return ratingPK;
    }

    public void setRatingPK(RatingPK ratingPK) {
        this.ratingPK = ratingPK;
    }

    public float getCustomerrating() {
        return customerrating;
    }

    public void setCustomerrating(float customerrating) {
        this.customerrating = customerrating;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ratingPK != null ? ratingPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Rating)) {
            return false;
        }
        Rating other = (Rating) object;
        if ((this.ratingPK == null && other.ratingPK != null) || (this.ratingPK != null && !this.ratingPK.equals(other.ratingPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bootcamp.project.lmb.model.Rating[ ratingPK=" + ratingPK + " ]";
    }
    
}
