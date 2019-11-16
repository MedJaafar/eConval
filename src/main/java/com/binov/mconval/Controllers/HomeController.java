package com.binov.mconval.Controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.binov.mconval.DAO.IeConvalDAO;
import com.binov.mconval.Data_Repository.RoleRepository;
import com.binov.mconval.business.models.Operateur;
import com.binov.mconval.business.models.Operateur_hopital;
import com.binov.mconval.business.models.Operateur_mc;
import com.binov.mconval.business.models.Role;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	 @Autowired
	 IeConvalDAO ieconvaldao ;
	 @Autowired
	 private RoleRepository rolerepository ; 
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/ho/home", method = RequestMethod.GET)
	public String homehopital(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("dd/M/yyyy")  ;
		  Operateur_hopital operateur1 = ieconvaldao.getCurrentOperateurHo() ; 
		  String operateur =  operateur1.getPrenomOp()+" "+operateur1.getNomOp() ;
		  String nomhopital =  operateur1.getHopital().getNomHopital() ; 
		  model.addAttribute("hopital" , nomhopital);
		    model.addAttribute("username" , operateur);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "ho/home";
	}
	
	@RequestMapping(value = "/mc/home_mc" , method = RequestMethod.GET)
	public String homeMc(Locale locale, Model model ) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("dd/M/yyyy")  ;
		  
		  Operateur_mc operateur1 = ieconvaldao.getCurrentOperateurMc() ; 
		  String operateur =  operateur1.getPrenomOp()+" "+operateur1.getNomOp() ;
		  String nomhopital =  operateur1.getM_conval().getNomMc() ; 
		  model.addAttribute("hopital" , nomhopital);
		    model.addAttribute("username" , operateur);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "mc/home_mc";
	}
	
	
		
	


	
	}

