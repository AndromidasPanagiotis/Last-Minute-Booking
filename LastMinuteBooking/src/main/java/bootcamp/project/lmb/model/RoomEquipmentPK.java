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
public class RoomEquipmentPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "Room_id")
    private int roomid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Hotel_id")
    private int hotelid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Equipment_id")
    private int equipmentid;

    public RoomEquipmentPK() {
    }

    public RoomEquipmentPK(int roomid, int hotelid, int equipmentid) {
        this.roomid = roomid;
        this.hotelid = hotelid;
        this.equipmentid = equipmentid;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public int getHotelid() {
        return hotelid;
    }

    public void setHotelid(int hotelid) {
        this.hotelid = hotelid;
    }

    public int getEquipmentid() {
        return equipmentid;
    }

    public void setEquipmentid(int equipmentid) {
        this.equipmentid = equipmentid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) roomid;
        hash += (int) hotelid;
        hash += (int) equipmentid;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RoomEquipmentPK)) {
            return false;
        }
        RoomEquipmentPK other = (RoomEquipmentPK) object;
        if (this.roomid != other.roomid) {
            return false;
        }
        if (this.hotelid != other.hotelid) {
            return false;
        }
        if (this.equipmentid != other.equipmentid) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bootcamp.project.lmb.model.RoomEquipmentPK[ roomid=" + roomid + ", hotelid=" + hotelid + ", equipmentid=" + equipmentid + " ]";
    }
    
}
