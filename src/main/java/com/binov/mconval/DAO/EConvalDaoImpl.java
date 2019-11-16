package com.binov.mconval.DAO;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.LazyInitializationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.binov.mconval.Data_Repository.ChambreRepository;
import com.binov.mconval.Data_Repository.HopitalRepository;
import com.binov.mconval.Data_Repository.MconvalRepository;
import com.binov.mconval.Data_Repository.NotificationHoRepository;
import com.binov.mconval.Data_Repository.NotificationRepository;
import com.binov.mconval.Data_Repository.OperateurHopitalRepository;
import com.binov.mconval.Data_Repository.OperateurMcRepository;
import com.binov.mconval.Data_Repository.OperateurRepository;
import com.binov.mconval.Data_Repository.PathologieRepository;
import com.binov.mconval.Data_Repository.PatientRepository;
import com.binov.mconval.Data_Repository.PropositionRepository;
import com.binov.mconval.Data_Repository.ReservationRepository;
import com.binov.mconval.Data_Repository.RoleRepository;
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
import com.binov.mconval.business.models.Proposition;
import com.binov.mconval.business.models.Proposition.statut;
import com.binov.mconval.business.models.Reservation;
import com.binov.mconval.business.models.Role;

@Component
public class EConvalDaoImpl implements IeConvalDAO {
@Autowired
PatientRepository patientrepository ;
@Autowired
OperateurRepository operateurrep ;
@Autowired
ReservationRepository reservationrep ;
@Autowired
HopitalRepository hopitalrepository ; 
@Autowired
MconvalRepository mconvalrepository ; 
@Autowired
RoleRepository rolerepository ; 
@Autowired
OperateurHopitalRepository operateurhorepository ;
@Autowired
OperateurMcRepository operateurmcrepository ;
@Autowired
PathologieRepository pathologierepository ; 
@Autowired
ChambreRepository chambrerepository ; 
@Autowired
NotificationHoRepository notificationhorepository;
@Autowired 
PropositionRepository propositionrepository ; 
@Autowired NotificationRepository notificationrepository;



	@Override
	public List<Patient> consulterPatients()  {
	List<Patient> patients =  patientrepository.findAll() ;  
		return patients ; 
	}

	@Override
	public Operateur_hopital getCurrentOperateurHo(){
		Operateur_hopital op ; 
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 String username =  auth.getName() ;
		 op = operateurhorepository.findByUsername(username) ;
		return op ; 
	}

	@Override
	public Operateur_mc getCurrentOperateurMc() {
	Operateur_mc op ; 
	 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	 String username =  auth.getName() ;
	 op = operateurmcrepository.findByUsername(username);
		return op;
	}

	
	@Override
	public void ajouterPatient(int age, String pathologie, String commentaire,
			Operateur_hopital op  ) {
		
		Patient patient = new Patient() ; 
		patient.setAge(age);
		patient.setPathologie(pathologie);
		patient.setCommentaire(commentaire);
		Hopital ho = op.getHopital();
		patient.setHopital(ho);
		patient.setOperateur(op);
		
		patientrepository.save(patient)  ;
}

	@Override
	public void removePatient(int idPatient) {
		Patient patient = new Patient() ; 
		patient = patientrepository.findByIdpatient(idPatient) ; 
		patientrepository.delete(patient);
	
	}

	//Reservations
	
	@Override
	public List<Reservation> consulterPatientReservation(int idPatient) {
		List<Reservation> list =  reservationrep.findByPatient_idpatient(idPatient);
		return list;
	}
	
	
	@Override
	public void creerReservationEtPatient(Date dateaccueil, Date datefin,Operateur_hopital operateur,  int age, String pathologie, String commentaire) 
	{
		Patient patient = new Patient() ; 
		patient.setAge(age);
		patient.setPathologie(pathologie);
		patient.setCommentaire(commentaire);
		Hopital ho = operateur.getHopital();
		patient.setHopital(ho);
		patient.setOperateur(operateur);
		patient.setPublier(true);
		patientrepository.save(patient)  ;
		Reservation reservation = new Reservation() ; 
		Date date = new Date();
		Date datecreation =  date ; 
		reservation.setDatecreation(datecreation);
		reservation.setDateaccueil(dateaccueil);
		reservation.setDatefin(datefin);
		reservation.setOperateur(operateur);
		reservation.setPatient(patient);
		reservation.setHopital(operateur.getHopital());
		reservation.setStatut(false);
		reservationrep.save(reservation)  ; 
		
		
	}
//Select tout les hopitaux et les Mc 
	@Override
	public List<Hopital> consulterHopitaux() {
		List<Hopital> list = hopitalrepository.findAll() ;
		return list;
	}
    @Override
	public List<M_conval> consulterMc() {
	List<M_conval> list = mconvalrepository.findAll() ;
		return list;
	}

	
	//Creation Nouveaux Utilisateurs
	@Override
	public void creerOperateurHO(String username, String nom, String prenom,
			String email, String password, long tel, String role, Hopital ho) {
		Operateur_hopital opHopital = new Operateur_hopital() ;
		opHopital.setNomOp(nom);
		opHopital.setPrenomOp(prenom);
		opHopital.setUsername(username);
		opHopital.setEmailOp(email);
		opHopital.setPassword(password);
		opHopital.setActivated(true);
		opHopital.setTelOp(tel);
		opHopital.setHopital(ho);
	operateurrep.save(opHopital);
	 opHopital = operateurhorepository.findByUsername(username);
  Role roleho  = new Role () ;
	roleho.setRoleName(role);
	roleho.setOperateur(opHopital);
	rolerepository.save(roleho);
	}

