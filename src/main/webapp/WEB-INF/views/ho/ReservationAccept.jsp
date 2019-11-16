<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags"  prefix ="spring"%>
<%@ page session="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
 
<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">
 <div class="body">
<div class="page-header">

				<h1>
					<strong><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
						R&eacute;servation Confirm&eacute;e </strong>- La r&eacute;servation a &eacute;t&eacute; envoy&eacute;e  la Maison de Convalescence.
				</h1>
			</div>
			<div class="col-xs-12">
			<div class="alert alert-block alert-info" style ="height:90px;">
									<button type="button" class="close" data-dismiss="alert">
										<i class="ace-icon fa fa-times"></i>
									</button>

									<i class="ace-icon fa fa-check"></i>
              <strong>R&eacute;servation Valid&eacute;e , le Patient sera transmis a ${res.getM_conval().getNomMc()}.</strong> <button class="btn btn-app btn-light btn-xs pull-right" style ="width :100px;height:60px;">
											<i class="ace-icon fa fa-print "></i>
											<strong>Imprimer</strong>
										</button>
									
								</div>
			       


 

<a type="submit" class="btn btn-white btn-info" href="<c:url value='/ho/propositions' />"><i class="fa fa-arrow-left" aria-hidden="true"></i> Aller Vers Propositions</a>
<div class="hr dotted"></div>
<div class="widget-box">
											<div class="widget-header widget-header-flat" style="background-color: #9999CC;">
												<h4 class="widget-title smaller White">
													
													<strong>R&eacute;servation num&eacute;ro : ${res.getIdReservation()}</strong> 
										
												</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main">
												
														<strong>Age du Patient :</strong>
                                                   <output id="age">${res.getPatient().getAge()} Ans</output>
                                                   <hr>
                                                   
														<strong>Pathologie :</strong>
                                                    <output id="path">${res.getPatient().getPathologie()}</output>
                                                     <hr>
													
														<strong>Commentaire :</strong>
                                                    <output id="com">${res.getPatient().getCommentaire()}</output>
                                                    
                                                     <hr>
													
														<strong>P&eacute;riode d'Accueil :</strong>
                                                    <output id="période">Du ${res.getDateaccueil()} jusqu'à ${res.getDatefin()} </output>
                                                    
                                                    <hr>
													
														<strong>Maison De Convalescence :</strong>
                                                    <output id="nomMc"><strong>${res.getM_conval().getNomMc()}</strong></output>
                                                    
                                                    <hr>
													
														<strong>Adresse Maison De Convalescence :</strong>
                                                    <output id="fax">${res.getM_conval().getAdrMc()}</output>
                                                    
                                                     <hr>
													
														<strong>Email Maison De Convalescence :</strong>
                                                    <output id="email">${res.getM_conval().getEmailMc()}</output>
                                                    
                                                     <hr>
													
														<strong>T&eacute;l&eacute;phone Maison De Convalescence :</strong>
                                                    <output id="tel">${res.getM_conval().getTelMc()}</output>
                                                    
                                                     <hr>
													
														<strong>Fax Maison De Convalescence  :</strong>
                                                    <output id="fax">${res.getM_conval().getFaxMc()}</output>
													
												</div>
											</div>
										</div>

									


  
</div>
</div>
   </tiles:putAttribute>
</tiles:insertDefinition>
