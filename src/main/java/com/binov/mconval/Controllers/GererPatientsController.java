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
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import com.binov.mconval.DAO.IeConvalDAO;
import com.binov.mconval.Data_Repository.PatientRepository;
import com.binov.mconval.business.models.Operateur_hopital;
import com.binov.mconval.business.models.Pathologie;



@Controller
public class GererPatientsController extends WebMvcConfigurerAdapter {
	
	@Autowired
	PatientRepository patientrepository  ; 
	@Autowired
	IeConvalDAO ieconvaldao ; 
	
	
	
	
    @RequestMapping(value="/ho/ajouterPatient", method = RequestMethod.GET)
    public String showAjoutPatient(Model model ){
    	List<Pathologie> listPathologie = ieconvaldao.getPathologies() ;
    	model.addAttribute("listPath", listPathologie);
    	return("ho/ajouterPatient") ; 
    }

	  @RequestMapping(value="/ho/ajouterPatient/save", method = RequestMethod.POST)
	  public String AjouterPatient( HttpServletRequest request , Model model) throws ParseException{
		  
			Operateur_hopital op =ieconvaldao.getCurrentOperateurHo()	;
			
		   
			String age = request.getParameter("age");
			int ageint = Integer.parseInt(age) ; 
		    String pathologie = request.getParameter("pathologie") ; 
			String commentaire = request.getParameter("commentaire") ; 
			 String dateEntr = request.getParameter("dateEntr") ;
			 String dateSort = request.getParameter("dateSort") ;
			 
			 if ( !dateEntr.equals("") && !dateSort.equals("")){
				 SimpleDateFormat formatter = new SimpleDateFormat("dd-mm-yyyy");
				   Date dateEntree = formatter.parse(dateEntr);
			       Date dateSortie = formatter.parse(dateSort);
			   	ieconvaldao.creerReservationEtPatient(dateEntree, dateSortie, op, ageint, pathologie, commentaire);
			 }else
			 {
		    ieconvaldao.ajouterPatient(ageint, pathologie, commentaire, op); }
		
			return "redirect:/ho/ajouterPatient"; } 
	  
	
		  }
			
			
		
		
	
		

	
	

