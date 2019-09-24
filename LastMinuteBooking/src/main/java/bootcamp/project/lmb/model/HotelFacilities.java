/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Panos
 */
@Entity
@Table(name = "hotel_facilities")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "HotelFacilities.findAll", query = "SELECT h FROM HotelFacilities h")
    , @NamedQuery(name = "HotelFacilities.findByHotelid", query = "SELECT h FROM HotelFacilities h WHERE h.hotelFacilitiesPK.hotelid = :hotelid")
    , @NamedQuery(name = "HotelFacilities.findByFacilityid", query = "SELECT h FROM HotelFacilities h WHERE h.hotelFacilitiesPK.facilityid = :facilityid")})
public class HotelFacilities implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    @JsonManagedReference
    protected HotelFacilitiesPK hotelFacilitiesPK;
    @JoinColumn(name = "Hotel_id", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    @JsonBackReference
    private Hotel hotel;
    @JoinColumn(name = "Facility_id", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Facilities facilities;

    public HotelFacilities() {
    }

    public HotelFacilities(HotelFacilitiesPK hotelFacilitiesPK) {
        this.hotelFacilitiesPK = hotelFacilitiesPK;
    }

    public HotelFacilities(int hotelid, int facilityid) {
        this.hotelFacilitiesPK = new HotelFacilitiesPK(hotelid, facilityid);
    }

    public HotelFacilitiesPK getHotelFacilitiesPK() {
        return hotelFacilitiesPK;
    }

    public void setHotelFacilitiesPK(HotelFacilitiesPK hotelFacilitiesPK) {
        this.hotelFacilitiesPK = hotelFacilitiesPK;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public Facilities getFacilities() {
        return facilities;
    }

    public void setFacilities(Facilities facilities) {
        this.facilities = facilities;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (hotelFacilitiesPK != null ? hotelFacilitiesPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HotelFacilities)) {
            return false;
        }
        HotelFacilities other = (HotelFacilities) object;
        if ((this.hotelFacilitiesPK == null && other.hotelFacilitiesPK != null) || (this.hotelFacilitiesPK != null && !this.hotelFacilitiesPK.equals(other.hotelFacilitiesPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bootcamp.project.lmb.model.HotelFacilities[ hotelFacilitiesPK=" + hotelFacilitiesPK + " ]";
    }
    
}
