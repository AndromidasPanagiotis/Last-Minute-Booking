/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
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
public class HotelFacilitiesPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "Hotel_id")
    @JsonBackReference
    private int hotelid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Facility_id")
    @JsonManagedReference
    private int facilityid;

    public HotelFacilitiesPK() {
    }

    public HotelFacilitiesPK(int hotelid, int facilityid) {
        this.hotelid = hotelid;
        this.facilityid = facilityid;
    }

    public int getHotelid() {
        return hotelid;
    }

    public void setHotelid(int hotelid) {
        this.hotelid = hotelid;
    }

    public int getFacilityid() {
        return facilityid;
    }

    public void setFacilityid(int facilityid) {
        this.facilityid = facilityid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) hotelid;
        hash += (int) facilityid;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HotelFacilitiesPK)) {
            return false;
        }
        HotelFacilitiesPK other = (HotelFacilitiesPK) object;
        if (this.hotelid != other.hotelid) {
            return false;
        }
        if (this.facilityid != other.facilityid) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bootcamp.project.lmb.model.HotelFacilitiesPK[ hotelid=" + hotelid + ", facilityid=" + facilityid + " ]";
    }
    
}
