package com.binov.mconval.Data_Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.binov.mconval.business.models.Role;

public interface RoleRepository extends JpaRepository <Role,int[]>{
	
	Role findByOperateur_idOperateur(int idOperateur);
	

}
