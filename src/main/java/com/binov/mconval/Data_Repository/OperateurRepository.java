package com.binov.mconval.Data_Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.binov.mconval.business.models.Hopital;
import com.binov.mconval.business.models.Operateur;


public interface OperateurRepository extends JpaRepository<Operateur, int[]> {
     
	
	Operateur findByUsername(String username);
	
	
}
