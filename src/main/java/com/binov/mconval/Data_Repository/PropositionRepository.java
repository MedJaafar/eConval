package com.binov.mconval.Data_Repository;





import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;



import com.binov.mconval.business.models.Proposition;


public interface PropositionRepository extends JpaRepository<Proposition,int[]> {

	Proposition findByIdProposition(int idProposition) ;
	List<Proposition>findByReservation_IdReservation(int idReservation);
	
	
	
}
