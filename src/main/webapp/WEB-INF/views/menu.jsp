		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div id="sidebar" class="sidebar responsive  ace-save-state"  >
			<script type="text/javascript">
				try {
					ace.settings.loadState('sidebar')
				} catch (e) {
				}
			</script>
			

			<div class="sidebar-shortcuts" id="sidebar-shortcuts" style ="background-color: #C8C8C8;">
				
					<div class="navbar-brand white"  ><i  class="fa fa-list"></i>      <strong>Menu</strong></div>

					
			

				
			</div>
			<!-- /.sidebar-shortcuts -->

			<ul class="nav nav-list" >
				<li class="" ><a href="<c:url value='${home_link}' />"> <i
						class="menu-icon fa fa-home home-icon"></i> <span class="menu-text">
							<strong>Accueil</strong> </span>
				</a> <b class="arrow"></b></li>

				<li class=""><a href="<c:url value='${menu2lien}' />"> <i
						class="menu-icon ${menu2icon}"></i> <span class="menu-text">
							 <strong>${menu2}</strong> </span> 
				</a> 

					</li>

				<li class=""><a href="<c:url value='${menu3lien}' />" > <i
						class="menu-icon fa fa-list"></i> <span class="menu-text">
							<strong>${menu3}</strong> </span> 
				</a> 

					

				<li class=""><a href="<c:url value='${menu4lien}' />" > <i
						class="menu-icon ${menu4icon}"></i> <span
						class="menu-text"> <strong>${menu4}</strong> </span> 
				</a> 

					</li>

				

				<li class=""><a href=""> <i
						class="menu-icon fa fa-calendar"></i> <span class="menu-text">
							<strong>Calendrier</strong> <!-- #section:basics/sidebar.layout.badge --> <span
							class="badge badge-transparent tooltip-error"
							title="1 Evenement Important"> <i
								class="ace-icon fa fa-exclamation-triangle red bigger-130"></i>
						</span> <!-- /section:basics/sidebar.layout.badge -->
					</span>
				</a> <b class="arrow"></b></li>


				<li class=""><a href="#" class="dropdown-toggle"> <i
						class="menu-icon fa fa-file-o"></i> <span class="menu-text">
							<strong>Autres Pages</strong> <!-- #section:basics/sidebar.layout.badge --> <span
							class="badge badge-primary">5</span> <!-- /section:basics/sidebar.layout.badge -->
					</span> <b class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>

					</li>
					<li class=""><a href="<c:url value='/profilem' />"> <i
						class="menu-icon fa fa-user"></i> <span class="menu-text">
							<strong>Modifier Profile</strong> </span>
				</a> <b class="arrow"></b></li>
				
					<li class="" ><a href="<c:url value='/logout' />"> <i
						class="menu-icon fa fa-power-off"></i> <span class="menu-text ">
							<strong>Se Déconnecter</strong> </span>
				</a> <b class="arrow"></b></li>
			</ul>
			<!-- /.nav-list -->

			<!-- #section:basics/sidebar.layout.minimize -->
			<div class="sidebar-toggle" >
				
			</div>

			<!-- /section:basics/sidebar.layout.minimize -->
		</div>