	@Override
	public void creerOperateurMc(String username, String nom, String prenom,
			String email, String password, long tel, String role, M_conval mc) {
		Operateur_mc opMc = new Operateur_mc() ;
		opMc.setNomOp(nom);
		opMc.setPrenomOp(prenom);
		opMc.setUsername(username);
		opMc.setEmailOp(email);
		opMc.setPassword(password);
		opMc.setActivated(true);
		opMc.setTelOp(tel);
		opMc.setM_conval(mc);
		operateurrep.save(opMc);
		opMc = operateurmcrepository.findByUsername(username);
		Role rolemc = new Role() ; 
		rolemc.setRoleName(role);
		rolemc.setOperateur(opMc);
		rolerepository.save(rolemc) ;
	}

	@Override
	public List<Patient> consulterPatientsParHopital(int idHopital) {
		List<Patient> patients1 =  patientrepository.findAll();  
		List<Patient> patients = new ArrayList<Patient>() ;
		for (int i=0 ; i< patients1.size(); i++){
		if (patients1.get(i).getHopital().getIdHopital()== idHopital){
			patients.add(patients1.get(i));
		}
			
		}
		return patients ; 
		
	}

	//Referentiel ( Pathologie ) 
	@Override
	public List<Pathologie> getPathologies() {
		return pathologierepository.findAll();
	}

	@Override
	public void creerReservation(Date dateaccueil, Date datefin,int idpatient,
			Operateur_hopital operateur
			) {
		
		 Reservation reservation = new Reservation() ; 
			Patient patient = patientrepository.findByIdpatient(idpatient);
		 Date date = new Date();
		 Date datecreation =  date ; 
		 reservation.setDatecreation(datecreation);
		 reservation.setDateaccueil(dateaccueil);
		 reservation.setDatefin(datefin);
		 reservation.setOperateur(operateur);
		 reservation.setPatient(patient);
		 reservation.setHopital(operateur.getHopital());
		 reservation.setStatut(false);
		 patient.setPublier(true);
		 
		 patientrepository.save(patient);
		 reservationrep.save(reservation)  ; 
		
		
	}

	@Override
	public List<Reservation> consulterReservations() {
		return reservationrep.findAll();
		
	}

	@Override
	public void removeReservation(int idPatient) {
		List<Reservation> listres = reservationrep.findByPatient_idpatient(idPatient);
		if (listres.size()!=0){
			for (int i=0 ; i< listres.size(); i++){
				reservationrep.delete(listres.get(i));
			}
		}
	}

	@Override
	public List<Chambre> getChambre_Mc(M_conval mc) {
	List <Chambre> list1= chambrerepository.findByMconval(mc);
	List<Chambre>list2 = new ArrayList<Chambre>() ;
	 for(int i=0 ; i<list1.size(); i++){
		if (list1.get(i).getNblits() > list1.get(i).getNboccupants()){
			list2.add(list1.get(i));
		}
	 }
	return list2; }

	@Override
	public void envoyerProposition(int idres, int idchambre,M_conval mc, Date dateEntree, Date dateSortie, float prix) {
		Proposition proposition = new Proposition() ;
		Reservation res = reservationrep.findByIdReservation(idres);
		Chambre chambre = chambrerepository.findByIdChambre(idchambre);
		proposition.setReservation(res);
		proposition.setChambre(chambre);
		proposition.setMconval(mc);
		proposition.setDate_debut_sejour_prop(dateEntree);
		proposition.setDate_fin_sejour_prop(dateSortie);
		proposition.setPrix(prix);
		proposition.setStatut(statut.enattente);
		Date date = new Date();
		proposition.setDate_Envoie(date);
		proposition.setDate_temps_envoie(date);
		Notification notification = new Notification();
		notification.setDatenotif(date);
		notification.setProposition(proposition);
		notification.setViewed(false);
		notification.setMessage(" "+mc.getNomMc() +"  vous a envoy&eacute; une Proposition pour Acceuillir le Patient : " +res.getPatient().getIdpatient() );
		propositionrepository.save(proposition);
		notificationrepository.save(notification);
		}

