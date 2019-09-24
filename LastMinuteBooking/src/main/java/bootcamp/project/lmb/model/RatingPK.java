/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Panos
 */
@Embeddable
public class RatingPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "User_id")
    private int userid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Hotel_id")
    private int hotelid;

    public RatingPK() {
    }

    public RatingPK(int userid, int hotelid) {
        this.userid = userid;
        this.hotelid = hotelid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getHotelid() {
        return hotelid;
    }

    public void setHotelid(int hotelid) {
        this.hotelid = hotelid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) userid;
        hash += (int) hotelid;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RatingPK)) {
            return false;
        }
        RatingPK other = (RatingPK) object;
        if (this.userid != other.userid) {
            return false;
        }
        if (this.hotelid != other.hotelid) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bootcamp.project.lmb.model.RatingPK[ userid=" + userid + ", hotelid=" + hotelid + " ]";
    }
    
}
