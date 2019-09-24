/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Panos
 */
@Entity
@Table(name = "room")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Room.findAll", query = "SELECT r FROM Room r")
    , @NamedQuery(name = "Room.findById", query = "SELECT r FROM Room r WHERE r.id = :id")
    , @NamedQuery(name = "Room.findByName", query = "SELECT r FROM Room r WHERE r.name = :name")
    , @NamedQuery(name = "Room.findByCapacity", query = "SELECT r FROM Room r WHERE r.capacity = :capacity")
    , @NamedQuery(name = "Room.findByDescription", query = "SELECT r FROM Room r WHERE r.description = :description")
    , @NamedQuery(name = "Room.findByPricepernight", query = "SELECT r FROM Room r WHERE r.pricepernight = :pricepernight")})
public class Room implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "Name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Capacity")
    private int capacity;
    @Size(max = 45)
    @Column(name = "Description")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Price_per_night")
    private float pricepernight;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "room")
    private Collection<RoomEquipment> roomEquipmentCollection;
    @JoinColumn(name = "Hotel_id", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private Hotel hotelid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "room")
    private Collection<RoomStatus> roomStatusCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "roomid")
    private Collection<RoomUnavailability> roomUnavailabilityCollection;

    public Room() {
    }

    public Room(Integer id) {
        this.id = id;
    }

    public Room(Integer id, String name, int capacity, float pricepernight) {
        this.id = id;
        this.name = name;
        this.capacity = capacity;
        this.pricepernight = pricepernight;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPricepernight() {
        return pricepernight;
    }

    public void setPricepernight(float pricepernight) {
        this.pricepernight = pricepernight;
    }

    @XmlTransient
    public Collection<RoomEquipment> getRoomEquipmentCollection() {
        return roomEquipmentCollection;
    }

    public void setRoomEquipmentCollection(Collection<RoomEquipment> roomEquipmentCollection) {
        this.roomEquipmentCollection = roomEquipmentCollection;
    }

    public Hotel getHotelid() {
        return hotelid;
    }

    public void setHotelid(Hotel hotelid) {
        this.hotelid = hotelid;
    }

    @XmlTransient
    public Collection<RoomStatus> getRoomStatusCollection() {
        return roomStatusCollection;
    }

    public void setRoomStatusCollection(Collection<RoomStatus> roomStatusCollection) {
        this.roomStatusCollection = roomStatusCollection;
    }

    @XmlTransient
    public Collection<RoomUnavailability> getRoomUnavailabilityCollection() {
        return roomUnavailabilityCollection;
    }

    public void setRoomUnavailabilityCollection(Collection<RoomUnavailability> roomUnavailabilityCollection) {
        this.roomUnavailabilityCollection = roomUnavailabilityCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Room)) {
            return false;
        }
        Room other = (Room) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bootcamp.project.lmb.model.Room[ id=" + id + " ]";
    }
    
}
