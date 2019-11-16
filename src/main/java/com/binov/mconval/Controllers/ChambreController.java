package com.binov.mconval.Controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.binov.mconval.DAO.IeConvalDAO;
import com.binov.mconval.business.models.M_conval;
import com.binov.mconval.business.models.Pathologie;

@Controller
public class ChambreController {

	@Autowired IeConvalDAO ieconvaldao;
	
	
	@RequestMapping(value="/mc/ajouterChambre")
	public String ajouterchambre(Model model){
		List<Pathologie> listpath = ieconvaldao.getPathologies();
		model.addAttribute("listPath", listpath);
		return "mc/ajouterChambre";
	}
	
	@RequestMapping(value="/mc/addChambre")
	public String AddChambre(HttpServletRequest request , Model model){
		String nbl = request.getParameter("nblits");
		int nblits = Integer.parseInt(nbl);
		M_conval mc = ieconvaldao.getCurrentOperateurMc().getM_conval();
		ieconvaldao.ajoutChambre(nblits, mc);
		String msgAdd = "<div class=\"alert alert-success\" role=\"alert\">* <Strong>1 Chambre</Strong> a &eacute;t&eacute; <strong>Ajout&eacute;e et Publi&eacute;e</strong> avec Succ&eacute;es.</div>" ; 
		model.addAttribute("msgAdd", msgAdd);
		
		return ajouterchambre(model);
		
	}
}
