<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="template">
	<tiles:putAttribute name="body">
		<div class="body">


			<!-- /section:settings.box -->
			<div class="page-header">
				<h1>
					<strong><i class="fa fa-bars" aria-hidden="true"></i>
						Propositions Re&ccedil;ues </strong> - Toutes les Maisons de Convalescence
				</h1>
			</div>
			<!-- /.page-header -->
			<div class="col-xs-12">
				<div class="row">

					<div class="col-xs-12">


						<div class="space-4"></div>
						
						<div>${msgAdd}</div>

						<div class="row">

							<div class="col-xs-12">
								<div class="table-header" style="background-color: #6B8E23;">
									<strong>Propositions d'Accueils des Maison de
										Convalescences pour Chaque Patients</strong>
								</div>
								<div>
									<table id="dynamic-table"
										class="table table-striped table-bordered table-hover dataTable no-footer">
										<thead>
											<tr>


												<th></th>
												<th>Identifiant Du Patient</th>
												<th>Date de Publication <i class="fa fa-calendar"
													aria-hidden="true"></i></th>
												<th>Nombre des Propositions</th>
												<th>OPTIONS</th>

											</tr>
										</thead>

										<tbody>
											<c:forEach var="reservations" items="${reservationsList}"
												varStatus="vs">
												
												<tr>
												
													<td style="width: 4px; height: 4x;"><img
														src="${pageContext.request.contextPath}/resources/assets/avatars/patient_icon (1).jpg"
														class="msg-photo" alt="Alex's Avatar" />
														
														
														<div id="myModal${vs.index}" class="modal" tabindex="-1">
															<div class="modal-dialog" Style="width: 1030px;">
																<div class="modal-content">

																	<div class="modal-header"
																		Style="padding: 4px 10px; background-color:   #4d94ff;">
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																		<h4 class="white bigger">
																			<i class="glyphicon fa fa-share"></i> <strong>Voir
																				les Propositions</strong> - Patient :
																			${reservations.getPatient().getIdpatient()}
																		</h4>
																	</div>

																	<div class="modal-body">
																		
																		
                                                    <h4 class="Red bigger">
									 <strong>* ${reservations.getProposition().size()}
										Propositions</strong> pour Accueillir ce Patient.
								                     </h4>
																			<div class="panel panel-default">
                                                                            
																				<div class="panel-body"
																					style="width: 995px; height: 300px;">
																					<div class="space-4"></div>
																					
																						<table id="simple-table"
																							class="table  table-bordered table-hover">
																							<thead>
																								<tr>
																									<th>Identifiant</th>
																									<th>Maison de Convalescence</th>
																									<th>Date Reception</th>
																									<th class="blue">Chambre</th>
																									<th class ="blue">Prix </th>
																									<th class= Blue>Dates Accueil Propops&eacute;es</th>
																									
																									<th class="green"  >Accepter</th>
																								</tr>
																							</thead>
																							<c:forEach var="propositions" items="${reservations.getListPropositions()}"	>
                                                                                             <tbody>
                                                                                            
                                                                                             <tr> 
                                                                                             <td>${propositions.getIdProposition()}</td>
                                                                                             <td>${propositions.getMconval().getNomMc()} <button type="button" class="btn btn-white btn-primary détailmc" 
                                                                                             data-nom ="${propositions.getMconval().getNomMc()}" data-adresse="${propositions.getMconval().getAdrMc()}"
                                                                                             data-tel ="${propositions.getMconval().getTelMc()}"  data-email="${propositions.getMconval().getEmailMc()}"
                                                                                             data-fax="${propositions.getMconval().getFaxMc()}" ><i class="fa fa-h-square" aria-hidden="true"></i> D&eacute;tails MC</button></td>
                                                                                             <td>${propositions.getDate_Envoie()}</td>
                                                                                             <td>Chambre &agrave; <strong>${propositions.getChambre().getNblits()}</strong></td>
                                                                                             <td>${propositions.getPrix()} <i class="fa fa-eur" aria-hidden="true"></i></td>
                                                                                             <td>Du <strong>${propositions.getDate_debut_sejour_prop()}</strong> &agrave; <strong>${propositions.getDate_fin_sejour_prop()}</strong></td>
                                                                                             <td style="padding:2px ;"><button class="btn btn-xs  btn-success accept" type="button"
																style="width: 100px; height: 45px; padding:0px, 0px;" data-idres ="${propositions.getReservation().getIdReservation()}" data-idprop="${propositions.getIdProposition()}" >
																<i class="ace-icon glyphicon glyphicon-ok"></i><strong>
																	Accepter</strong>
																	
															</button>
															
															</td>                          
															
                                                                                             </tr>
                                                                                             </tbody>
                                                                                            </c:forEach>
																						</table>
																					

																				</div>

																			</div>
																		

																	</div>
																</div>

																<div class="modal-footer">
																	<button class="btn btn-sm" data-dismiss="modal">
																		<i class="ace-icon fa fa-times"></i><strong>Fermer Pop-up</strong>
																	</button>

																	
																</div>

															</div>
														</div></td>
													<td>${reservations.getPatient().getIdpatient()}
														<button type="button" class="btn btn-white détailsPatient"
															data-commentaire="${reservations.getPatient().getCommentaire()}"
															data-age="${reservations.getPatient().getAge()}"
															data-pathologie="${reservations.getPatient().getPathologie()}"
															data-dated="${reservations.getDateaccueil()}"
															data-datef="${reservations.getDatefin()}"
															 >

															<i class="fa  fa-eye" aria-hidden="true"></i>
															D&eacute;tails Patient
														</button>
													</td>
													<td>${reservations.getDatecreation()}</td>
													<td><strong>${reservations.getProposition().size()}</strong>
														Propositions Re&ccedil;ues</td>

													<td Style="width: 170px; height: 30px; padding: 0px;">
														<div class="hidden-sm hidden-xs btn-group"
															Style="padding: 1px;">
                                                            <c:choose>
                                        <c:when test="${reservations.getProposition().size()==0}">
                                            
															<button class="btn btn-xs  btn-primary" type="button" disabled
																style="width: 170px; height: 48px;" data-toggle="modal"
																data-target="#myModal${vs.index}"
																id="VoirPropositions${vs.index}">
																<i class="ace-icon fa fa-plus-circle bigger-120"></i><strong>
																	Voir les Propositions</strong>
															</button>
															</c:when>
															<c:otherwise>
															<button class="btn btn-xs  btn-primary" type="button"
																style="width: 170px; height: 48px;" data-toggle="modal"
																data-target="#myModal${vs.index}"
																id="VoirPropositions${vs.index}">
																<i class="ace-icon fa fa-plus-circle bigger-120"></i><strong>
																	Voir les Propositions</strong>
															</button>
															</c:otherwise>
															</c:choose>
														</div>

													</td>


												</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>
								<!-- /.span -->
							</div>
							<!-- /.row -->
						</div>

						<div></div>
						<div class="alert alert-info" role="alert">
							* <strong>${listtaille}</strong> Patients publi&eacute;s
							attendent un <Strong>Accueil</strong> .

						</div>

					</div>


					<!-- Modal Form Voir Détails  Patient -->
					<div id="modal-détails" class="modal" tabindex="-1">

						<div class="modal-dialog" Style="width: 388px;">

							<div class="modal-content">
								<div class="modal-header"
									Style="padding: 4px 10px; background-color: #E8E8E8;">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="blue bigger">
										<i class="fa fa-plus-circle"></i> <strong>Voir
											D&eacute;tails Patient</strong>
									</h4>
								</div>

								<div class="modal-body">
									<div class="row">

										<div class="panel panel-default"
											style="width: 380px; height: 200px;">
											<div align="center">
												<h4 class="black bigger">
													<u><i class="fa fa-info-circle" aria-hidden="true"></i>
														<Strong>Informations</Strong></u>
												</h4>
											</div>

											<div class="space-4"></div>
											<div class="space-4"></div>
											<div class="space-4"></div>
											<div class="form-group">
												<label class="col-sm-3 black control-label no-padding-right"
													for="form-field-1"><strong>Age Patient :</strong></label>

												<div class="col-sm-9">
													<div class="input-group margin-bottom-sm">

														<output id="age"></output>
													</div>
												</div>
											</div>
											<div class="space-4"></div>
											<div class="space-4"></div>
											<div class="form-group">
												<label class="col-sm-3 black control-label no-padding-right"
													for="form-field-1"><strong>Pathologie :</strong></label>

												<div class="col-sm-9">

													<output id="pathologie">
														<strong></strong>
													</output>
												</div>
											</div>
											<div class="space-4"></div>
											<div class="space-4"></div>
											<div class="form-group">
												<label class="col-sm-3 black control-label no-padding-right"
													for="form-field-1"><strong>Date Debut:</strong></label>

												<div class="col-sm-9">

													<output id="datedebut">
														<strong></strong>
													</output>
												</div>
											</div>
											
											<div class="space-4"></div>
											<div class="space-4"></div>
											<div class="form-group">
												<label class="col-sm-3 black control-label no-padding-right"
													for="form-field-1"><strong>Date Fin:</strong></label>

												<div class="col-sm-9">

													<output id="datefin">
														<strong></strong>
													</output>
												</div>
											</div>
											<div class="space-4"></div>
											<div class="space-4"></div>
											<div class="space-4"></div>
											<div class="space-4"></div>

											<label class="col-sm-4 black control-label no-padding-right"
												for="form-field-1"><strong>Commentaires :</strong></label> <br />
											<br />
											<div class="well center">
												<div class="input-group  margin-bottom-sm">

													<output id="commentaire">
														<strong></strong>
													</output>
												</div>
											</div>


										</div>
										<div class="space-4"></div>
										<div class="space-4"></div>
										<div class="space-4"></div>
										<div class="space-4"></div>
										<div class="space-4"></div>
										<div class="space-4"></div>
										<div class="space-4"></div>
										<div class="space-4"></div>



									</div>
								</div>
							</div>


							<div class="modal-footer">
								<button class="btn btn-sm" data-dismiss="modal">
									<i class="ace-icon fa fa-times"></i> <strong>Fermer</strong>
								</button>


							</div>

						</div>
					</div>
					
					<!-- Model Afficher Détails MC -->
					<div id="modal-mconval" class="modal" tabindex="-1">

						<div class="modal-dialog" Style="width: 388px;">

							<div class="modal-content">
								<div class="modal-header"
									Style="padding: 4px 10px; background-color: #E8E8E8;">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="blue bigger">
										<i class="fa fa-h-square"></i> <strong>D&eacute;tails Maison Convalescence</strong>
									</h4>
								</div>

								<div class="modal-body">
									<div class="widget-box">
											<div class="widget-header widget-header-flat" Style="background-color: white;">
												<h4 class="widget-title smaller">
													
													<output id ="nom" ><strong></strong></output>
												</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main">
												
														<strong>Adresse :</strong>
                                                   <output id="adresse" ></output>
                                                   <hr>
                                                   
														<strong>e-mail :</strong>
                                                    <output id="email" ></output>
                                                     <hr>
													
														<strong>T&eacute;l&eacute;phone :</strong>
                                                    <output id="tel" ></output>
                                                    
                                                    <hr>
													
														<strong>Fax :</strong>
                                                    <output id="fax" ></output>
													
												</div>
											</div>
										</div>
								</div>
							</div>


							<div class="modal-footer">
								<button class="btn btn-sm" data-dismiss="modal">
									<i class="ace-icon fa fa-times"></i> <strong>Fermer</strong>
								</button>


							</div>

						</div>
					</div>
					
					<!-- Modal Accepter Proposition -->
					<form action="<c:url value='/ho/accepterproposition'/>" >
					<div id="modal-accept" class="modal" tabindex="-1">

						<div class="modal-dialog" Style="width: 388px;">

							<div class="modal-content">
								<div class="modal-header"
									Style="padding: 4px 10px; background-color: #F0F0F0 ;">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class=" Blue bigger">
										<i class="fa fa-exclamation-triangle"></i> Accepter cette Propositions ?
									</h4>
								</div>
                                 <input type ="hidden" id="idreservation" name="idreservation" >
                                 <input type ="hidden" id="idproposition" name="idproposition" >
								<div class="modal-body">
									<div class="widget-box">
											

											<div class="widget-body">
												<p class="alert alert-success">
												Une Res&eacute;rvation sera envoy&eacute;e &agrave; la Maison de Convalescence.
														</p>
											</div>
										</div>
								</div>
							</div>


							<div class="modal-footer">
							
								<button class="btn btn-sm" data-dismiss="modal">
									<i class="ace-icon fa fa-times"></i> <strong>Non</strong>
								</button>
								<button class="btn btn-sm btn-success " type="submit" >
									<i class="ace-icon glyphicon glyphicon-ok"></i> <strong>Oui, j'accepte</strong>
								</button>


							</div>

						</div>
					</div></form>
					
					
				</div>



				<a href="#" id="btn-scroll-up"
					class="btn-scroll-up btn btn-sm btn-inverse"> <i
					class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
				</a>

			</div>


			<!-- basic scripts -->

			<!--[if !IE]> -->
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/jquery.js"></script>

			<!-- <![endif]-->

			<!--[if IE]>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery1x.js"></script>
