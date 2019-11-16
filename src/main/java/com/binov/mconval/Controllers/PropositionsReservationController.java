package com.binov.mconval.Controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.binov.mconval.DAO.IeConvalDAO;
import com.binov.mconval.Data_Repository.ReservationRepository;
import com.binov.mconval.business.models.Hopital;
import com.binov.mconval.business.models.Reservation;

@Controller
public class PropositionsReservationController {
	
	@Autowired IeConvalDAO ieconvaldao  ;
	@Autowired ReservationRepository reservationrepository;
	

	@RequestMapping(value="/ho/propositions")
	public String showPropositions(Model model){
		
		Hopital hopital = ieconvaldao.getCurrentOperateurHo().getHopital();
		List<Reservation> listReservations = ieconvaldao.consulterParStatutEtHopital(hopital);
		model.addAttribute("reservationsList", listReservations);
		return "ho/Propositions";
        }
	
	@RequestMapping(value="/ho/accepterproposition")
	public String accepterProposition(Model model , HttpServletRequest request){
		
		String idRes= request.getParameter("idreservation");
		String idprop= request.getParameter("idproposition");
		int idReservation = Integer.parseInt(idRes);
		int idProposition = Integer.parseInt(idprop);
		ieconvaldao.passerReservation(idProposition,idReservation);
		String msgAdd = "<div class=\"alert alert-success\" role=\"alert\">* <Strong>1</Strong> Proposition a &eacute;t&eacute; <strong>valid&eacute;e</strong> avec Succ&eacute;es le Patient sera Transmis vers la Maison de Convalescence.</div>" ; 
		model.addAttribute("msgAdd",msgAdd);
		
		Reservation res= reservationrepository.findByIdReservation(idReservation);
		model.addAttribute("res", res);
		
	
		return "ho/ReservationAccept";
	}
	
}