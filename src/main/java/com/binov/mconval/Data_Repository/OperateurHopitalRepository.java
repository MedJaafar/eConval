package com.binov.mconval.Data_Repository;

import org.springframework.data.jpa.repository.JpaRepository;


import com.binov.mconval.business.models.Operateur_hopital;

public interface OperateurHopitalRepository extends JpaRepository<Operateur_hopital, int[]> {
	Operateur_hopital findByUsername(String username);

}
