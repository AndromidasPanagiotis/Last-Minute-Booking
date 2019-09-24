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
public class RoomStatusPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "hotel_id")
    private int hotelId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "room_id")
    private int roomId;

    public RoomStatusPK() {
    }

    public RoomStatusPK(int hotelId, int roomId) {
        this.hotelId = hotelId;
        this.roomId = roomId;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) hotelId;
        hash += (int) roomId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RoomStatusPK)) {
            return false;
        }
        RoomStatusPK other = (RoomStatusPK) object;
        if (this.hotelId != other.hotelId) {
            return false;
        }
        if (this.roomId != other.roomId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bootcamp.project.lmb.model.RoomStatusPK[ hotelId=" + hotelId + ", roomId=" + roomId + " ]";
    }
    
}
