<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<tiles:importAttribute name="cssList"/>
<tiles:importAttribute name="jsList"/>

<html  style=" width: 1349px;" >
    <head>
    <meta charset="UTF-8">
         <!-- appel dynamique aux ressource js/css -->
         
    <c:forEach var="cssValue" items="${cssList}">
        <link type="text/css" rel="stylesheet" href="<c:url value="${cssValue}"/>" />
    </c:forEach>
      <c:forEach var="jsValue" items="${jsList}">
        <script src="<c:url value="${jsValue}"/>"></script>
    </c:forEach>
   

</head>
<body class="no-skin">
   <tiles:insertAttribute name="header" />
        <div class="main-container ace-save-state" id="main-container"     >
        <script type="text/javascript">
			try {
				ace.settings.loadState('main-container')
			} catch (e) {}
		</script>
		 <tiles:insertAttribute name="menu" />
		 
        <div class="main-content">
       
           <div class="main-content-inner">
           
           
              
            <tiles:insertAttribute name="body" />
            
           </div>
             
        </div>
        <tiles:insertAttribute name="footer" />
      </div>
   
</body>
</html>