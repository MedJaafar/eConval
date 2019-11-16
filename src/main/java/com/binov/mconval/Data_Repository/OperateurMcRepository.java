package com.binov.mconval.Data_Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.binov.mconval.business.models.Operateur_mc;

public interface OperateurMcRepository extends JpaRepository<Operateur_mc, int[]>{
	Operateur_mc findByUsername(String username);
}
