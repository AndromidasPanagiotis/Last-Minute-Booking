/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
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
@Table(name = "facilities")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Facilities.findAll", query = "SELECT f FROM Facilities f")
    , @NamedQuery(name = "Facilities.findById", query = "SELECT f FROM Facilities f WHERE f.id = :id")
    , @NamedQuery(name = "Facilities.findByName", query = "SELECT f FROM Facilities f WHERE f.name = :name")})
public class Facilities implements Serializable {

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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "facilities")
    @JsonBackReference
    private Collection<HotelFacilities> hotelFacilitiesCollection;

    public Facilities() {
    }

    public Facilities(Integer id) {
        this.id = id;
    }

    public Facilities(Integer id, String name) {
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

    @XmlTransient
    public Collection<HotelFacilities> getHotelFacilitiesCollection() {
        return hotelFacilitiesCollection;
    }

    public void setHotelFacilitiesCollection(Collection<HotelFacilities> hotelFacilitiesCollection) {
        this.hotelFacilitiesCollection = hotelFacilitiesCollection;
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
        if (!(object instanceof Facilities)) {
            return false;
        }
        Facilities other = (Facilities) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bootcamp.project.lmb.model.Facilities[ id=" + id + " ]";
    }
    
}