<![endif]-->
			<script type="text/javascript">
				if ('ontouchstart' in document.documentElement)
					document
							.write("<script src='${pageContext.request.contextPath}/resources/assets/js/jquery.mobile.custom.js'>"
									+ "<"+"/script>");
			</script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.js"></script>

			<!-- page specific plugin scripts -->
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/dataTables/jquery.dataTables.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/dataTables/jquery.dataTables.bootstrap.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/dataTables/extensions/Buttons/js/dataTables.buttons.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/dataTables/extensions/Buttons/js/buttons.flash.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/dataTables/extensions/Buttons/js/buttons.html5.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/dataTables/extensions/Buttons/js/buttons.print.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/dataTables/extensions/Buttons/js/buttons.colVis.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/dataTables/extensions/Select/js/dataTables.select.js"></script>

			<!-- ace scripts -->
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/elements.scroller.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/elements.colorpicker.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/elements.fileinput.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/elements.typeahead.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/elements.wysiwyg.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/elements.spinner.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/elements.treeview.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/elements.wizard.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/elements.aside.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.ajax-content.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.touch-drag.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.sidebar.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.sidebar-scroll-1.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.submenu-hover.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.widget-box.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.settings.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.settings-rtl.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.settings-skin.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.widget-on-reload.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.searchbox-autocomplete.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/date-time/bootstrap-datepicker.js"></script>




			<!-- Date Table Script "mine"  -->




			<script type="text/javascript">
				jQuery(function($) {

					var myTable = $('#dynamic-table')
							//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
							.DataTable(
									{
										"language" : {
											"sProcessing" : "Traitement en cours...",
											"sSearch" : "Rechercher&nbsp;:",
											"sLengthMenu" : "Afficher _MENU_ &eacute;l&eacute;ments",
											"sInfo" : "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
											"sInfoEmpty" : "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
											"sInfoFiltered" : "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
											"sInfoPostFix" : "",
											"sLoadingRecords" : "Chargement en cours...",
											"sZeroRecords" : "Aucun &eacute;l&eacute;ment &agrave; afficher",
											"sEmptyTable" : "Aucun Patient &agrave Afficher",
											"oPaginate" : {
												"sFirst" : "Premier",
												"sPrevious" : "Pr&eacute;c&eacute;dent",
												"sNext" : "Suivant",
												"sLast" : "Dernier"
											},
											"oAria" : {
												"sSortAscending" : ": activer pour trier la colonne par ordre croissant",
												"sSortDescending" : ": activer pour trier la colonne par ordre d&eacute;croissant"
											}
										},
										bAutoWidth : false,
										"aoColumns" : [

										null, null, null,null, {
											"bSortable" : false
										} ],
										"aaSorting" : [],

										select : {
											style : 'one'
										}

									});

					//style the message box

					////

					//select/deselect all rows according to table header checkbox

					//DatePicker Script

					$('.date-picker').datepicker({
						autoclose : true,
						todayHighlight : true
					})
					//show datepicker when clicking on the icon
					.next().on(ace.click_event, function() {
						$(this).prev().focus();
					});

				})
			</script>


			<script>
			$(document).on("click", '.détailsPatient', function(e) {
				var age = $(this).data('age');
				var pathologie = $(this).data('pathologie');
				var commentaire = $(this).data('commentaire');
				var date1 = $(this).data('dated');
				var date2 = $(this).data('datef');
				$("#age").val(age);
				$("#pathologie").val(pathologie);
				$("#commentaire").val(commentaire);
				$("#datedebut").val(date1);
				$("#datefin").val(date2);
				
				$("#modal-détails").modal();
				
				console.log(date1) ;
			});
		</script>
		
		<script>
			$(document).on("click", '.détailmc', function(e) {
				var nom1 = $(this).data('nom');
				var adresse1 = $(this).data('adresse');
				var tel1 = $(this).data('tel');
				var email1 = $(this).data('email');
				var fax1 = $(this).data('fax');
				
				$("#nom").val(nom1);
				$("#adresse").val(adresse1);
				$("#tel").val(tel1);
				$("#email").val(email1);
				$("#fax").val(fax1);
				
				$("#modal-mconval").modal();
				
				
			});
		</script>
		<script>
			$(document).on("click", '.accept', function(e) {
				var idr = $(this).data('idres');
				var idp = $(this).data('idprop');
				$("#idreservation").val(idr);
				$("#idproposition").val(idp);
				$("#modal-accept").modal();
				
				
				
			});
		</script>


			<script type="text/javascript">
				ace.vars['base'] = '..';
			</script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/elements.onpage-help.js"></script>

			<script
				src="${pageContext.request.contextPath}/resources/assets/js/ace/ace.onpage-help.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/docs/assets/js/rainbow.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/docs/assets/js/language/generic.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/docs/assets/js/language/html.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/docs/assets/js/language/css.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/docs/assets/js/language/javascript.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.js"></script>




		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>

