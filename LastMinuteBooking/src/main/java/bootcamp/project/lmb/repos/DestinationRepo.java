/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.repos;

import bootcamp.project.lmb.model.Destination;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Panos
 */

@Repository
public interface DestinationRepo extends JpaRepository <Destination, Integer> {
    
    @Query(value="select * from destination where Id=?1 ;", nativeQuery=true)
    Destination getDestinationById(Integer id);
}
