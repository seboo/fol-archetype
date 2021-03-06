#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page 
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="formOnLine.msBeans.*, com.triangle.lightfw.*,formOnLine.Controls"
%>
<% SessionInfos sessionInfos = (SessionInfos)request.getSession().getAttribute(com.triangle.lightfw.AbstractServlet.ID_SESSION_INFOS);%>
<jsp:useBean id="message" class="java.lang.String" scope="session" />
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<META HTTP-EQUIV="pragma" CONTENT="no-store, no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-store, no-cache, must-revalidate, post-check=0, pre-check=0">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<META NAME="Expires" CONTENT="0">

<link href="theme/jquery-ui-1.8.13.custom.css" rel="stylesheet" type="text/css">
<link href="theme/Master.css" rel="stylesheet" type="text/css">
<link href="theme/Master-fol-example.css" rel="stylesheet" type="text/css">
<link href="theme/tabnav.css" rel="stylesheet" type="text/css"	media="print, projection, screen" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

<script type="text/javascript" src="js/IdF_functions.js" language="JavaScript" content="text/html; charset=UTF-8"	></script>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js" ></script>
<script type="text/javascript" src="js/jquery.ui.datepicker-fr.js" ></script>
<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js" ></script>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,200' rel='stylesheet' type='text/css'>

<script type="text/javascript">
// comportement dynamique du header
${symbol_dollar}(function(){
	   ${symbol_dollar}(window).scroll(function () {//Au scroll dans la fenetre on déclenche la fonction
	      if (${symbol_dollar}(this).scrollTop() > 120) { //si on a défilé de plus de 160px du haut vers le bas
	          ${symbol_dollar}('${symbol_pound}header').addClass("fixed"); //on ajoute la classe "fixe" au header
	      } else {
	      ${symbol_dollar}('${symbol_pound}header').removeClass("fixed");//sinon on retire la classe "fixe" (c'est pour laisser le header à son endroit de départ lors de la remontée
	      }
	   });
});
</script>
<TITLE>FOL EXAMPLE</TITLE>
</HEAD>
<BODY>
<noscript>
  !!! Cette application utilise le JAVASCRIPT, vous devez activer l'option JAVASCRIPT de votre navigateur.
</noscript>
<div class="tabSize">

<% //base URL pour les images
StringBuffer url = request.getRequestURL();
String uri = request.getRequestURI();
String ctx = request.getContextPath();
String baseURL = url.substring(0, url.length() - uri.length() + ctx.length()) + "/";
%>
<base href="<%=baseURL%>" >

<table width="100%" cellpadding="10px">
	<tr>
		<td align="left" bgcolor="FFFFFF"  >
		<span style="font-family:Raleway, Verdana;font-weight: 200;font-size:48px;color:${symbol_pound}CC6600">fol<span style="color:${symbol_pound}F3B935">e</span>xample</span>
		</td>
		<td align=right  bgcolor="FFFFFF" ><img name="logo" src="images/sheet-b.jpg" 	border=0 alt="logo" ></td>
	</tr>
</table>

<div id=header>
<table  class="tabSize">
	<tr><td style="text-align: right;" class="menuRH" cellpadding="10px">
	<a href="<%=response.encodeURL(request.getContextPath()+"/ServControl?action=LOGIN")%>">Accueil</a> 
	<% if ((sessionInfos != null) && (sessionInfos.getRole()>SessionInfos.ROLE_PUBLIC)) { %>
	<a href="<%=response.encodeURL(request.getContextPath()+"/ServControl?action=RLIST")%>">Rechercher</a> 
	<% } %>
	<% if ((sessionInfos != null) && (sessionInfos.getRole()>=SessionInfos.ROLE_GESTION)) { %>
	<a href="<%=response.encodeURL(request.getContextPath()+"/ServControl?action=SEXP")%>">Exports</a> 
	<a href="<%=response.encodeURL(request.getContextPath()+"/ServControl?action=STAT")%>">Stats</a> 
	<% } %>
	<% if ((sessionInfos != null) && (sessionInfos.getRole()>=SessionInfos.ROLE_ADMIN)) { %>
	<a href="<%=response.encodeURL(request.getContextPath()+"/ServControl?action=QLIST")%>">Admin</a> 
	<a href="<%=response.encodeURL(request.getContextPath()+"/ServControl?action=MODTAB")%>">Config</a> 
	<% } %>
	<a href="<%=response.encodeURL(request.getContextPath()+"/ServControl?action=FIN")%>">Quitter</a>
	</td></tr>
</table>
</div>

<table  class="tabSize">
	 <tr >
	 <td style="text-align: center;">
	 <% if (!Controls.isBlank(message)) { %>
	 <div class='errorText'><strong><%=message%></div>
	 <% } %>&nbsp;
	 </td>
	 </tr>

</table>

