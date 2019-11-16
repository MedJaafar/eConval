package com.binov.mconval.DAO;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.binov.mconval.business.models.Chambre;
import com.binov.mconval.business.models.Hopital;
import com.binov.mconval.business.models.M_conval;
import com.binov.mconval.business.models.Notification;
import com.binov.mconval.business.models.NotificationHo;
import com.binov.mconval.business.models.Operateur;
import com.binov.mconval.business.models.Operateur_hopital;
import com.binov.mconval.business.models.Operateur_mc;
import com.binov.mconval.business.models.Pathologie;
import com.binov.mconval.business.models.Patient;
import com.binov.mconval.business.models.Reservation;


public interface IeConvalDAO {
	
	//Patient DAO
    public void ajouterPatient (int age , String pathologie , String commentaire , Operateur_hopital op  ) ;
	public List<Patient> consulterPatients() ;
	public List<Patient> consulterPatientsParHopital(int idhopital) ;
	public void removePatient(int idPatient) ; 
	public void removeReservation (int idPatient);
    
	
	//R�f�rentiel Pathologies 
	public List<Pathologie> getPathologies();
	
	//Operateur DAO
	public Operateur  getCurrentOperateur();
	
	public Operateur_hopital getCurrentOperateurHo();
	
	public Operateur_mc getCurrentOperateurMc();
	
	
	//Creer Operateur
	public void creerOperateurHO(String username , String nom , String prenom , String email , String password , long tel , String role , Hopital ho ) ;
	
	public void creerOperateurMc(String username , String nom , String prenom , String email , String password , long tel , String role , M_conval mc) ;
	
	
	//Reservation DAO
    public void passerReservation(int idProposition , int idReservation) ;
	public List<Reservation> listReservationParMc(M_conval mc );
	public void creerReservationEtPatient(Date dateaccueil ,Date datefin , Operateur_hopital operateur , int age , String pathologie , String commentaire );
	public void creerReservation(Date dateaccueil ,Date datefin ,int idpatient, Operateur_hopital operateur  );
	public List<Reservation> consulterPatientReservation(int idPatient  );
	public List<Reservation> consulterReservations() ;
	public List<Reservation> consulterParStatutEtHopital(Hopital hopital);
	
	//Hopital
	public List<Hopital> consulterHopitaux();
	
	//M-conval
	public List<M_conval> consulterMc();
	
	//Chambre 
	public List<Chambre> getChambre_Mc(M_conval mc);
	public void ajoutChambre (int nblits,M_conval mc);
	
	//Proposition
	public void envoyerProposition(int idres , int idchambre , M_conval mc , Date dateEntree , Date dateSortie , float prix );
	
	//Notification
	
	public List<Notification> notifHopital(Operateur_hopital opH);
	public List<NotificationHo> notifMc(Operateur_mc opMc) ;
	
}
