/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.repos;

import bootcamp.project.lmb.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Panos
 */

@Repository
@Transactional
public interface UserRepo extends JpaRepository <User, Integer> {
    
    @Modifying
    @Query(value = "UPDATE user SET active = 1 WHERE id = :id", nativeQuery = true)
    public void updateUserActivity(@Param("id") Integer id);
    

}
