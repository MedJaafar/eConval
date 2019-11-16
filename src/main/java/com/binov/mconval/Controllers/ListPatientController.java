package com.binov.mconval.Controllers;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.binov.mconval.DAO.IeConvalDAO;
import com.binov.mconval.Data_Repository.PatientRepository;
import com.binov.mconval.business.models.Operateur_hopital;
import com.binov.mconval.business.models.Pathologie;
import com.binov.mconval.business.models.Patient;

@Controller
public class ListPatientController {
	
@Autowired
IeConvalDAO ieconvalDao ; 
@Autowired
PatientRepository patientrepository ; 

@RequestMapping(value="/ho/listedesPatients" ,  method = RequestMethod.GET)
	public String showListdesPatients(Model model){
		Operateur_hopital op = ieconvalDao.getCurrentOperateurHo();
		int ho = op.getHopital().getIdHopital();
		 List<Patient> Patients = ieconvalDao.consulterPatientsParHopital(ho) ; 		 
			model.addAttribute("patients" , Patients) ;
			int taille = Patients.size() ;
			model.addAttribute("taille_list", taille);	
			List<Pathologie> listPathologie = ieconvalDao.getPathologies() ;
	    	model.addAttribute("listPath", listPathologie);
		return("ho/listedesPatients") ;
	}
	
	@RequestMapping(value="/ho/modalEnregistrer" , method = RequestMethod.POST)
	public String ajouterFromModal(Model model , HttpServletRequest request) throws ParseException {
		String msgAdd ; 
		String age = request.getParameter("age") ;
		int ageInt = Integer.parseInt(age) ; 
		String pathologie = request.getParameter("pathologie") ; 
		String commentaire = request.getParameter("commentaire") ;
		 String dateEntr = request.getParameter("dateEntr") ;
		 String dateSort = request.getParameter("dateSort") ;
		Operateur_hopital operateur = ieconvalDao.getCurrentOperateurHo() ;
			
		 //Condition sur La Date ajout Patient + PUBLICATION ou Ajout Patient
		
		 if ( !dateEntr.equals("") && !dateSort.equals("")){
			 SimpleDateFormat formatter = new SimpleDateFormat("dd-mm-yyyy");
			   Date dateEntree = formatter.parse(dateEntr);
		       Date dateSortie = formatter.parse(dateSort);
			 
		ieconvalDao.creerReservationEtPatient(dateEntree, dateSortie, operateur, ageInt, pathologie, commentaire);
		 msgAdd = "<div class=\"alert alert-success\" role=\"alert\">* <Strong>1</Strong> Patient op&eacute;r&eacute; a &eacute;t&eacute; <strong>Ajout&eacute; et Publi&eacute;</strong> avec Succ&eacute;es.</div>" ; 
		 } else {  ieconvalDao.ajouterPatient(ageInt, pathologie, commentaire, operateur ); 
		 msgAdd = "<div class=\"alert alert-success\" role=\"alert\">* <Strong>1</Strong> Patient op&eacute;r&eacute; a &eacute;t&eacute; <strong>ajout&eacute;</strong> avec Succ&eacute;es.</div>" ; 
		 }
		 
		//Affichage de ListeDesPatient apr�s Ajout
		 int ho = operateur.getHopital().getIdHopital() ;
		 List<Patient> Patients = ieconvalDao.consulterPatientsParHopital(ho) ;
			model.addAttribute("patients" , Patients ) ;
			int taille = Patients.size() ;
			model.addAttribute("taille_list", taille)  ;	
		 model.addAttribute("msgAdd", msgAdd);
     
		 List<Pathologie> listPathologie = ieconvalDao.getPathologies() ;
	    	model.addAttribute("listPath", listPathologie);
		return(showListdesPatients(model)) ;
	}
	
	@RequestMapping(value="/ho/publierpatient")
	public String publierPatient(HttpServletRequest request , Model model) throws ParseException {
		
		 String idpatient = request.getParameter("idpatientpub");
		 int idpatientPub = Integer.parseInt(idpatient);
		 String dateEntr = request.getParameter("dateentrPub") ;
		 String dateSort = request.getParameter("datesortPub") ;
		 SimpleDateFormat formatter = new SimpleDateFormat("dd-mm-yyyy");
		   Date dateEntree = formatter.parse(dateEntr);
	       Date dateSortie = formatter.parse(dateSort);
	       Operateur_hopital operateur = ieconvalDao.getCurrentOperateurHo() ;
	       
	       ieconvalDao.creerReservation(dateEntree, dateSortie, idpatientPub, operateur);
	     
	   String  msgAdd = "<div class=\"alert alert-success\" role=\"alert\">* <Strong>1</Strong> Patient op&eacute;r&eacute; a &eacute;t&eacute; <strong>Publi&eacute;</strong> avec Succ&eacute;es.</div>" ;
	   model.addAttribute("msgAdd", msgAdd);
		return showListdesPatients(model);
	}
	
	
	@RequestMapping("/ho/removePatient")
	
	public String removePatient(  Model model , HttpServletRequest request) {
		try {
		String idString = request.getParameter("idpatientsupprimer")  ; 
		int idpatient = Integer.parseInt(idString) ;
		ieconvalDao.removeReservation(idpatient);
		
	ieconvalDao.removePatient(idpatient);
	
	String msgRemove = "<div class=\"alert alert-danger alert-dismissible \" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>* <Strong>1</Strong> Patient  a &eacute;t&eacute; <strong>supprim&eacute; !</strong>  avec Succ&eacute;es.</div>" ; 	
		model.addAttribute("msgRemove", msgRemove) ;
		//Affichage de ListeDesPatient apr�s Ajout
		Operateur_hopital op = ieconvalDao.getCurrentOperateurHo();
		int ho = op.getHopital().getIdHopital();
		 List<Patient> Patients = ieconvalDao.consulterPatientsParHopital(ho) ; 
		 	model.addAttribute("patients" , Patients ) ;
			int taille = Patients.size() ;
			model.addAttribute("taille_list", taille)  ;	
			List<Pathologie> listPathologie = ieconvalDao.getPathologies() ;
	    	model.addAttribute("listPath", listPathologie);
	}catch (Exception e ){ this.showListdesPatients(model); }
	return showListdesPatients(model);
	}
	
	@RequestMapping(value="/ho/modifierPatient")
	public String modifier(Model model , HttpServletRequest request){
		String Id= request.getParameter("idmodif");
		int idmodif = Integer.parseInt(Id);
		String age1 = request.getParameter("agemodif");
		int age = Integer.parseInt(age1);
		String pathologie = request.getParameter("pathoModif");
		String commentaire = request.getParameter("commentModif");
		Patient patient = patientrepository.findByIdpatient(idmodif);
		patient.setAge(age);
		patient.setPathologie(pathologie);
		patient.setCommentaire(commentaire);
		patientrepository.save(patient);
		String  msgModif = "<div class=\"alert alert-success\" role=\"alert\">* <Strong>1</Strong> Patient  a &eacute;t&eacute; <strong>Modifi&eacute;</strong> avec Succ&eacute;es.</div>" ;
		model.addAttribute("msgModif", msgModif);
		return showListdesPatients(model) ; 
	}

}
	
	
	

