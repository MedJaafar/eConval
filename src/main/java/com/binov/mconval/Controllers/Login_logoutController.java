package com.binov.mconval.Controllers;

import java.util.List;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.binov.mconval.DAO.IeConvalDAO;
import com.binov.mconval.Data_Repository.HopitalRepository;
import com.binov.mconval.Data_Repository.MconvalRepository;
import com.binov.mconval.Data_Repository.OperateurRepository;
import com.binov.mconval.business.models.Hopital;
import com.binov.mconval.business.models.M_conval;


@Controller
public class Login_logoutController {
	

	
	@Autowired
	OperateurRepository operateurrepository ; 
	@Autowired
	IeConvalDAO ieconvaldao ; 
	@Autowired
	HopitalRepository hopitalrepository ;
	@Autowired
	MconvalRepository mconvalrepository ;
	@Autowired
	IeConvalDAO IeConvalDAO ;
	@Autowired 
	BCryptPasswordEncoder bcryptPasswordEncoder ;
	
	@RequestMapping( value = {"/login","/"} , method = RequestMethod.GET)
	public String Afficher_Login(Model model){
		  
		List<Hopital> hopitaux = ieconvaldao.consulterHopitaux() ;
		model.addAttribute("hopitaux",hopitaux );
		
		List<M_conval> mconval = ieconvaldao.consulterMc() ;
		model.addAttribute("mconval",mconval );
		  
		return "login";
		 
		}
	
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response , Model model) {
		
	     HttpSession session= request.getSession(false);
	        SecurityContextHolder.clearContext();
	             session= request.getSession(false);
	            if(session != null) {
	                session.invalidate();
	            }
	            for(Cookie cookie : request.getCookies()) {
	                cookie.setMaxAge(0);
	             }

	  String msgLogout = "<div class=\"alert alert-info\" role=\"alert\"><i class=\"fa fa-unlock\" aria-hidden=\"true\"></i> <strong> D&eacute;connexion Termin&eacute;e</strong></div>" ; 
	  model.addAttribute("msgLogout", msgLogout);
	    
	    return Afficher_Login(model);
	} 
	
	
	
	@RequestMapping(value="/creer_compte" ,  method = RequestMethod.POST)
	public String register (HttpServletRequest request , Model model){
		String msgSuccesCreation  ="";
		String nom = request.getParameter("nom") ; 
		String prenom = request.getParameter("prenom") ; 
		String username = request.getParameter("usernamenv") ; 
		String email = request.getParameter("emailnv") ; 
		String mdp = bcryptPasswordEncoder.encode(request.getParameter("mdpasse")) ; 
		String tel = request.getParameter("tel") ; 
		long telop = Long.parseLong(tel);
	
		String role = request.getParameter("role") ; 
	    String nommc = request.getParameter("mclist") ; 
		String nomho = request.getParameter("hopitallist") ;
		
		
		if(operateurrepository.findByUsername(username)!=null)
		{
			String msgError = "<div class=\"alert alert-danger alert-dismissible \" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>* <Strong>Ce nom d'utilisateur</Strong> existe d&eacute;ja, veuillez r&eacute;essayer !  </div>" ; 
			model.addAttribute("msgError", msgError);
			 
			return Afficher_Login(model); }
		
		else{ 
		if (role.equals("ho")){
			System.out.println(telop) ; 
			Hopital hopital =  hopitalrepository.findByNomHopital(nomho) ;
			ieconvaldao.creerOperateurHO(username, nommc, prenom, email, mdp, telop, role, hopital);
			 msgSuccesCreation = "<div class=\"alert alert-success\" role=\"alert\">* <Strong>1</Strong> Op�rateur Hopital a &eacute;t&eacute; <strong>Cr&eacute;&eacute;</strong> avec Succ&eacute;es.</div>" ;
		} else if(role.equals("mc")) { 
			
			M_conval mconval = mconvalrepository.findByNomMc(nommc) ;
			ieconvaldao.creerOperateurMc(username, nom, prenom, email, mdp, telop, role, mconval);
			 msgSuccesCreation = "<div class=\"alert alert-success\" role=\"alert\">* <Strong>1</Strong> Op�rateur Maison Convalescene a &eacute;t&eacute; <strong>Cr&eacute;&eacute;</strong> avec Succ&eacute;es.</div>" ;
			
		}
		model.addAttribute("msgCreation", msgSuccesCreation);
		}
		return Afficher_Login(model) ; 
	}

	
	
}