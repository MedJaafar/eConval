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
						Consulter les Patients publi&eacute;s </strong> - Tout les Hopitaux
				</h1>
			</div>
			<!-- /.page-header -->
			<div class="col-xs-12">
				<div class="row">

					<div class="col-xs-12">

						
						<div class="space-4"></div>
						<div>${msgChambre}</div>
						<div>${msgAdd}</div>

						<div class="row">
							
							<div class="col-xs-12">
                       <div class="table-header" style="background-color: purple;"><strong>Patients Publi&eacute;s</strong>
									</div>

							
								<div>
									<table id="dynamic-table"
										class="table table-striped table-bordered table-hover dataTable no-footer">
										<thead>
											<tr>

												<th></th>
												
												<th>Hopital de Résidence</th>
												<th>Date d'Accueil</th>
                                                <th>Date de Sortie</th>
                                               <th>OPTIONS</th>

											</tr>
										</thead>

										<tbody>
											<c:forEach  var="reservations" items="${reservations}">
												<tr>


													<td style="width:4px;height:4x;"><img	src="${pageContext.request.contextPath}/resources/assets/avatars/patient_icon (1).jpg"
											class="msg-photo" alt="Alex's Avatar" /></td>
													
													

												
													<td>${reservations.getHopital().getNomHopital()}    <button class="btn btn-white btn-info infohopital" data-dismiss="modal"
													 data-nom ="${reservations.getHopital().getNomHopital()}" data-adresse="${reservations.getHopital().getAdresseHoital()}"
                                                                                             data-tel ="${reservations.getHopital().getTelHopital()}"  
                                                                                             data-fax="${reservations.getHopital().getFaxHopital()}">
                                                                                             <i class="ace-icon fa fa-plus-circle"></i> <strong>Détails Hopital</strong></button></td>
													<td> ${reservations.getDateaccueil()}</td>
													         <td>${reservations.getDatefin()}</td>
													<td Style="width: 200px; height: 30px; padding: 0px;">
															<div class="hidden-sm hidden-xs btn-group"
																Style="padding: 1px;">
										 <button class="btn btn-xs btn-success détailsPatient" type="button" 
																	style="width: 97px; height: 48px;"  data-id="${reservations.getPatient().getIdpatient()}" 
																	 data-commentaire="${reservations.getPatient().getCommentaire()}"
																	data-age="${reservations.getPatient().getAge()}"
																	data-pathologie="${reservations.getPatient().getPathologie()}">
																	<i class="ace-icon fa fa-plus-circle"></i><strong>Voir Détails</strong>
																</button>
                                               
                                            
																

																<button class="btn btn-xs btn-info proposer"
																	type="button" style="width: 98px; height: 48px;"
																	data-id="${reservations.getIdReservation()}" 
																	data-datee ="${reservations.getDateaccueil()}" data-dates ="${reservations.getDatefin()}" >
																	<i class="ace-icon fa fa-share bigger-120"></i><strong>Proposer</strong>
																</button>
		</div>
		
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								
							</div>
							<!-- /.span -->
						</div>
						<!-- /.row --></div>