	@Override
	public List<Reservation> listReservationParMc(M_conval mc)  {
		List <Reservation> list1 = reservationrep.findByProposition_Mconval(mc);
		List<Reservation> list2 = reservationrep.findAll();
 		for (int i = 0; i < list1.size();i++){
 			for(int j = 0 ; j<list2.size();j++){
 				if (list1.get(i).getIdReservation()==list2.get(j).getIdReservation()){
 					list2.remove(list2.get(j));
 				}
 			}
 		}
 	
	return list2 ;
	}

	@Override
	public List<Reservation> consulterParStatutEtHopital(Hopital hopital) {
		int idHopital = hopital.getIdHopital() ;
		List<Reservation> reservations1 =  reservationrep.findAll();  
		List<Reservation> reservations2 = new ArrayList<Reservation>() ;
		for (int i=0 ; i< reservations1.size(); i++){
		if ((reservations1.get(i).getHopital().getIdHopital()== idHopital)&&(reservations1.get(i).getStatut()==false)){
			reservations2.add(reservations1.get(i));
		}
			
		}
		return reservations2 ; 
	}

	@Override
	public void passerReservation(int idProposition, int idReservation) {
		Reservation reservation = reservationrep.findByIdReservation(idReservation);
		Proposition proposition = propositionrepository.findByIdProposition(idProposition);
		
		List<Proposition>  listprop =propositionrepository.findByReservation_IdReservation(idReservation);
		for(int i=0 ; i< listprop.size(); i++){
			listprop.get(i).setStatut(statut.refus); 
			propositionrepository.save(listprop.get(i));
			}
		
		proposition.setStatut(statut.accept);
		reservation.setM_conval(proposition.getMconval());
		reservation.setChambre(proposition.getChambre());
		Date date = new Date();
		reservation.setDateconfirm(date);
		reservation.setStatut(true);
		reservation.setDateaccueil(proposition.getDate_debut_sejour_prop());
		reservation.setDatefin(proposition.getDate_fin_sejour_prop());
		int idchambre = proposition.getChambre().getIdChambre();
		Chambre chambre= chambrerepository.findByIdChambre(idchambre);
		chambre.setNboccupants(chambre.getNboccupants()+1);
		NotificationHo notif = new NotificationHo() ;
		notif.setReservation(reservation);
		notif.setDatenotif(date);
		notif.setMessage(reservation.getHopital().getNomHopital()+" a accepté votre proposition pour accueillir le Patient "+reservation.getIdReservation());
		chambrerepository.save(chambre);
		reservationrep.save(reservation);
		propositionrepository.save(proposition);
		notificationhorepository.save(notif);
		
		
		
	}

	@Override
	public void ajoutChambre(int nblits,M_conval mc) {
		Chambre chambre = new Chambre() ;
		
		chambre.setMconval(mc);
		chambre.setNblits(nblits);
		chambrerepository.save(chambre);
		
	}

	@Override
	public Operateur getCurrentOperateur() {
		Operateur op ; 
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 String username =  auth.getName() ;
		 op = operateurrep.findByUsername(username);
			return op;
		
	}

	@Override
	public List<Notification> notifHopital(Operateur_hopital opH) throws LazyInitializationException{
		Hopital hopital = opH.getHopital();
		List<Notification> notifList = notificationrepository.findAll();
		List<Notification> notifList2 = new ArrayList<Notification>();
		for(Notification notif : notifList){
			if((notif.getProposition().getReservation().getHopital().getIdHopital()==hopital.getIdHopital())&&(!(notif.isViewed()))){
				notifList2.add(notif);}
		}
		return notifList2;
	}

	@Override
	public List<NotificationHo> notifMc(Operateur_mc opMc) {
		M_conval mc = opMc.getM_conval();
		 List<NotificationHo> notifList = notificationhorepository.findAll();
		 List<NotificationHo> notifList2 = new ArrayList<NotificationHo>();
		 for(int i=0 ; i< notifList.size(); i++){
			 if(notifList.get(i).getReservation().getM_conval().getIdMc()==mc.getIdMc()){
				 notifList2.add(notifList.get(i));
			 }
		 }
		return notifList2;
	}



	
} 
