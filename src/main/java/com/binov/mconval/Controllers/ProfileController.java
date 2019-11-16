package com.binov.mconval.Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;




import com.binov.mconval.Data_Repository.OperateurRepository;
import com.binov.mconval.business.models.Operateur;

@Controller
public class ProfileController {
	
	 
	private static final String PAGE_HTML_PROFILE = "profilem";
	 
	 @Autowired
	 private OperateurRepository operateur_repository ; 
	 
	
	
	@RequestMapping(value="/profilem",method = RequestMethod.GET )
	public String profile(Model model){
		try{
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication() ; 
		String username = auth.getName()  ;
		
		Operateur op = operateur_repository.findByUsername(username) ; 
		
		String nomcomplet = op.getPrenomOp()+" "+op.getNomOp() ;
		model.addAttribute("nomcomplet" , nomcomplet);
		
		String nomutilis = op.getUsername() ; 
		model.addAttribute("username" , nomutilis);
		
		String motdepasse = op.getPassword() ; 
		model.addAttribute("password" , motdepasse);
		
		String email = op.getEmailOp() ; 
		model.addAttribute("email" , email);
		
		Long tel = op.getTelOp() ;
		model.addAttribute("tel" , tel);
		
		}catch(NullPointerException e){} ; 
		return "profilem";
		}
	
	
	
	
	
 
    
    @RequestMapping(value = "/savemp", method = RequestMethod.POST)
   	public @ResponseBody String updatePassword(@RequestParam(value = "value") String password) {
   		Authentication auth = SecurityContextHolder.getContext().getAuthentication() ; 
   		String nom_itul = auth.getName()  ;
   		Operateur op =  operateur_repository.findByUsername(nom_itul) ;
   	 op.setPassword(password);
   		 operateur_repository.save(op);
   		  return PAGE_HTML_PROFILE;
   		}
	
    
    @RequestMapping(value = "/savemobile", method = RequestMethod.POST)
   	public @ResponseBody String updateMobile(@RequestParam(value = "value") String mobile, HttpServletRequest request) {
   		Authentication auth = SecurityContextHolder.getContext().getAuthentication() ; 
   		String nom_itul = auth.getName()  ;
   		Operateur op =  operateur_repository.findByUsername(nom_itul) ;
   		try{
   	    long tel = Long.parseLong(mobile);
   		op.setTelOp(tel);
   		 operateur_repository.save(op);
   		}catch (NumberFormatException e ){System.out.println("Erreur , ceci est un Num�ro de Telephone");}
   		  return "profilem";

	}

    @RequestMapping(value = "/savemail", method = RequestMethod.POST)
   	public @ResponseBody String updateEmail(@RequestParam(value = "value") String email, HttpServletRequest request) {
   		Authentication auth = SecurityContextHolder.getContext().getAuthentication() ; 
   		String nom_itul = auth.getName()  ;
   		Operateur op =  operateur_repository.findByUsername(nom_itul) ;
   		 op.setEmailOp(email);
   		 operateur_repository.save(op);
   		  return "profilem";
    
}
}
