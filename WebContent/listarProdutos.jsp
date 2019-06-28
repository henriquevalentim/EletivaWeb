<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="br.edu.fatec.web.modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.fatec.web.dao.ProdutoDAO"%>
<%@page import="br.edu.fatec.web.modelo.EntidadeDominio"%>
<%@page import="br.edu.fatec.web.modelo.Produto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>CompreAki</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<link href="assets/sweet-alert2/sweetalert2.min.css" rel="stylesheet"
	type="text/css" />

<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- App css -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/font-awesome.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/core.css" rel="stylesheet" type="text/css" />
<link href="assets/css/components.css" rel="stylesheet" type="text/css" />
<link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
<link href="assets/css/pages.css" rel="stylesheet" type="text/css" />
<link href="assets/css/menu.css" rel="stylesheet" type="text/css" />
<link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />

<script src="assets/js/modernizr.min.js"></script>

<!-- jQuery  -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/waves.js"></script>
<script src="assets/js/jquery.slimscroll.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>

<!-- App js -->
<script src="assets/js/jquery.core.js"></script>
<script src="assets/js/jquery.app.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<style>
.menu {
	margin-top: 8%;
}

body {
	background-color: #0080FF;
}

.caixa {
	border-radius: 15px;
	margin-top: 2%;
	margin-left: 5%;
	width: 90%;
	height: 90%;
	position: absolute;
	margin-bottom: 5%;
	background-color: white;
}

.caixaProduto {
	margin-left: 10px;
	width: 320px;
	height: 450px;
	padding-left: 20px;
	padding-right: 20px;
	position: relative;
	float: left;
	background-color: #FFF;
}

.caixaInternaProduto {
	border: 2px solid rgba(0, 0, 0, 0.1);
	border-radius: 15px;
	margin-top: 20px;
	width: 100%;
	height: 420px;
	position: relative;
	float: left;
}

.nomeProduto {
	margin: auto;
	width: 85%;
	height: 30px;
	position: relative;
	text-align: center;
	font-weight: bold;
	/*background-color: red;*/
}

.fotoProduto {
	width: 200px;
	height: 200px;
	position: relative;
	margin-left: 15%;
}

.precoProduto {
	margin: auto;
	text-align: center;
	top: 10px;
	font-weight: bold;
	position: relative;
}

h5 {
	font-weight: bold;
	font-size: 12px;
	margin-top: 5px;
	margin-bottom: 0px;
}

a:link {
	text-decoration: none;
}
</style>

</head>
<body>
	<header>

		<!-- inicio primeiro menu -->
		<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp"> <img
					src="assets/images/logo.png" class="img-fluid">
				</a>

				<form class="form-inline my-2 my-lg-4">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Pesquisar" aria-label="Pesquisar">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Pesquisar</button>
				</form>

				<%
					Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");
				%>


				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle navbar-right" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <%=usuario.getLogin()%>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="index.jsp">Sair</a>
						</div></li>
				</ul>
				<!-- <ul class="nav navbar-nav navbar-right">
                            <li></li>
                            <li><a href="index.jsp">Sair</a></li>
                        </ul> -->
			</div>

		</nav>
		<!-- fim primeiro menu -->

		<div class="menu">

			<!-- inicio segundo menu -->
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

				<div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
					<ul class="navbar-nav mr-auto">

						<li class="nav-item dropdown" style="margin-left: 100px;"><a
							class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> CRUD PRODUTO </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="cadastrarProduto.jsp">Cadastrar</a>
								<a class="dropdown-item" href="#">Listar</a>
							</div></li>

					</ul>
				</div>
			</nav>
		</div>
		<!-- fim segundo menu -->
	</header>

	<div class="caixa">

		<div class="row">
			<div class="col-md-12">
				<div class="card-box">
					<h4 class="header-title m-b-15 m-t-0">Lista Produtos</h4>


					<table
						class="table table-hover m-0 tickets-list table-actions-bar dt-responsive nowrap"
						cellspacing="0" width="100%" id="datatable">
						<thead>
							<tr>
								<th>ID</th>
								<th>Nome</th>
								<th>Preço Compra</th>
								<th>Preço Venda</th>
								<th>urlLink</th>
								<th>Categoria</th>
								<th class="hidden-sm">Action</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="produto" items="${ produtosADM }">
								<tr>
									<td><b>${ produto.id }</b></td>

									<td><span class="m-l-5"><b>${ produto.nome }</b></span> </a></td>

									<td>${ produto.precoCompra }</td>

									<td>${ produto.precoVenda }</td>

									<td>${ produto.urlFoto }</td>

									<td>${ produto.idCategoria }</td>

									<td>
										<button type="button"
											class="btn btn-default waves-effect waves-light btn-sm">
											<a href="ControleAdmin?opcao=buscar&id=${ produto.id }">Alterar</a>
										</button>

									</td>
									<td>
										<button type="button" value="${ produto.id }"
											class="btn btn-default waves-effect waves-light btn-sm excluir">Excluir</button>
									</td>
								<tr>
									<!-- <td class="middle-align"></td>
                                            <td>
                                                <button type="button"
											class="btn btn-default waves-effect waves-light btn-sm"
											id="sa-params">Excluir
											</button>
                                            </td>
                                        </tr> -->
								</tr>

							</c:forEach>
							<!-- Sweet-Alert  -->
							<script src="assets/sweet-alert2/sweetalert2.min.js"></script>
							<script src="assets/pages/jquery.sweet-alert.init.js"></script>
</body>

</html>