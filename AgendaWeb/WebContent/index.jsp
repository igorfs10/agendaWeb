<%@page import="br.senai.sp.jandira.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

	Usuario usuario = new Usuario();
	usuario = (Usuario) session.getAttribute("usuario");
	
	if (usuario == null){
		response.sendRedirect("login.html");
	} else{

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teste Java - JSP</title>
<link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
	<header>
	<h1>Resultado</h1>
	</header>
	
	<p>Nome: <%= usuario.getNome() %></p>
	<p>Email: <%= usuario.getEmail() %></p>
	
</body> 
</html>

<% } %>