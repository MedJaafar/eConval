<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="navbar" class="navbar navbar-default          ace-save-state" style="height : 40px;">
		<div class="navbar-container ace-save-state" id="navbar-container">
			<!-- #section:basics/sidebar.mobile.toggle -->
			<button type="button" class="navbar-toggle menu-toggler pull-left"
				id="menu-toggler" data-target="#sidebar">
				<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

			<!-- /section:basics/sidebar.mobile.toggle -->
			<div class="navbar-header pull-left">
				<!-- #section:basics/navbar.layout.brand -->
				
				
				<a href="<c:url value='${home_link}' />" class="navbar-brand"> <small> <i  
						     class="fa fa-heartbeat"> </i> <strong><strong>e Conval</strong></strong> <small><small><small>${entete}</small></small></small>
				</a>

				<!-- /section:basics/navbar.layout.brand -->

				<!-- #section:basics/navbar.toggle -->

				<!-- /section:basics/navbar.toggle -->
			</div>
			<div class="navbar-header " style =" position: absolute;  margin:auto; margin-left:580px;">
			<p  class ="navbar-brand"> <i class="fa fa-hospital-o" aria-hidden="true"></i> <strong> ${etablissement}</strong>  </p>
			</div>
	<script type="text/javascript">
							if ('ontouchstart' in document.documentElement)
								document
										.write("<script src='/resources/assets/js/jquery.mobile.custom.js'>"
												+ "<"+"/script>");
						</script>
			<!-- #section:basics/navbar.dropdown -->
			<div class="navbar-buttons navbar-header pull-right"
				role="navigation">
				<ul class="nav ace-nav">
					

					<li class="purple"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i
							class="ace-icon fa fa-bell icon-animated-bell"></i> <span
							class="badge badge-important">${notifnbr}</span>
					</a>

						<ul
							class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i
								class="ace-icon fa fa-exclamation-triangle"></i> ${notifnbr} Notifications
							</li>

							<li class="dropdown-content">
								<ul class="dropdown-menu dropdown-navbar navbar-pink">
								<c:forEach   var="notification" items="${notifications}">
									<li><a href="#">
											<div class="clearfix">
												<span class="pull-left"> <i
													class="blue fa fa fa-share"></i> <strong>${notification.getMessage()}</strong><br><span class="blue"></span>
													
												</span> 
											</div>
									</a></li> </c:forEach>

									
								</ul>
							</li>

							<li class="dropdown-footer"><a href="<c:url value='${notif_link}' />"> Voir Tout 
									 <i class="ace-icon fa fa-arrow-right"></i>
							</a></li>
						</ul></li>

					
					<!-- #section:basics/navbar.user_menu -->
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="${pageContext.request.contextPath}/resources/assets/avatars/imageOp.png"
							 /> <span class="user-info"> <small>Bienvenue,</small>
								<Strong>${usernameh}</Strong>
						</span> <i class="ace-icon fa fa-caret-down"></i>
					</a>

						<ul
							class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							

							<li><a href="<c:url value="/profilem" />"> <i
									class="ace-icon fa fa-user"></i> Profile
							</a></li>

							<li class="divider"></li>
							    
							<li><a href="<c:url value="/logout" />"><i class="ace-icon fa fa-power-off"></i>
									Se D&eacute;connecter
							</a></li>
						</ul></li>

					<!-- /section:basics/navbar.user_menu -->
				</ul>
			</div>
<script>
	$(document).on('click', '.dropdown-toggle', function(e) {
		e.stopImmediatePropagation();
		e.stopPropagation();
		e.preventDefault();
	});
	</script>
			<!-- /section:basics/navbar.dropdown -->
		</div>
		<!-- /.navbar-container -->
	</div>
	