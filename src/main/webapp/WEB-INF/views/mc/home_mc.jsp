<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags"  prefix ="spring"%>
<%@ page session="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
 
<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">
 <div class="body">
<div class="page-header">

				<h1>
					<strong><i class="ace-icon fa fa-home home-icon" aria-hidden="true"></i>
						Acceuil Maison De Convalescence  </strong>
				</h1>
			</div>
			<div class="col-xs-12">
			<div class="alert alert-block alert-info">
									<button type="button" class="close" data-dismiss="alert">
										<i class="ace-icon fa fa-times"></i>
									</button>

									<i class="ace-icon fa fa-check green"></i>

									Bienvenue à 
									<strong class="green">
										eConval Application
										<small>(Hopital)</small>
									</strong>,
	Application de Gestion qui Relie les Hopitaux aux Maisons de Convalesneces.
								</div>
			       <div class="well center"    >
											<h2 class="red bigger lighter center"><i class="ace-icon fa fa-hospital-o" aria-hidden="true"></i>  <strong>${hopital} </strong>interface</h2>
										<h4>Bienvenue, vous êtes connectés en tant que 
	   "<strong>${username}</strong>".</h4>
	   <div class="space-4"></div>
	   <h5 class="right"> <strong>Date du Jour :</strong> le ${serverTime}</h5>
										</div>


 
<div class="hr dotted"></div>

<div class="col-sm-6">
										

										
										<h1 class ="red"><i class="fa fa-heartbeat"> </i> <strong>e Conval</strong> Maison Convalescence</h1> 
										<p class="lead">
											Le partenaire idéal pour un meuilleur service d'accueil médical <strong>Opératoire</strong> et <strong>Post-Opératoire</strong>.
										</p>
										<h2 class ="blue">Présentation</h2>
										<p>
											Cette Application est construite dans le cadre de projet de fin d'études de <strong>Mohamed Jaâfar</strong> et <strong>Khalil Messaoudi</strong>.
										</p>
										<h3 class ="blue">Informations</h3>
										<p>
											<strong>Jaafar Mohamed</strong>  <br>
											<strong>E-mail : </strong>jaafarmohamed103@gmail.com<br>
											<strong>téléphone :</strong> +216 92 160 965 <br><br>
											<strong>Institut Supérieur De Gestion De Tunis</strong>
										</p>
										<p>
											<strong>Messaoudi Khalil</strong>  <br>
											<strong>E-mail : </strong>khalil.messaoudi@gmail.com<br>
											<strong>téléphone :</strong> +216 26 188 172 <br><br>
											<strong>Institut Supérieur De Gestion De Tunis</strong>
										</p>
										
									</div>
									


  
</div>
</div>
   </tiles:putAttribute>
</tiles:insertDefinition>
