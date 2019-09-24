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
@Table(name = "destination")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Destination.findAll", query = "SELECT d FROM Destination d")
    , @NamedQuery(name = "Destination.findById", query = "SELECT d FROM Destination d WHERE d.id = :id")
    , @NamedQuery(name = "Destination.findByName", query = "SELECT d FROM Destination d WHERE d.name = :name")
    , @NamedQuery(name = "Destination.findByDistancefromAthens", query = "SELECT d FROM Destination d WHERE d.distancefromAthens = :distancefromAthens")
    , @NamedQuery(name = "Destination.findByTicketcost", query = "SELECT d FROM Destination d WHERE d.ticketcost = :ticketcost")})
public class Destination implements Serializable {

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
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Distance_from_Athens")
    private Float distancefromAthens;
    @Column(name = "Ticket_cost")
    private Float ticketcost;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "destinationid")
    private Collection<Hotel> hotelCollection;

    public Destination() {
    }

    public Destination(Integer id) {
        this.id = id;
    }

    public Destination(Integer id, String name) {
        this.id = id;
        this.name = name;
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

    public Float getDistancefromAthens() {
        return distancefromAthens;
    }

    public void setDistancefromAthens(Float distancefromAthens) {
        this.distancefromAthens = distancefromAthens;
    }

    public Float getTicketcost() {
        return ticketcost;
    }

    public void setTicketcost(Float ticketcost) {
        this.ticketcost = ticketcost;
    }

    @XmlTransient
    public Collection<Hotel> getHotelCollection() {
        return hotelCollection;
    }

    public void setHotelCollection(Collection<Hotel> hotelCollection) {
        this.hotelCollection = hotelCollection;
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
        if (!(object instanceof Destination)) {
            return false;
        }
        Destination other = (Destination) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bootcamp.project.lmb.model.Destination[ id=" + id + " ]";
    }
    
}
