<%@page import="br.senai.sp.jandira.dao.ContatoDAO"%>
<%@page import="br.senai.sp.jandira.modelo.Contato"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.senai.sp.jandira.modelo.Usuario"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Usuario usuario = new Usuario();
	usuario = (Usuario) session.getAttribute("usuario");

	if (usuario == null) {
		response.sendRedirect("login.html");
	} else {
		ContatoDAO cDao = new ContatoDAO();
		Contato c = new Contato();
		c = cDao.getContato(Integer.parseInt("idContato"));
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
		<div class="navbar navbar-default">
			<h1>Contatos</h1>
		</div>
	</header>

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<img style="margin-right: 10px;" src="imagens/user24.png"><strong>Usuário</strong>
						</h3>
					</div>
					<div class="panel-body">
						<p><strong>Usuário:</strong> <%= usuario.getNome() %></p>
						<p><strong>Cidade:</strong> <%= usuario.getCidade() %></p>
						<p><strong>Dt. Nasc.:</strong> <%= usuario.getDtNasc() %></p>
						<p>&nbsp</p>
						<p><a href="sair.jsp"><img style="margin-right: 10px;" src="imagens/exit24.png">Sair do sistema</a></p>
					</div>
				</div>
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">
							<img style="margin-right: 10px;" src="imagens/menu24.png"><strong>Menu</strong>
						</h3>
					</div>
					<div class="panel-body">
						<ul class="nav">
							<li class="nav-item"><a href="index.jsp">Home</a></li>
							<li class="nav-item"><a href="cadastrar_contato.jsp">Adiconar Contato</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title">
							<img style="margin-right: 10px;" src="imagens/users24.png"><strong>Meus Contatos</strong>
						</h3>
					</div>
					<div class="panel-body">
						<!-- FORMULÁRIO DE CADASTRO DE CONTATOS -->
						<form method="GET" action="GravarContato">
							<!-- LINHA 01 -->
							<fieldset>
								<legend>Dados gerais:</legend>
								<div class="form-row">
									<div class="form-group col-md-6">
										<input type="hidden" name="txtIdUsuario" value="<%= usuario.getId() %>">
										<label for="txtNome">Nome:</label>
										<input type="text" name="txtNome" class="form-control" value="<%= c.getNome() %>">
									</div>
									<div class="form-group col-md-3">
										<label for="txtDtNasc">Dt. Nasc.:</label> <input type="date"
											name="txtDtNasc" class="form-control">
									</div>
									<div class="form-group col-md-3">
										<label for="cbSexo">Sexo:</label> <select name="cbSexo"
											class="form-control">
											<option value="s">Selecione</option>
											<option value="f">Feminino</option>
											<option value="m">Masculino</option>
										</select>
									</div>

								</div>
							</fieldset>
							<!-- LINHA 02 -->
							<fieldset>
								<legend>Dados de contato:</legend>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="txtEmail">E-mail:</label> <input type="mail"
											name="txtEmail" class="form-control">
									</div>
									<div class="form-group col-md-3">
										<label for="txtTelefone">Telefone:</label> <input type="text"
											name="txtTelefone" class="form-control">
									</div>
									<div class="form-group col-md-3">
										<label for="txtCelular">Celular:</label> <input type="text"
											name="txtCelular" class="form-control">
									</div>

								</div>
							</fieldset>
							<!-- LINHA 03 -->
							<fieldset>
								<legend>Dados de endereço:</legend>
								<div class="form-row">
									<div class="form-group col-md-8">
										<label for="txtLogradouro">Logradouro:</label> <input
											type="text" name="txtLogradouro" class="form-control">
									</div>
									<div class="form-group col-md-4">
										<label for="txtBairro">Bairro:</label> <input type="text"
											name="txtBairro" class="form-control">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="txtCidade">Cidade:</label> <input type="text"
											name="txtCidade" class="form-control">
									</div>
									<div class="form-group col-md-3">
										<label for="txtEstado">Estado:</label> <input type="text"
											name="txtEstado" class="form-control">
									</div>
									<div class="form-group col-md-3">
										<label for="txtCep">CEP:</label> <input type="text"
											name="txtCep" class="form-control">
									</div>
								</div>
							</fieldset>
							
							<div class="form-row">
								<div class="col-md-12">
									<input type="submit" value="Salvar" class="btn btn-success" />
									<input type="reset" value="Limpar" class="btn btn-warning" />
									<a href="index.jsp" class="btn btn-danger">Cancelar</a>
								</div>
							</div>
						</form>
					</div>
					<div class="panel-footer">Panel footer</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

<%
	}
%>