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

import com.binov.mconval.DAO.IeConvalDAO;
import com.binov.mconval.Data_Repository.ReservationRepository;
import com.binov.mconval.business.models.Chambre;
import com.binov.mconval.business.models.M_conval;
import com.binov.mconval.business.models.Operateur_mc;
import com.binov.mconval.business.models.Reservation;


@Controller
public class Patient_PropositionsEnvoyerController {
	
	@Autowired 
	IeConvalDAO ieconvaldao ;
	@Autowired
	ReservationRepository resrep;
	
	@RequestMapping(value="/mc/consulterPatients")
	public String ShowConsultPatients(Model model){
	Operateur_mc operateur =	ieconvaldao.getCurrentOperateurMc();
	M_conval mc = operateur.getM_conval();
	List<Reservation> listres = ieconvaldao.listReservationParMc(mc);
	model.addAttribute("reservations", listres) ;
	 int listtaille = listres.size() ; 
	  model.addAttribute("listtaille", listtaille);
	List<Chambre> listChambre = ieconvaldao.getChambre_Mc(operateur.getM_conval());
	if (listChambre.size() == 0){ String msg = "<div class=\"alert alert-danger alert-dismissible\" role=\"alert\">* Il n y a Plus de <strong>Chambres Disponibles</strong>.</div>";
	model.addAttribute("msgChambre", msg);} 
	model.addAttribute("listChambre", listChambre);
   
	
	return "mc/consulterPatients" ;
	}

	@RequestMapping("/mc/envoyerPropostion")
	public String envoyerProposition(Model model , HttpServletRequest request) throws ParseException{
		
		String idresString = request.getParameter("idreservation");
		int idReservation = Integer.parseInt(idresString);
		String prixString = request.getParameter("prix");
		float prix = Float.parseFloat(prixString);
		String chambre = request.getParameter("chambre") ;
		int idChambre = Integer.parseInt(chambre) ;
		String dateEntr = request.getParameter("dateEntr") ;
		String dateSort = request.getParameter("dateSort");
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		   Date dateEntree = formatter.parse(dateEntr);
	       Date dateSortie = formatter.parse(dateSort);
	      String hop = resrep.findByIdReservation(idReservation).getHopital().getNomHopital() ; 
	       
	    String msgAdd = "<div class=\"alert alert-success\" role=\"alert\">* <Strong>Une Proposition</Strong> a &eacute;t&eacute; <strong>Envoy&eacute;e</strong> avec Succ&eacute;es a <Strong>"+hop+"</Strong> .</div>" ; 
	    M_conval mc =  ieconvaldao.getCurrentOperateurMc().getM_conval();
	    
	    ieconvaldao.envoyerProposition(idReservation, idChambre, mc, dateEntree, dateSortie, prix);
	    
	     model.addAttribute("msgAdd", msgAdd)  ;
		return ShowConsultPatients(model) ; 
	}
}
