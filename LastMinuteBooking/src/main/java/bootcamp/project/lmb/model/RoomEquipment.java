/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.model;

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
@Table(name = "room_equipment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RoomEquipment.findAll", query = "SELECT r FROM RoomEquipment r")
    , @NamedQuery(name = "RoomEquipment.findByRoomid", query = "SELECT r FROM RoomEquipment r WHERE r.roomEquipmentPK.roomid = :roomid")
    , @NamedQuery(name = "RoomEquipment.findByHotelid", query = "SELECT r FROM RoomEquipment r WHERE r.roomEquipmentPK.hotelid = :hotelid")
    , @NamedQuery(name = "RoomEquipment.findByEquipmentid", query = "SELECT r FROM RoomEquipment r WHERE r.roomEquipmentPK.equipmentid = :equipmentid")})
public class RoomEquipment implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected RoomEquipmentPK roomEquipmentPK;
    @JoinColumn(name = "Hotel_id", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Hotel hotel;
    @JoinColumn(name = "Room_id", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Room room;
    @JoinColumn(name = "Equipment_id", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Equipment equipment;

    public RoomEquipment() {
    }

    public RoomEquipment(RoomEquipmentPK roomEquipmentPK) {
        this.roomEquipmentPK = roomEquipmentPK;
    }

    public RoomEquipment(int roomid, int hotelid, int equipmentid) {
        this.roomEquipmentPK = new RoomEquipmentPK(roomid, hotelid, equipmentid);
    }

    public RoomEquipmentPK getRoomEquipmentPK() {
        return roomEquipmentPK;
    }

    public void setRoomEquipmentPK(RoomEquipmentPK roomEquipmentPK) {
        this.roomEquipmentPK = roomEquipmentPK;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Equipment getEquipment() {
        return equipment;
    }

    public void setEquipment(Equipment equipment) {
        this.equipment = equipment;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (roomEquipmentPK != null ? roomEquipmentPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RoomEquipment)) {
            return false;
        }
        RoomEquipment other = (RoomEquipment) object;
        if ((this.roomEquipmentPK == null && other.roomEquipmentPK != null) || (this.roomEquipmentPK != null && !this.roomEquipmentPK.equals(other.roomEquipmentPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bootcamp.project.lmb.model.RoomEquipment[ roomEquipmentPK=" + roomEquipmentPK + " ]";
    }
    
}
