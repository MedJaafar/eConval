package com.binov.mconval.Data_Repository;


import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.binov.mconval.business.models.Chambre;
import com.binov.mconval.business.models.Hopital;
import com.binov.mconval.business.models.M_conval;
import com.binov.mconval.business.models.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, int[]> {
		
	List<Reservation>  findByPatient_idpatient(int idPatient);
	Reservation findByIdReservation(int idres) ;
	List<Reservation> findByProposition_Mconval(M_conval Mconval) ; 
	//List<Reservation> findByChambre(Chambre c );
	//List<Reservation> findByStatutIsFalseAndHopital(Hopital Hopital);
	
	
	 //@Query("select r from Reservation r where r.idhopital = :x and statut = false")
	 //List<Reservation> reservationParStatut_Hopital(@Param("x")int idHopital);
	
	
	
	

}
