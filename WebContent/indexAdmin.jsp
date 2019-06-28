<%@page import="br.edu.fatec.web.dao.AnaliseDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="br.edu.fatec.web.modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.fatec.web.dao.ProdutoDAO"%>
<%@page import="br.edu.fatec.web.modelo.EntidadeDominio"%>
<%@page import="br.edu.fatec.web.modelo.Produto"%>
<%@page import="br.edu.fatec.web.modelo.AnaliseDados"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>

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
				<a class="navbar-brand" href="indexAdmin.jsp"> <img
					src="assets/images/logo.png" class="img-fluid">
				</a>

				<form class="form-inline my-2 my-lg-4">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Pesquisar" aria-label="Pesquisar">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Pesquisar</button>
				</form>

				<%
					Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");
					AnaliseDados analise = (AnaliseDados) session.getAttribute("analise");

					DecimalFormat df = new DecimalFormat("#.00");
				%>


				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle navbar-right" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <%=usuario.getLogin()%>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Minha conta</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="index.jsp">Sair</a>
						</div></li>
				</ul>
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
							aria-expanded="false">PRODUTO </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="cadastrarProduto.jsp">Cadastrar</a>
								<a class="dropdown-item" href="ControleAdmin?opcao=listar">Listar</a>
							</div></li>

					</ul>
				</div>
			</nav>
		</div>
		<!-- fim segundo menu -->
	</header>

	<div class="caixa">

		<div class="row">

			<div class="col-lg-3 col-md-6">
				<div class="card-box widget-box-two widget-two-custom">
					<div class="wigdet-two-content">
						<p
							class="m-0 text-uppercase font-bold font-secondary text-overflow"
							title="Statistics">Total Clientes</p>
						<h2 class="">
							<span data-plugin="counterup"><%=analise.getQtdeCliente()%></span>
						</h2>
					</div>
				</div>
			</div>
			<!-- end col -->

			<div class="col-lg-3 col-md-6">
				<div class="card-box widget-box-two widget-two-custom">
					<div class="wigdet-two-content">
						<p
							class="m-0 text-uppercase font-bold font-secondary text-overflow"
							title="Statistics">Total Produtos</p>
						<h2 class="">
							<span data-plugin="counterup"> <%=analise.getQtdeProduto()%>
							</span>
						</h2>
					</div>
				</div>
			</div>
			<!-- end col -->

			<div class="col-lg-3 col-md-6">
				<div class="card-box widget-box-two widget-two-custom">
					<div class="wigdet-two-content">
						<p
							class="m-0 text-uppercase font-bold font-secondary text-overflow"
							title="Statistics">Lucro Bruto</p>
						<h2 class="">
							R$<span data-plugin="counterup"> <%=df.format(analise.getLucroBrutoMensal())%></span>
						</h2>
					</div>
				</div>
			</div>
			<!-- end col -->

			<div class="col-lg-3 col-md-6">
				<div class="card-box widget-box-two widget-two-custom">
					<div class="wigdet-two-content">
						<p
							class="m-0 text-uppercase font-bold font-secondary text-overflow"
							title="Statistics">Lucro Bruto Anual</p>
						<h2 class="">
							R$<span data-plugin="counterup"> <%=df.format(analise.getLucroBrutoAnual())%></span>
						</h2>
					</div>
				</div>
			</div>
			<!-- end col -->

		</div>
		<!-- end row -->


		<div class="row">
			<div class="col-lg-4">
				<div class="card-box">
					<h4 class="m-t-0 header-title">
						<b>Produtos mais vendidos</b>
					</h4>

					<div class="table-responsive">
						<table class="table table-hover m-0 mails table-actions-bar">

							<thead>
								<tr>
									<th>Nome</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < analise.getMaisVendidos().size(); i++) {
										
								%>
								<tr>
									<td>
										<h5 class="m-b-0 m-t-0"><%= analise.getMaisVendidos().get(i).getNome() %></h5>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>

			</div>

			<div class="col-lg-8" style="background-color: white;">
				<canvas class="primeiroGrafico"></canvas>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
				<script>
					var ctx = document
							.getElementsByClassName("primeiroGrafico");
					var chartGraph = new Chart(
							ctx,
							{
								type : 'line',
								data : {
									labels : [ "Jan", "Fev", "Mar", "Abr",
											"Mai", "Jun", "Jul", "Ago", "Set",
											"Out", "Nov", "Dez" ],
									datasets : [
											{
												label : "Produtos vendidos mensalmente - 2018",
												data : [
				<%=analise.getMeses().get(0)%>
					,
				<%=analise.getMeses().get(1)%>
					,
				<%=analise.getMeses().get(2)%>
					,
				<%=analise.getMeses().get(3)%>
					,
				<%=analise.getMeses().get(4)%>
					,
				<%=analise.getMeses().get(5)%>
					,
				<%=analise.getMeses().get(6)%>
					,
				<%=analise.getMeses().get(7)%>
					,
				<%=analise.getMeses().get(8)%>
					,
				<%=analise.getMeses().get(9)%>
					,
				<%=analise.getMeses().get(10)%>
					,
				<%=analise.getMeses().get(11)%>
					],
												borderWidth : 6,
												borderColor : 'rgba(77,166,253,0.85)',
												backgroundcolor : 'white',
											}, ]
								}
							});
				</script>
			</div>

		</div>
		<!-- end row -->
</body>

</html>