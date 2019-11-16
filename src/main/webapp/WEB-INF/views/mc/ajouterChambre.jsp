<%@ taglib uri="http://www.springframework.org/tags"  prefix ="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

 
<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">
 <div class="body">
 

 <div class="page-header">
							<h1>
						 <strong><i class="fa fa-bed" aria-hidden="true"></i> Ajouter Une Chambre </strong> 
								
							</h1>
							
						</div>
                       <div class="space-4"></div>
                       <div class="space-4"></div>
                       <div class="space-4"></div>
                       
                       
								<div class="col-xs-12" style=" padding :20px 150px ;">		
                       <div class="widget-box" style="width: 580px;   " >
										<div class="widget-header">
													<h4 class="widget-title red">Entrez Les Informations de la chambre à Ajouter .</h4>
	                                   </div>
							
								<!-- PAGE CONTENT BEGINS -->
								<form id="ajoutForm"  class="form-horizontal"  action="<c:url value='/mc/addChambre' />"   >
					   <div class="space-4"></div>
                       <div class="space-4"></div>
                       <div class="space-4"></div>
                         <div class="space-4"></div>
                        <div class="space-4"></div>
                       <div class="space-4"></div><div class="space-4"></div>
                       		<div class="space-4"></div>
                       <div class="space-4"></div>
									<!-- #section:elements.form -->
									<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"><strong>Numéro Chambre  :</strong></label>
										

										<div class="col-sm-9">
													<div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-stop-circle" aria-hidden="true" ></i></span>
													<input type="text" id="numchambre" name="numchambre"
														placeholder="Numéro Chambre" class="col-xs-10 col-sm-5"
														style="width: 150px;" />
														</div>
												</div>
										
										</div>
										<div class="space-4"></div>
										 <div class="space-4"></div>
										 <div class="space-4"></div>
										<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"><strong>Nombre des lits  :</strong></label>
										

										<div class="col-sm-9">
													<div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-bed" aria-hidden="true" ></i></span>
													<input type="text" id="nblits" name="nblits"
														placeholder="Nombre des lits" class="col-xs-10 col-sm-5"
														style="width: 150px;" />
														</div>
												</div>
										
										</div>
										<div class="space-4"></div>
										 <div class="space-4"></div>
										 <div class="space-4"></div>
									<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"><strong>Pathologie Supportée:</strong></label>
									

										<div class="col-sm-9">
													<div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></span>
														<select name="pathologie" class="form-control col-xs-10 col-sm-5" id="pathologie"	style="width: 150px;">
														     <option value ="">-Pathologie-</option>
															<c:forEach var="pathologie" items="${listPath}">
															<option value="${pathologie.getNompathologie()}">${pathologie.getNompathologie()}</option>
															
														</c:forEach>	
														</select>
														</div>
												</div>
									
										
									
									
									
									
									
										
									</div>
									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											

											
											<button class="btn" type="reset">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Reset
											</button>
											&nbsp; &nbsp; &nbsp;
											<button class="btn btn-info" type="submit">
												<i class="ace-icon fa fa-check bigger-110"></i>
												Ajouter
											</button>
										</div>
									</div>

									</form>
									${msgAdd}
						</div>						
 </div>
 </div>
 

 <script
			src="${pageContext.request.contextPath}/resources/assets/js/date-time/bootstrap-datepicker.js"></script>
 	<script
			src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.js"></script>
			
			  <script type="text/javascript">
			  jQuery(function($) {
				  
				  $('.date-picker').datepicker({
						autoclose : true,
						todayHighlight : true
					})
					//show datepicker when clicking on the icon
					.next().on(ace.click_event, function() {
						$(this).prev().focus();
					});
				  
				  
			  });
				
			  </script>
			  
  <script type="text/javascript">
		

		$( document ).ready( function () {
			$( "#ajoutForm" ).validate( {
				rules: {
				    
				   
				  
					numchambre: {
				        required: true,
				        digits: true,
				        
				    },
				    pathologie: {
				        
				    	required: true,
				        
				        
				    },
				    nblits: {
				        required: true,
				        digits: true,
				        
				    },
				},
				
				messages: {
					numchambre: "Veuillez Indiquer le numéro de la chambre à ajouter!",
					pathologie: "Veuillez Choisir une Pathologie de la Liste",
				    nblits: "Saisir le nombre de lits dans cette chambre !",
				},
				errorElement: "em",
				errorPlacement: function ( error, element ) {
					// Add the `help-block` class to the error element
					error.addClass( "help-block" );

					// Add `has-feedback` class to the parent div.form-group
					// in order to add icons to inputs
					

					

					// Add the span element, if doesn't exists, and apply the icon classes to it.
					
					if (element.parent('.input-group').length) {
					    error.insertAfter(element.parent());
					} else {
					    error.insertAfter(element);
					}
				},
				
				highlight: function ( element ) {
				    $(element).closest('.form-group').addClass('has-error');
					$( element ).next( "span" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
				},
				unhighlight: function ( element) {
				    $(element).closest('.form-group').removeClass('has-error');
					$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
				}
			} );
		} );
    </script>
 
 </tiles:putAttribute>
 </tiles:insertDefinition>>