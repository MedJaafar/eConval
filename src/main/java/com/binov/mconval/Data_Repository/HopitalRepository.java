package com.binov.mconval.Data_Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.binov.mconval.business.models.Hopital;


public interface HopitalRepository  extends JpaRepository<Hopital, int[]>{
	
	Hopital findByIdHopital(int idhopital);
	Hopital findByNomHopital(String nomhopital) ;
	

} 
