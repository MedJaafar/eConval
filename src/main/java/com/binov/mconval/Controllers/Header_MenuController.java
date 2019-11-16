package com.binov.mconval.Controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.binov.mconval.DAO.IeConvalDAO;
import com.binov.mconval.Data_Repository.OperateurRepository;
import com.binov.mconval.Data_Repository.RoleRepository;
import com.binov.mconval.business.models.Notification;
import com.binov.mconval.business.models.NotificationHo;
import com.binov.mconval.business.models.Operateur;
import com.binov.mconval.business.models.Operateur_hopital;
import com.binov.mconval.business.models.Operateur_mc;
import com.binov.mconval.business.models.Patient;
import com.binov.mconval.business.models.Proposition;
import com.binov.mconval.business.models.Role;

@ControllerAdvice
public class Header_MenuController {

	@Autowired
	OperateurRepository operateurrep;

	@Autowired
	RoleRepository rolerepository;
	@Autowired
	IeConvalDAO ieconvaldao;

	// cette m�thode ajoute des liens et des strings Dynamiquement d'apr�s
	// autentification dans le Menu et le Header
	@ModelAttribute
	public void addParameters(Model model) {
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String username = auth.getName();
			Operateur op = operateurrep.findByUsername(username);
			Operateur op1 = ieconvaldao.getCurrentOperateur();
			Date date = new Date();
			op1.setLastconnection(date);
			operateurrep.save(op1);

			String menu2 = "";
			String menu2lien = "";
			String menu2icon = "";
			String menu3 = "";
			String menu3lien = "";
			String menu4 = "";
			String menu4lien = "";
			String menu4icon = "";
			String entete = "";

			String prenom = op.getPrenomOp();

			model.addAttribute("usernameh", prenom);
			int id = op.getIdOperateur();
			Role role = rolerepository.findByOperateur_idOperateur(id);
			String nomrole = role.getRoleName();
			if (nomrole.equals("ho")) {
				model.addAttribute("home_link", "/ho/home");
				String hopital = ieconvaldao.getCurrentOperateurHo().getHopital().getNomHopital();
				model.addAttribute("etablissement", hopital);
				menu2 = "Pulblier Patient";
				menu2lien = "/ho/ajouterPatient";
				menu2icon = "fa fa-pencil-square-o";
				menu3 = "Liste Des Patients";
				menu3lien = "/ho/listedesPatients";
				menu4 = "Voir Les Propositions ";
				menu4lien = "/ho/propositions";
				menu4icon = "fa fa-list-alt";
				entete = "Hôpital";

			} else {
				model.addAttribute("home_link", "/mc/home_mc");
				String mc = ieconvaldao.getCurrentOperateurMc().getM_conval().getNomMc();
				model.addAttribute("etablissement", mc);
				menu2 = "Ajouter Chambre";
				menu2lien = "/mc/ajouterChambre";
				menu2icon = "fa fa-bed";
				menu3 = "Consulter Patients";
				menu3lien = "/mc/consulterPatients";
				menu4 = "Liste Des Hopitaux";
				menu4lien = "";
				menu4icon = "fa fa-hospital-o";
				entete = "Maison Convalescence";
			}
			model.addAttribute("menu2", menu2);
			model.addAttribute("menu2lien", menu2lien);
			model.addAttribute("menu3", menu3);
			model.addAttribute("menu3lien", menu3lien);
			model.addAttribute("menu4", menu4);
			model.addAttribute("menu4lien", menu4lien);
			model.addAttribute("menu4icon", menu4icon);
			model.addAttribute("menu2icon", menu2icon);
			model.addAttribute("entete", entete);

		} catch (NullPointerException e) {
		}

	}

	@ModelAttribute
	public void GestionNotifications(Model model) {

		try {
			String lien = "";
			Operateur op = ieconvaldao.getCurrentOperateur();
			int id = op.getIdOperateur();
			Role role = rolerepository.findByOperateur_idOperateur(id);
			String nomrole = role.getRoleName();
			if (nomrole.equals("ho")) {
				Operateur_hopital opH = ieconvaldao.getCurrentOperateurHo();
				List<Notification> listNotif = ieconvaldao.notifHopital(opH);
				int NotifNbr = listNotif.size();
				model.addAttribute("notifnbr", NotifNbr);
				model.addAttribute("notifications", listNotif);
				lien = "/ho/propositions";

			} else {
				Operateur_mc opMc = ieconvaldao.getCurrentOperateurMc();
				List<NotificationHo> listNotif = ieconvaldao.notifMc(opMc);
				int NotifNbr = listNotif.size();
				model.addAttribute("notifnbr", NotifNbr);
				model.addAttribute("notifications", listNotif);
				lien = "/mc/consulterPatients";

			}

			model.addAttribute("notif_link", lien);

		} catch (NullPointerException e) {
		}

	}

}