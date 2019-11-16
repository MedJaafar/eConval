<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Login Page - Ace Admin</title>

<meta name="description" content="User login page" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->


<link href="<c:url value="/resources/assets/css/bootstrap.css" />"
	rel="stylesheet" />


<link href="<c:url value="/resources/assets/css/font-awesome.css" />"
	rel="stylesheet" />


<!-- text fonts -->

<link href="<c:url value="/resources/assets/css/ace-fonts.css" />"
	rel="stylesheet" />

<!-- ace styles -->

<link href="<c:url value="/resources/assets/css/ace.css" />"
	rel="stylesheet" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="../assets/css/ace-part2.css" />
		<![endif]-->




<link href="<c:url value="/resources/assets/css/ace-rtl.css" />"
	rel="stylesheet" />


<!--[if lte IE 9]>
		  <link rel="stylesheet" href="../assets/css/ace-ie.css" />
		<![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
		<script src="../assets/js/html5shiv.js"></script>
		<script src="../assets/js/respond.js"></script>
		<![endif]-->
</head>

<body class="login-layout"
	background="${pageContext.request.contextPath}/resources/assets/avatars/gallery1.jpg">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<i class="ace-icon fa fa-heartbeat red"></i> <span class="red">e</span>
								<span class="white" id="id-text2">Conval</span>
							</h1>
							<h4 class="blue" id="id-company-text">
								&copy; <Strong>Binov</Strong>
							</h4>
						</div>

						<div class="space-6"></div>

						<div class="position-relative" >
							<div id="login-box" 
								class="login-box visible widget-box no-border">
								<div class="widget-body" >
									<div class="widget-main">
										<h4 class="header blue lighter bigger">

											<i class="glyphicon glyphicon-user"></i> <strong>Entrez
												vos coordonnées</strong>
										</h4>

										<div class="space-6"></div>
										${msgError} 
										${msgCreation}
										${msgLogout}
										 <div class="space-6"></div>
										<form name='loginForm' id='login'
											action="<c:url value='/j_spring_security_check' />"
											method='post'>
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" name="j_username" class="form-control"
														placeholder="Username" /> <i class="ace-icon fa fa-user"></i>
												</span>
												
												</label>
												<div class="space"></div>
												
												 <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" name="j_password" class="form-control"
														placeholder="Password" /> <i class="ace-icon fa fa-lock"></i>
												</span>
												</label>

												<div class="space"></div>

												<font color="red"> <span><strong>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</strong></span>
												</font>
												<div class="space"></div>
												<div class="clearfix">
													<label class="inline"> <input type="checkbox"
														class="ace" /> <span class="lbl">Se souvenir de
															moi</span>
													</label>

													<button type="submit"
														class="width-38 pull-right btn btn-sm btn-primary">
														<i class="ace-icon fa fa-lock"></i> <span
															class="bigger-110"><strong>Connexion</strong></span>

													</button>
												</div>

												
												<div class="space-4"></div>
											</fieldset>
										</form>

										

										<div class="space-6"></div>

										
									</div>
									<!-- /.widget-main -->

									<div class="toolbar clearfix">
										<div>
											<a href="#" data-target="#forgot-box"
												class="forgot-password-link"> <i
												class="ace-icon fa fa-arrow-left"></i> <strong>Mot de passe oublié</strong>
											</a>
										</div>

										<div>
											<a href="#" data-target="#signup-box"
												class="user-signup-link"> <strong>Créer Compte</strong> <i
												class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="ace-icon fa fa-key"></i> Changer Mot de Passe
										</h4>

										<div class="space-6"></div>
										<p><b>Saisir votre e-mail pour changer votre mot de passe</b></p>

										<form id="sendmail" action="/sendEmail" >
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="email" id="emailrec" name = "emailrec" class="form-control" placeholder="Email" />
														<i class="ace-icon fa fa-envelope"></i>
												</span>
												</label>

												<div class="clearfix">
													<button type="button" type="submit" value="/sendEmail"  class="width-35 pull-right btn btn-sm btn-danger">
														<i class="ace-icon fa fa-lightbulb-o"></i> <span
															class="bigger-110">Envoyer!</span>
													</button>
												</div>
											</fieldset>
										</form>
									</div>
									<!-- /.widget-main -->

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> Retour à Se Connecter <i
											class="ace-icon fa fa-arrow-right"></i>
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border" Style="width:400px;">
								<div class="widget-body" >
									<div class="widget-main" >
										<h5 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i> <strong>Créer
												un nouvel utilisateur</strong>
										</h5>


										<p>
											<strong> Entrez vos détails pour commencer :</strong>
										</p>

										<form id="nouvel_utilisateur" action="creer_compte" method="post">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" class="form-control" name="nom" id="nom"
														placeholder="Nom" /> <i class="ace-icon fa fa-info"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" class="form-control" name="prenom" id="prenom"
														placeholder="Prénom" /> <i class="ace-icon fa fa-info"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" class="form-control" name="usernamenv" id="usernamenv"
														placeholder="Nom d'utilisateur" /> <i
														class="ace-icon fa fa-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="email" class="form-control" name="emailnv" id="emailnv"
														placeholder="Email" /> <i class="ace-icon fa fa-envelope"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" class="form-control" name="mdpasse" id="mdpasse"
														placeholder="Mot de passe" /> <i
														class="ace-icon fa fa-lock"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" class="form-control" name="rmdpasse" id="rmdpasse"
														placeholder="Répéter mot de passe" /> <i
														class="ace-icon fa fa-repeat"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" class="form-control" name="tel" id="tel"
														placeholder="Téléphone" /> <i
														class="ace-icon fa fa-phone-square"></i>
												</span>
												</label>
												 
												 <div class="hr"></div>
												 <p>
											<strong>Choisissez votre Etablissement :</strong>
										</p>
												<div>

													<div class="form-group">
														<input type="radio" name="role" checked
															Onclick="show('selectho','selectmc');" id="role"
															value="ho" /> <span class="lbl"> <strong>
																Opérateur Hopital</strong> <i
														class="ace-icon fa fa-h-square"></i>
														</span> <select name="hopitallist" class="form-control" id="selectho"
															style="display: block;">
															<c:forEach var="hopitaux" items="${hopitaux}">
															<option value="${hopitaux.getNomHopital()}">${hopitaux.getNomHopital()}</option>
															
														</c:forEach>	
														</select>
													</div>
													<div class="form-group">
														<input type="radio" name="role" id="role" value="mc"
															Onclick="show('selectmc','selectho');"> <span
															class="lbl"> <strong> Opérateur
																M_Convalecence</strong>  <i
														class="ace-icon fa fa-medkit"></i>
														</span> <select name="mclist" class="form-control" id="selectmc"
															style="display: none;">
															
														<c:forEach var="mconval" items="${mconval}">
															<option value="${mconval.getNomMc()}">${mconval.getNomMc()}</option>
															
														</c:forEach>
															
														</select>
													</div>


												</div>



												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon fa fa-refresh"></i> <span
															class="bigger-110">Reset</span>
													</button>

													<button type="submit" value="creer_compte"
														class="width-65 pull-right btn btn-sm btn-success">
														<span class="bigger-110">Créer Compte</span> <i
															class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> <i
											class="ace-icon fa fa-arrow-left"></i> Retour à Se Connecter
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.signup-box -->
						</div>
						<!-- /.position-relative -->

						<!-- <div class="navbar-fixed-top align-right">
								<br />
								&nbsp;
								<a id="btn-login-dark" href="#">Dark</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-blur" href="#">Blur</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-light" href="#">Light</a>
								&nbsp; &nbsp; &nbsp;
							</div> -->
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->

	<!--<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.js"></script> -->

	<script src="<c:url value="/resources/assets/js/jquery.js" />"></script>
	<script
			src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.js"></script>



	<!-- <![endif]-->

	<!--[if IE]>
<script src="../assets/js/jquery1x.js"></script>
<![endif]-->
	<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='/resources/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
    if('ontouchstart' in document.documentElement) document.write("<script src='/resources/WebContent/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");

		</script>
	<script>
		function show(idshow, idhide) { // On déclare la fonction toggle_div qui prend en param le bouton et un id
			  var div = document.getElementById(idshow); // On récupère le div ciblé grâce à l'id
			  var div2 = document.getElementById(idhide);
			  div.style.display = "block"; 
			  div2.style.display = "none"; 
			  
			}
	
		</script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
			jQuery(function($) {
			 $(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			 });
			});
			
			
			
			//you don't need this, just used for changing background
			jQuery(function($) {
			 $('#btn-login-dark').on('click', function(e) {
				$('body').attr('class', 'login-layout');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-light').on('click', function(e) {
				$('body').attr('class', 'login-layout light-login');
				$('#id-text2').attr('class', 'grey');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-blur').on('click', function(e) {
				$('body').attr('class', 'login-layout blur-login');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'light-blue');
				
				e.preventDefault();
			 });
			 
			});
			$('input[type="checkbox"]').on('change', function() {
				   $(this).siblings('input[type="checkbox"]').prop('checked', false);
				});
		</script>
		 <script type="text/javascript">
		

		$( document ).ready( function () {
			$( "#sendmail" ).validate( {
				rules: {
				   emailrec : {
				        required: true,
				        email : true ,
				    },
				  
				    },
				messages: {
					emailrec: "Ce n'est pas une adresse email valide !",
					
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
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$("#nouvel_utilisateur")
										.validate(
												{
													rules : {

														nom : {
															required : true,
															minlength : 3,
															

														},
														prenom : {
															required : true,
															minlength : 3,

														},
														usernamenv : {
															required : true,
															minlength : 4,

														},
														
												
														emailnv : {
														required : true,
														email : true ,
														minlength : 4,

													
													},
													
													mdpasse : {
														required : true,
														minlength : 5,
                                                   },
                                            
                                                   rmdpasse: {
                                                       required: true,
                                                        
                                                       equalTo : "#mdpasse",
                                                   },
                                                   
                                                  tel : {
														required : true,
														minlength : 5,
														digits : true ,
                                                 },
                                                  
													},
													messages : {
														nom : "*Le champs Nom est Obligatoire!",
														prenom : "*Le champs prénom est Obligatoire!",
														usernamenv : "*Le Champs Username est Obligatoire!",
														emailnv : "*Veuillez saisir un e-mail valide !",
														tel : "*Veuillez saisir un téléphone valide !" , 
														mdpasse :"*Veuillez saisir un mot de passe.",
														rmdpasse: "*Répétez le mot de passe correctement. "
														
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
		
</body>
</html>
