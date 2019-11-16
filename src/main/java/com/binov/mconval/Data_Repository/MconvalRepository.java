package com.binov.mconval.Data_Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.binov.mconval.business.models.M_conval;

public interface MconvalRepository extends JpaRepository<M_conval, int[]> {

	M_conval findByIdMc(int idmc);
	M_conval findByNomMc(String nomMc) ; 
}