<div></div>
	<div class="alert alert-info" role="alert">
							* <strong>${listtaille}</strong> Patients publi&eacute;s attendent un <Strong>Accueil</strong> .
							
						</div>
					<!-- PAGE CONTENT ENDS -->
				
				<!-- /.col -->
			</div>
			<!-- /.row -->
			
	<!-- Modal Form Voir Détails  Patient -->
			
			<div id="modal-détails" class="modal" tabindex="-1">
			
				<div class="modal-dialog" Style="width: 388px;">
				
					<div class="modal-content">
						<div class="modal-header"
								Style="padding: 4px 10px; background-color: 	#E8E8E8  ;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="blue bigger">
									<i class="fa fa-plus-circle"></i> <strong>Voir Détails Patient</strong>
								</h4>
							</div>

							<div class="modal-body">
								<div class="row">
									
											<div class="panel panel-default"
												style="width: 380px; height: 155px;">
												<div align="center"><h4 class="black bigger"><u><i class="fa fa-info-circle" aria-hidden="true"></i> <Strong>Informations</Strong></u></h4> </div>
												
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="form-group">
													<label class="col-sm-3 black control-label no-padding-right"
														for="form-field-1"><strong>Âge Patient :</strong></label>

													<div class="col-sm-9">
														<div class="input-group margin-bottom-sm">
                                        
														<output id ="age" ></output>
														</div>
													</div>
												</div>
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="form-group">
													<label class="col-sm-3 black control-label no-padding-right"
														for="form-field-1"><strong>Pathologie   :</strong></label>

													<div class="col-sm-9">
														
                                                           <output id="pathologie" ><strong></strong></output>
														
													</div>
											
												</div>
												
												
													<div class="space-4"></div>
														<div class="space-4"></div>
														<div class="space-4"></div>
														<div class="space-4"></div>
												
													<label class="col-sm-4 black control-label no-padding-right"
														for="form-field-1"><strong>Commentaires :</strong></label>
                                                       <br/><br/>
													<div class="well center">
														<div class="input-group  margin-bottom-sm">
                                        
														<output   id="commentaire"><strong></strong></output>
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
				<!-- questa e la model del proposizione -->
				
				<div id="modal-proposer" class="modal" tabindex="-1">
				<div class="modal-dialog" Style="width: 450px;">
					<div class="modal-content">
						<form method="Post" id="proposerform" name="proposerform"
							action="<c:url value='/mc/envoyerPropostion' />">
							<div class="modal-header"
								Style="padding: 4px 10px; background-color: #eff3f8;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="blue bigger">
									<i class="glyphicon fa fa-share"></i> <strong>Proposer Accueil 
										</strong>
								</h4>
							</div>

							<div class="modal-body">
								<div class="row">
									<div class="space"></div>
                                            
									<div class="panel panel-default">
									
										<div class="panel-body" style="width: 500px; height: 410px;">
                                           	<div class="space-4"></div>
											<h5 style="color: Grey;">
												<i class="fa fa-bars" aria-hidden="true"></i> <Strong>Désigner Une Chambre :</Strong>
											</h5>
											<div class="panel panel-default"
												style="width: 410px; height: 140px;">
											<div class="space-4"></div>
											<div class="space-4"></div>
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right"
													for="form-field-1"><strong>Choisir Chambre</strong></label>
                                                   <input type ="hidden" name ="idreservation" id="idreservation" />
												<div class="col-sm-9">
													<div class="input-group margin-bottom-sm">
														<span class="input-group-addon"><i
															class="fa fa-bars" aria-hidden="true"></i></span> 
															<select name="chambre" class="form-control col-xs-10 col-sm-5" id="chambre"	style="width: 150px;">
														     <option value ="">-Chambre-</option>
															<c:forEach var="chambre" items="${listChambre}">
															<option value="${chambre.getIdChambre()}">Chambre :  ${chambre.getIdChambre()}</option>
															
														</c:forEach>	
														</select>
															
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
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right"
													for="form-field-1"><strong>Prix</strong></label>

												<div class="col-sm-9">
                                                    	<div class="input-group margin-bottom-sm">
														<span class="input-group-addon"><i
															class="fa fa-eur" aria-hidden="true"></i></span> <input
															type="text" id="prix" name="prix" placeholder="Prix"
															class="col-xs-10 col-sm-5" style="width: 155px;" />
													</div>
												</div>

											</div>
											</div>
											
											<h5 style="color: Black;">
												<input type="checkbox" id="check" OnClick="show('dateEntr','dateSort','check');"  /> <Strong>Proposer les dates du Séjour</Strong>
											</h5>

											<div class="panel panel-default"
												style="width: 410px; height: 150px;">
												
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="form-group">
													<label class="col-sm-3 control-label Grey no-padding-right"
														for="form-field-1"><strong>Date
															Accueil :</strong></label>


													<div class="col-sm-9">
														<div class="input-group margin-bottom-sm">
															<span class="input-group-addon"><i
																class="fa fa-calendar bigger-110" aria-hidden="true"></i></span>
															<input type="text" id="dateEntr" name="dateEntr"
																data-date-format="dd-mm-yyyy" placeholder="jj-mm-aaaa"
																class="col-xs-10 col-sm-5 date-picker " disabled
																style="width: 150px;" />
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
												<div class="form-group">
													<label class="col-sm-3 control-label grey no-padding-right"
														for="form-field-1"><strong>Date Sortie :</strong></label>

													<div class="col-sm-9">
														<div class="input-group margin-bottom-sm">
															<span class="input-group-addon"><i
																class="fa fa-calendar bigger-110"  aria-hidden="true"></i></span>
															<input type="text" id="dateSort" name="dateSort" 
																data-date-format="dd-mm-yyyy" placeholder="jj-mm-aaaa"
																class="col-xs-10 col-sm-5 date-picker " disabled
																style="width: 150px;" />
														</div>
													</div>
												</div>
											</div>

										</div>
									</div>

								</div>
							</div>

							<div class="modal-footer">
								<button class="btn btn-sm" data-dismiss="modal">
									<i class="ace-icon fa fa-times"></i> Annuler
								</button>

								<button class="btn btn-sm btn-primary" type="submit" OnClick="show1('dateEntr','dateSort');">
									<i class="ace-icon fa fa-share"></i> Envoyer Proposition
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<!-- Détails Hopital Modal -->
			<div id="modal-hopital" class="modal" tabindex="-1">

						<div class="modal-dialog" Style="width: 388px;">

							<div class="modal-content">
								<div class="modal-header"
									Style="padding: 4px 10px; background-color: #E8E8E8;">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="blue bigger">
										<i class="fa fa-h-square"></i> <strong>D&eacute;tails Hopital</strong>
									</h4>
								</div>

								<div class="modal-body">
									<div class="widget-box">
											<div class="widget-header widget-header-flat" Style="background-color: light-grey;">
												<h4 class="widget-title smaller">
													
													<output id ="nom" ><strong></strong></output>
												</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main">
												
														<strong>Adresse :</strong>
                                                   <output id="adresse" ></output>
                                                   
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
			
			</div>


			<a href="#" id="btn-scroll-up"
				class="btn-scroll-up btn btn-sm btn-inverse"> <i
				class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>

		</div>
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
				.DataTable({
					 "language": {
						 "sProcessing":     "Traitement en cours...",
						    "sSearch":         "Rechercher&nbsp;:",
						    "sLengthMenu":     "Afficher _MENU_ &eacute;l&eacute;ments",
						    "sInfo":           "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
						    "sInfoEmpty":      "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
						    "sInfoFiltered":   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
						    "sInfoPostFix":    "",
						    "sLoadingRecords": "Chargement en cours...",
						    "sZeroRecords":    "Aucun &eacute;l&eacute;ment &agrave; afficher",
						    "sEmptyTable":     "Aucun Patient à Afficher",
						    "oPaginate": {
						        "sFirst":      "Premier",
						        "sPrevious":   "Pr&eacute;c&eacute;dent",
						        "sNext":       "Suivant",
						        "sLast":       "Dernier"
						    },
						    "oAria": {
						        "sSortAscending":  ": activer pour trier la colonne par ordre croissant",
						        "sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
						    }
				        },
					bAutoWidth : false,
					"aoColumns" : [

					null, null, null,null,  {
						"bSortable" : false
					} ],
					"aaSorting" : [],

				
					select: {
						style: 'one'
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

				
				
				/***************/
				//MODAL Form Ajout
				
	})
		</script>
	<script>
			$(document).on("click", '.détailsPatient', function(e) {
				var age = $(this).data('age');
				var pathologie = $(this).data('pathologie');
				
				var commentaire = $(this).data('commentaire');
				$("#age").val(age);
				$("#pathologie").val(pathologie);
				$("#commentaire").val(commentaire);
				$("#modal-détails").modal();
				console.log(pathologie) ;
			});
		</script>
		<script>
			$(document).on("click", '.infohopital', function(e) {
				var nom1 = $(this).data('nom');
				var adresse1 = $(this).data('adresse');
				var tel1 = $(this).data('tel');
				
				var fax1 = $(this).data('fax');
				
				$("#nom").val(nom1);
				$("#adresse").val(adresse1);
				$("#tel").val(tel1);
				
				$("#fax").val(fax1);
				
				$("#modal-hopital").modal();
				
				
			});
		</script>
		<script>
			$(document).on("click", '.proposer', function(e) {
				var idreservation = $(this).data('id');
				var dateEntr = $(this).data('datee');
				var dateSort = $(this).data('dates');
				$("#modal-proposer").modal();
				$("#idreservation").val(idreservation);
				$("#dateEntr").val(dateEntr);
				$("#dateSort").val(dateSort);
				console.log(idreservation) ;
			});
		</script>
		<script>
		function show(dateEntr,dateSort,check) { // On déclare la fonction toggle_div qui prend en param le bouton et un id
			  var date1 = document.getElementById(dateEntr); // On récupère le div ciblé grâce à l'id
			  var date2 = document.getElementById(dateSort);
			  if (document.getElementById(check).checked) {
			  date1.disabled = false ; 
			  date2.disabled = false ; }
			  else {
				  date1.disabled = true ; 
				  date2.disabled = true ;
			  }
			  
			}

		
		
		</script>
		<script>
		function show1(dateEntr,dateSort) { // On déclare la fonction toggle_div qui prend en param le bouton et un id
			  var date1 = document.getElementById(dateEntr); // On récupère le div ciblé grâce à l'id
			  var date2 = document.getElementById(dateSort);
			  date1.disabled = false ; 
			  date2.disabled = false ; 
			}
	
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

		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$("#proposerform")
										.validate(
												{
													rules : {
                                                      	chambre : {
															required : true,
														},
														
														dateEntr : {
															 
															required :true ,
														      minlength : 5 , 

														},
														
														dateSort : {
															 
														      required :true ,
														      minlength : 5 , 

														},
														prix : {
															 
														      required :true ,
														      digits : true, 

														},
													},

													messages : {
														prix    : "Le Prix est obligatoire!",
														chambre : "Veuillez désigner une Chambre !",
														dateEntr : "Veuillez entrer une date d'Accueil !",
														dateSort : "Veuillez entrer une date de Sortie ! ",
													},
													errorElement : "em",
													errorPlacement : function(
															error, element) {
														// Add the `help-block` class to the error element
														error
																.addClass("help-block");

														// Add `has-feedback` class to the parent div.form-group
														// in order to add icons to inputs

														// Add the span element, if doesn't exists, and apply the icon classes to it.

														if (element
																.parent('.input-group').length) {
															error
																	.insertAfter(element
																			.parent());
														} else {
															error
																	.insertAfter(element);
														}
													},

													highlight : function(
															element) {
														$(element)
																.closest(
																		'.form-group')
																.addClass(
																		'has-error');
														$(element)
																.next("span")
																.addClass(
																		"glyphicon-remove")
																.removeClass(
																		"glyphicon-ok");
													},
													unhighlight : function(
															element) {
														$(element)
																.closest(
																		'.form-group')
																.removeClass(
																		'has-error');
														$(element)
																.next("span")
																.addClass(
																		"glyphicon-ok")
																.removeClass(
																		"glyphicon-remove");
													}
												});
							});
		</script>
		
		




	</tiles:putAttribute>
</tiles:insertDefinition>

