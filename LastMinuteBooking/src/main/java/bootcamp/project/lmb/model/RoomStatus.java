/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Panos
 */
@Entity
@Table(name = "room_status")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RoomStatus.findAll", query = "SELECT r FROM RoomStatus r")
    , @NamedQuery(name = "RoomStatus.findByHotelId", query = "SELECT r FROM RoomStatus r WHERE r.roomStatusPK.hotelId = :hotelId")
    , @NamedQuery(name = "RoomStatus.findByRoomId", query = "SELECT r FROM RoomStatus r WHERE r.roomStatusPK.roomId = :roomId")
    , @NamedQuery(name = "RoomStatus.findByEndDate", query = "SELECT r FROM RoomStatus r WHERE r.endDate = :endDate")
    , @NamedQuery(name = "RoomStatus.findByNotAvailable", query = "SELECT r FROM RoomStatus r WHERE r.notAvailable = :notAvailable")
    , @NamedQuery(name = "RoomStatus.findByStartDate", query = "SELECT r FROM RoomStatus r WHERE r.startDate = :startDate")})
public class RoomStatus implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected RoomStatusPK roomStatusPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "end_date")
    @Temporal(TemporalType.DATE)
    private Date endDate;
    @Column(name = "not_available")
    private Short notAvailable;
    @Basic(optional = false)
    @NotNull
    @Column(name = "start_date")
    @Temporal(TemporalType.DATE)
    private Date startDate;
    @JoinColumn(name = "room_id", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Room room;
    @JoinColumn(name = "hotel_id", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Hotel hotel;

    public RoomStatus() {
    }

    public RoomStatus(RoomStatusPK roomStatusPK) {
        this.roomStatusPK = roomStatusPK;
    }

    public RoomStatus(RoomStatusPK roomStatusPK, Date endDate, Date startDate) {
        this.roomStatusPK = roomStatusPK;
        this.endDate = endDate;
        this.startDate = startDate;
    }

    public RoomStatus(int hotelId, int roomId) {
        this.roomStatusPK = new RoomStatusPK(hotelId, roomId);
    }

    public RoomStatusPK getRoomStatusPK() {
        return roomStatusPK;
    }

    public void setRoomStatusPK(RoomStatusPK roomStatusPK) {
        this.roomStatusPK = roomStatusPK;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Short getNotAvailable() {
        return notAvailable;
    }

    public void setNotAvailable(Short notAvailable) {
        this.notAvailable = notAvailable;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (roomStatusPK != null ? roomStatusPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RoomStatus)) {
            return false;
        }
        RoomStatus other = (RoomStatus) object;
        if ((this.roomStatusPK == null && other.roomStatusPK != null) || (this.roomStatusPK != null && !this.roomStatusPK.equals(other.roomStatusPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bootcamp.project.lmb.model.RoomStatus[ roomStatusPK=" + roomStatusPK + " ]";
    }
    
}
