<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

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
<
style>.menu {
	margin-top: 8%;
}

body {
	background-color: #0080FF;
}

.caixa {
	border-radius: 15px;
	margin-top: 3%;
	margin-left: 5%;
	width: 90%;
	height: auto;
	position: absolute;
	margin-bottom: 20%;
	background-color: white;
}

.material-icons {
	font-size: 40px;
}

.caixaProduto {
	margin-left: 10px;
	width: 340px;
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

				<ul class="nav navbar-nav navbar-right">
					<li><a href="carrinhoCompraLogado.jsp"> <i
							class="material-icons">local_shipping</i>
					</a></li>
					<li><a href="cadastrarCliente.jsp"><span
							class="glyphicon glyphicon-user"></span> CADASTRAR / </a></li>
					<li><a href="login.jsp"><span
							class="glyphicon glyphicon-log-in"></span> ENTRAR</a></li>
				</ul>
			</div>
		</nav>
		<!-- fim primeiro menu -->

		<div class="menu" style="margin-top: 8%">

			<!-- inicio segundo menu -->
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

				<div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
					<ul class="navbar-nav mr-auto">

						<li class="nav-item dropdown" style="margin-left: 100px;"><a
							class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> PLAYSTATION </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="produtosCat.jsp?categoria=3">Consoles</a>
								<a class="dropdown-item" href="produtosCat.jsp?categoria=1">Jogos</a>
								<a class="dropdown-item" href="produtosCat.jsp?categoria=2">Acessorios</a>
							</div></li>

						<li class="nav-item dropdown" style="margin-left: 50px;"><a
							class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> XBOX </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="produtosCat.jsp?categoria=6">Consoles</a>
								<a class="dropdown-item" href="produtosCat.jsp?categoria=4">Jogos</a>
								<a class="dropdown-item" href="produtosCat.jsp?categoria=5">Acessorios</a>
							</div></li>

						<li class="nav-item dropdown" style="margin-left: 50px;"><a
							class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> SWITCH </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="produtosCat.jsp?categoria=9">Consoles</a>
								<a class="dropdown-item" href="produtosCat.jsp?categoria=7">Jogos</a>
								<a class="dropdown-item" href="produtosCat.jsp?categoria=8">Acessorios</a>
							</div></li>
					</ul>
				</div>
			</nav>
		</div>
		<!-- fim segundo menu -->
	</header>

	<div class="caixa">
		<c:forEach var="produto" items="${ todosProdutos }">

			<div class="caixaProduto">
				<div class="caixaInternaProduto">
					<div class="fotoProduto">
						<a href="produto.jsp?produto=${ produto.id }"><img
							src="${ produto.urlFoto }" width="200" height="200"></a>
					</div>

					<div class="nomeProduto">
						<a href="produto.jsp?produto=${ produto.id }"
							style="color: black;">
							<h5>${ produto.nome }</h5>
						</a>
					</div>

					<div class="precoProduto">
						<h5 style="color: red; font-size: 16px;">
							10 x
							<fmt:setLocale value="${user.locale}" />
							<fmt:formatNumber value="${ produto.precoVenda }" type="currency"></fmt:formatNumber>
						</h5>
						<h5>sem juros no cartão</h5>
						<br>
					</div>

					<div class="precoProduto">
						<h5 style="color: green; font-size: 16px;">
							à vista
							<fmt:formatNumber value="${ produto.precoVenda }" type="currency"></fmt:formatNumber>
						</h5>
						<h5>no boleto com 12% de desconto</h5>
						<br>
					</div>

					<div class="precoProduto" style="top: 0px;">
						<button type="button" class="btn btn-success">
							<a href="produto.jsp?produto=${ produto.id }"
								style="color: #FFF;">Comprar</a>
						</button>
					</div>
				</div>
			</div>

		</c:forEach>
	</div>

</body>

</html>