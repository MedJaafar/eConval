
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
						Liste des patients op&eacute;r&eacute;s </strong>
				</h1>
			</div>
			<!-- /.page-header -->
			<div class="col-xs-12">
				<div class="row">

					<div class="col-xs-12">

						<div align="right">
							<button class="btn btn-info ajouterPatient" type="button" 
								data-toggle="modal">
								<i class="glyphicon glyphicon-hand-right"></i> <strong>
									Ajouter Nouveau Patient</strong>
							</button>


						</div>
						<div class="space-4"></div>
						<div>${msgRemove}</div>
						<div>${msgAdd}</div>
						<div>${msgModif}</div>

						<!-- PAGE CONTENT BEGINS -->
						<div class="row">
							
							<div class="col-xs-12">



								<div class="table-header" style="background-color: lightgrey;"><strong>Patients Ajout&eacute;s</strong>
									</div>

								<!-- div.table-responsive -->

								<!-- div.dataTables_borderWrap -->
								<div>
									<table id="dynamic-table"
										class="table table-striped table-bordered table-hover dataTable no-footer">
										<thead>
											<tr>

												<th></th>
												<th>Age Patient</th>
												<th>Pathologie</th>
												<th class="hidden-480">Commentaires</th>
                                                <th>Publication</th>
												<th>G&eacute;rer Patient</th>

											</tr>
										</thead>

										<tbody>
											<c:forEach var="patients" items="${patients}">
												<tr>


													<td style="width:4px;height:4x;"><img	src="${pageContext.request.contextPath}/resources/assets/avatars/patient_icon (1).jpg"
											class="msg-photo" alt="Alex's Avatar" /></td>
													<!-- Age -->
													<td>${patients.getAge()}</td>

													<!-- Pathologie -->
													<td>${patients.getPathologie()}</td>
													<!-- Commentaire -->
													<td>${patients.getCommentaire()}</td>
													         <c:choose>
                                        <c:when test="${patients.getPublier()==true}">
                                              <td><strong>publi&eacute;</strong></td>
                                                 </c:when>
                                                 <c:otherwise>
                                           <td><strong>non publi&eacute;</strong></td>
                                                 </c:otherwise>
                                                </c:choose>
													<td Style="width: 200px; height: 30px; padding: 0px;">
														

															<input type="hidden" name="idpatient"
																value="${patients.getIdpatient()}"
																style="width: 3px; height: 3px;" />
															<div class="hidden-sm hidden-xs btn-group"
																Style="padding: 1px;">
																<c:choose>
                                        <c:when test="${patients.getPublier()==true}">
                                              <button class="btn btn-xs btn-success" disabled
															type="button"		style="width: 75px; height: 45px;">
																	<i class="ace-icon fa fa-check bigger-120"></i><strong>Publier</strong>
																</button>
                                                 </c:when>
                                                 <c:otherwise>
                                           <button class="btn btn-xs btn-success publierPatient" type="button" 
																	style="width: 75px; height: 45px;"  data-id="${patients.getIdpatient()}">
																	<i class="ace-icon fa fa-check bigger-120"></i><strong>Publier</strong>
																</button>
                                                 </c:otherwise>
                                                </c:choose>
																

																<button class="btn btn-xs btn-info edit_button"
																	type="button" style="width: 50px; height: 45px;"
																	data-commentaire="${patients.getCommentaire()}"
																	data-age="${patients.getAge()}"
																	data-pathologie="${patients.getPathologie()}"
																	data-id="${patients.getIdpatient()}">
																	<i class="ace-icon fa fa-pencil bigger-120"></i>
																</button>


																<button class="btn btn-xs btn-danger supprimerPatient" type="button"
																	data-id="${patients.getIdpatient()}"
																	style="width: 68px; height: 45px;" value="supprimer">
																	<i class="ace-icon fa fa-trash-o bigger-120"></i>
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
							* <strong>${taille_list}</strong> Patients attendent
							d'&egrave;tre transf&eacute;r&eacute; dans une <Strong>Maison
								de Convalescence</Strong>.
						</div>
					<!-- PAGE CONTENT ENDS -->
				
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div id="modal-form" class="modal" tabindex="-1">
				<div class="modal-dialog" Style="width: 450px;">
					<div class="modal-content">
						<form method="Post" id="ajoutform"
							action="<c:url value='/ho/modalEnregistrer' />">
							<div class="modal-header"
								Style="padding: 4px 10px; background-color: #eff3f8;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="blue bigger">
									<i class="glyphicon glyphicon-hand-right"></i> <strong>Ajouter
										un nouveau Patient</strong>
								</h4>
							</div>

							<div class="modal-body">
								<div class="row">
									<div class="space"></div>

									<div class="panel panel-default">
										<div class="panel-body" style="width: 500px; height: 330px;">

											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right"
													for="form-field-1"><strong>Age Patient</strong></label>

												<div class="col-sm-9">
													<div class="input-group margin-bottom-sm">
														<span class="input-group-addon"><i
															class="fa fa-user" aria-hidden="true"></i></span> <input
															type="text" id="age" name="age"
															placeholder="Age du Patient" class="col-xs-10 col-sm-5"
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
												<label class="col-sm-3 control-label no-padding-right"
													for="form-field-1"><strong>Pathologie</strong></label>

												<div class="col-sm-9">
													<div class="input-group margin-bottom-sm">
														<span class="input-group-addon"><i
															class="fa fa-bars" aria-hidden="true"></i></span> 
															<select name="pathologie" class="form-control col-xs-10 col-sm-5" id="pathologie"	style="width: 150px;">
														     <option value ="">-Pathologie-</option>
															<c:forEach var="pathologie" items="${listPath}">
															<option value="${pathologie.getNompathologie()}">${pathologie.getNompathologie()}</option>
															
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
													for="form-field-1"><strong>Commentaire</strong></label>

												<div class="col-sm-9">
													<div class="input-group margin-bottom-sm">
														<span class="input-group-addon"><i
															class="fa fa-info-circle" aria-hidden="true"></i></span> <input
															type="text" id="commentaire" name="commentaire"
															placeholder="Commentaire" class="col-xs-10 col-sm-5"
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

											<h5 style="color: #A80000;">
												<Strong>*Optionels :</Strong>
											</h5>

											<div class="panel panel-default"
												style="width: 410px; height: 140px;">
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right"
														for="form-field-1"><strong>Date
															Entr&eacute;e</strong></label>


													<div class="col-sm-9">
														<div class="input-group margin-bottom-sm">
															<span class="input-group-addon"><i
																class="fa fa-calendar bigger-110" aria-hidden="true"></i></span>
															<input type="text" id="dateEntr" name="dateEntr"
																data-date-format="dd-mm-yyyy" placeholder="jj-mm-aaaa"
																class="col-xs-10 col-sm-5 date-picker"
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
													<label class="col-sm-3 control-label no-padding-right"
														for="form-field-1"><strong>Date Sortie</strong></label>

													<div class="col-sm-9">
														<div class="input-group margin-bottom-sm">
															<span class="input-group-addon"><i
																class="fa fa-calendar bigger-110"  aria-hidden="true"></i></span>
															<input type="text" id="dateSort" name="dateSort"
																data-date-format="dd-mm-yyyy" placeholder="jj-mm-aaaa"
																class="col-xs-10 col-sm-5 date-picker"
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

								<button class="btn btn-sm btn-primary" type="submit">
									<i class="ace-icon fa fa-check"></i> Enregistrer
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- modal form Modifier -->


			<div id="modal-form-modif" class="modal" tabindex="-1">
				<div class="modal-dialog" Style="width: 450px;">
					<div class="modal-content">
						<form  id="modifform" action="<c:url value='/ho/modifierPatient' />">
							
							<div class="modal-header"
								Style="padding: 4px 10px; background-color: #FFFFCC;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="blue bigger">
									<i class="fa fa-pencil-square-o"></i> <strong>Modifier
										les informations du Patient</strong>
								</h4>
							</div>

							<div class="modal-body">
								<div class="row">
									<div class="space"></div>

									<div class="panel panel-default">
										<div class="panel-body" style="width: 500px; height: 330px;">

											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right"
													for="form-field-1"><strong>Age Patient</strong></label>

												<div class="col-sm-9">

													<input type="hidden" name="idmodif" id="idmodif" />
													<div class="input-group margin-bottom-sm">
														<span class="input-group-addon"><i
															class="fa fa-user" aria-hidden="true"></i></span> <input
															type="text" id="agemodif" name="agemodif"
															class="col-xs-10 col-sm-5" style="width: 150px;" />
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
													for="form-field-1"><strong>Pathologie</strong></label>

												<div class="col-sm-9">
													<div class="input-group margin-bottom-sm">
														<span class="input-group-addon"><i
															class="fa fa-bars" aria-hidden="true"></i></span>
															<select name="pathoModif" class="form-control col-xs-10 col-sm-5" id="pathoModif"	style="width: 150px;">
														     <option ></option>
															<c:forEach var="pathologie" items="${listPath}">
															<option value="${pathologie.getNompathologie()}">${pathologie.getNompathologie()}</option>
															
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
													for="form-field-1"><strong>Commentaire</strong></label>

												<div class="col-sm-9">
													<div class="input-group margin-bottom-sm">
														<span class="input-group-addon"><i
															class="fa fa-info-circle" aria-hidden="true"></i></span> <input
															type="text" id="commentModif" name="commentModif"
															placeholder="Commentaire" class="col-xs-10 col-sm-5"
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

											<h5 style="color: #A80000;">
												<Strong>*Optionels :</Strong>
											</h5>

											<div class="panel panel-default"
												style="width: 410px; height: 140px;">
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right"
														for="form-field-1"><strong>Date
															Entr&eacute;e</strong></label>

													<div class="col-sm-9">
														<div class="input-group margin-bottom-sm">
															<span class="input-group-addon"><i
																class="fa fa-calendar bigger-110" aria-hidden="true"></i></span>
															<input type="text" id="dateEntrmodif"
																name="dateEntrmodif" data-date-format="yyyy-mm-dd"
																placeholder="jj-mm-aaaa"
																class="col-xs-10 col-sm-5 date-picker"
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
													<label class="col-sm-3 control-label no-padding-right"
														for="form-field-1"><strong>Date Sortie</strong></label>

													<div class="col-sm-9">
														<div class="input-group margin-bottom-sm">
															<span class="input-group-addon"><i
																class="fa fa-calendar bigger-110" aria-hidden="true"></i></span>
															<input type="text" id="dateSortmodif"
																name="dateSortmodif" data-date-format="yyyy-mm-dd"
																placeholder="jj-mm-aaaa"
																class="col-xs-10 col-sm-5 date-picker"
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

									<button class="btn btn-sm btn-primary" type="submit"
										name="savemodif">
										<i class="ace-icon fa fa-check"></i> Sauvergader Modifications
									</button>
								</div>
						</form>
					</div>
				</div>
			</div>
			
			<!-- Modal Form Publier Patient -->
			<form id = "formpublication" name="formPublication" action="<c:url value='/ho/publierpatient' />"  >
			<div id="modal-form-publier" class="modal" tabindex="-1">
			
				<div class="modal-dialog" Style="width: 410px;">
				
					<div class="modal-content">
						<div class="modal-header"
								Style="padding: 4px 10px; background-color: #ecffb3;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="blue bigger">
									<i class="fa fa-check"></i> <strong>Publier ce patient</strong>
								</h4>
							</div>

							<div class="modal-body">
								<div class="row">
									<h5 >
												<Strong>  Saisir les informations :</Strong>
											</h5>
											<div class="panel panel-default"
												style="width: 400px; height: 140px;">
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="space-4"></div>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right"
														for="form-field-1"><strong>Date
															Entr&eacute;e</strong></label>

													<div class="col-sm-9">
														<div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar bigger-110" aria-hidden="true"></i></span>
														<input type="text" id="dateentrPub"
																name="dateentrPub" data-date-format="yyyy-mm-dd" 
																placeholder="jj-mm-aaaa"
																class="col-xs-10 col-sm-5 date-picker"
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
												<input type ="hidden" name ="idpatientpub" id ="idpatientpub">
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right"
														for="form-field-1"><strong>Date Sortie</strong></label>

													<div class="col-sm-9">
													<div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar bigger-110" aria-hidden="true"></i></span>
														<input type="text" id="datesortPub"
																name="datesortPub" data-date-format="yyyy-mm-dd" 
																placeholder="jj-mm-aaaa"
																class="col-xs-10 col-sm-5 date-picker"
																style="width: 150px;" />
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

									<button class="btn btn-sm btn-success" type="submit"
										name="PublierPatient">
										<i class="ace-icon fa fa-check"></i><strong>Publier ce Patient</strong>
									</button>
								</div>
						
					</div>
				</div>
				</form>
				
				<!-- Supprimer Modal -->
				
				<form id = "formSupprimer" name="formSupprimer" action="<c:url value='/ho/removePatient' />"  >
				
			<div id="modal-form-supprimer" class="modal" tabindex="-1">
			
				<div class="modal-dialog" Style="width: 420px;">
				 <input type="hidden" name="idpatientsupprimer" id="idpatientsupprimer"	value="" />
					<div class="modal-content">
						<div class="modal-header"
								Style="padding: 4px 10px; background-color: white ;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
								<h4 class="Black ">
									<i class="fa fa-trash-o"></i> <strong>Voulez vous supprimer ce Patient ?</strong>
								</h4>
							</div>
                            <div class="alert alert-danger bigger-110" >
												Ce Patient Va 	&ecirc;tre Supprim&eacute; D&eacute;finitivement !
											</div>
							
								</div>


								<div class="modal-footer">
									<button class="btn btn-sm" data-dismiss="modal">
										<i class="ace-icon fa fa-times"></i> Annuler
									</button>

									<button class="btn btn-sm btn-danger" type="submit"
										name="PublierPatient">
										<i class="ace-icon fa fa-trash-o"></i><strong>Supprimer</strong>
									</button>
								</div>
						
					</div>
				</div>
				</form>
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
		<script
			src="${pageContext.request.contextPath}/resources/assets/js/date-time/bootstrap-datetimepicker.js"></script>



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
						    "sEmptyTable":     "Aucune donn&eacute;e disponible dans le tableau",
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

					null, null, null,null,null,  {
						"bSortable" : false
					} ],
					"aaSorting" : [],

				

					
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
				$('.show-details-btn').on(
						'click',
						function(e) {
							e.preventDefault();
							$(this).closest('tr').next().toggleClass('open');
							$(this).find(ace.vars['.icon']).toggleClass(
									'fa-angle-double-down').toggleClass(
									'fa-angle-double-up');
						});
				/***************/
				//MODAL Form Ajout
				$('#modal-form')
						.on(
								'shown.bs.modal',
								function() {
									if (!ace.vars['touch']) {
										$(this)
												.find('.chosen-container')
												.each(
														function() {
															$(this)
																	.find(
																			'a:first-child')
																	.css(
																			'width',
																			'210px');
															$(this)
																	.find(
																			'.chosen-drop')
																	.css(
																			'width',
																			'210px');
															$(this)
																	.find(
																			'.chosen-search input')
																	.css(
																			'width',
																			'200px');
														});
									}
								})

				//Modal Form Modif

				$('#modal-form-modif')
						.on(
								'shown.bs.modal',
								function() {
									if (!ace.vars['touch']) {
										$(this)
												.find('.chosen-container')
												.each(
														function() {
															$(this)
																	.find(
																			'a:first-child')
																	.css(
																			'width',
																			'210px');
															$(this)
																	.find(
																			'.chosen-drop')
																	.css(
																			'width',
																			'210px');
															$(this)
																	.find(
																			'.chosen-search input')
																	.css(
																			'width',
																			'200px');
														});

									}
								})

				/**
				//add horizontal scrollbars to a simple table
				$('#simple-table').css({'width':'2000px', 'max-width': 'none'}).wrap('<div style="width: 1000px;" />').parent().ace_scroll(
				  {
					horizontal: true,
					styleClass: 'scroll-top scroll-dark scroll-visible',//show the scrollbars on top(default is bottom)
					size: 2000,
					mouseWheelLock: true
				  }
				).css('padding-top', '12px');
				 */

			})
		</script>

		<script>
			$(document).on("click", '.edit_button', function(e) {
				var age = $(this).data('age');
				var pathologie = $(this).data('pathologie');
				var id = $(this).data('id');
				var commentaire = $(this).data('commentaire');
				$("#agemodif").val(age);
				$("#pathoModif").val(pathologie);
				$("#commentModif").val(commentaire);
				$("#idmodif").val(id);
				$("#modal-form-modif").modal();
				console.log(id);

			});
		</script>
		<script>
			$(document).on("click", '.ajouterPatient', function(e) {
				
				$("#modal-form").modal();
				

			});
		</script>
		<script>
			$(document).on("click", '.publierPatient', function(e) {
				var id = $(this).data('id');
				$("#idpatientpub").val(id);
				$("#modal-form-publier").modal();
				console.log(id) ;
				

			});
		</script>
		<script>
			$(document).on("click", '.supprimerPatient', function(e) {
				var idsupp = $(this).data('id');
				$("#idpatientsupprimer").val(idsupp);
				$("#modal-form-supprimer").modal();
				console.log(idsupp) ;
				

			});
		</script>
		<script>
			$('input[name="agemodif"], input[name="pathoModif"]')
					.change(
							function() {
								if ($(this).val()) {
									$("input[name='savemodif']").removeAttr(
											'disabled');
								}
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

		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$("#ajoutform")
										.validate(
												{
													rules : {

														age : {
															required : true,
															digits : true,

														},
														pathologie : {
															required : true,
															

														},
														commentaire : {
															required : true,
															minlength : 4,

														},
													},

													messages : {
														age : "Veuillez saisir un age compris entre 1 et 120.",
														pathologie : "Veuillez Choisir un Pathologie de la liste!",
														commentaire : "Le Champs Commentaire est Obligatoire!",
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
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$("#modifform")
										.validate(
												{
													rules : {

														agemodif : {
															required : true,
															digits : true,

														},
														pathoModif : {
															required : true,
															

														},
														commentModif : {
															required : true,
															minlength : 4,

														},
													},

													messages : {
														agemodif : "Veuillez saisir un age compris entre 1 et 120.",
														pathoModif : "Veuillez Choisir un Pathologie de la liste!",
														commentModif : "Le Champs Commentaire est Obligatoire!",
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
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$("#formpublication")
										.validate(
												{
													rules : {

														
														dateentrPub : {
															 
															required :true ,
														      minlength : 5 , 

														},
														
														datesortPub : {
															 
														      required :true ,
														      minlength : 5 , 

														},
													},

													messages : {
														dateentrPub : "Veuillez entrer une date d'entr&eacutee !",
														datesortPub : "Veuillez entrer une date de Sortie ! ",
														
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

