<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="br.edu.fatec.web.modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.fatec.web.dao.ProdutoDAO"%>
<%@page import="br.edu.fatec.web.modelo.EntidadeDominio"%>
<%@page import="br.edu.fatec.web.modelo.Produto"%>
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

.conteiner {
	margin: auto;
	margin-top: 6%;
	position: absolute;
	background-color: #FFFFFF;
	width: 90%;
	height: 100%;
	left: 50%;
	transform: translateX(-50%);
}

.painelA {
	width: 50%;
	height: 70%;
	position: relative;
	display: inline-block;
	float: left;
}

.foto {
	width: 450px;
	height: 450px;
	border: 2px solid rgba(0, 0, 0, 0.1);
	border-radius: 15px;
	position: relative;
	left: 50%;
	top: 7%;
	transform: translateX(-50%);
}

.fotoA {
	width: 420px;
	height: 420px;
	margin-left: 15px;
	margin-top: 15px;
}

.painelB {
	width: 50%;
	height: 50%;
	position: relative;
	float: right;
	display: inline-block;
}

.painelNome {
	margin-top: 7%;
	font-size: 18px;
	font-weight: bold;
	border-bottom: 2px solid rgba(0, 0, 0, 0.1);
	width: 90%;
	height: 22%;
	position: relative;
}

.bordaInferior {
	border-bottom: 2px solid rgba(0, 0, 0, 0.1);
	width: 90%;
}

.painelProd {
	margin-top: 2%;
	font-size: 16px;
	font-weight: bold;
	color: green;
	width: 50%;
	height: 22%;
	position: relative;
	display: inline-block;
}

.painelCod {
	margin-top: 1%;
	width: 25%;
	height: 22%;
	position: relative;
	display: inline-block;
	float: right;
}

.painelPrecoA {
	margin-top: 3%;
	width: 90%;
	height: 22%;
	position: relative;
	display: inline-block;
}

.painelPrecoB {
	width: 90%;
	height: 22%;
	position: relative;
	display: inline-block;
}

.painelCEP {
	margin-top: 3%;
	width: 43%;
	height: 22%;
	position: relative;
	display: inline-block;
	font-weight: bold;
}

.caixaCEP {
	width: 43%;
	height: 22%;
	position: relative;
	display: inline-block;
}

.botaoCEP {
	width: 20%;
	height: 22%;
	position: relative;
	display: inline-block;
}

.bordaSuperior {
	width: 80%;
	border-top: 3px solid red;
}

.painelC {
	background-color: blue;
	height: auto;
	width: 100%;
	position: relative;
	display: inline-block;
	left: 50%;
	top: 15%;
	transform: translateX(-50%);
	background-color: #FFF;
}

.painelDescricao {
	width: 90%;
	border-top: 3px solid red;
	position: relative;
	display: inline-block;
	left: 50%;
	transform: translateX(-50%);
}

.icon {
	margin-top: 2%;
	width: 5%;
	height: 22%;
	vertical-align: middle;
	position: relative;
	display: inline-block
}

p {
	font-size: 18px;
	font-weight: bold;
}

h2 {
	font-size: 16px;
	font-weight: bold;
}

h3 {
	font-size: 16px;
	margin-top: 0;
}

.botaoComprar {
	float: right;
	position: absolute;
	margin-left: 60%;
	margin-top: 38%;
}

a:link {
	text-decoration: none;
}

.material-icons {
	font-size: 40px;
}

#meuForm {
	display: none;
}

.formulario {
	float: right;
	position: absolute;
	top: 420px;
	left: 40px;
	width: 260px;
}

footer {
	position: relative;
	float: left;
	margin-top: 1000px;
	margin-left: 200px;
}
</style>

<script>
	function Digitos_cep() {
		if (document.getElementById('cep').value.length == 8) {
			loadDoc();
			loadDoc1();
			document.getElementById('meuForm').style['display'] = 'block';

		} else {
			document.getElementById('meuForm').style['display'] = 'none';
		}
	}
	function loadDoc() {
		var cep = document.getElementById('cep').value;
		var xhttp = new XMLHttpRequest();
		var URL = "http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?&nCdEmpresa=&sDsSenha=&nCdServico=41106&scepOrigem=08750330&scepDestino="
				+ cep
				+ "&nVlPeso=1&nCdFormato=1&nVlComprimento=30&nVlAltura=15&nVlLargura=30&nVlDiametro=0&sCdMaoPropria=N&nVlValorDeclarado=0&sCdAvisoRecebimento=N&StrRetorno=xml&nIndicaCalculo=3";
		xhttp.open("GET", URL, true);
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				myFunction(this);
			}
		};
		xhttp.send();
	}
	function myFunction(xml) {
		var i;
		var xmlDoc = xml.responseXML;
		var x = xmlDoc.getElementsByTagName("Servicos");
		var PAC = "PAC ";
		for (i = 0; i < x.length; i++) {
			PAC += "Valor: "
					+ x[i].getElementsByTagName("Valor")[0].childNodes[0].nodeValue;
			PAC += " Prazo entrega: "
					+ x[i].getElementsByTagName("PrazoEntrega")[0].childNodes[0].nodeValue;
		}
		document.getElementById("PAC").value = PAC;
	}

	function loadDoc1() {
		var cep = document.getElementById('cep').value;
		var xhttp = new XMLHttpRequest();
		var URL = "http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?&nCdEmpresa=&sDsSenha=&nCdServico=40010&scepOrigem=08750330&scepDestino="
				+ cep
				+ "&nVlPeso=1&nCdFormato=1&nVlComprimento=30&nVlAltura=15&nVlLargura=30&nVlDiametro=0&sCdMaoPropria=N&nVlValorDeclarado=0&sCdAvisoRecebimento=N&StrRetorno=xml&nIndicaCalculo=3";
		xhttp.open("GET", URL, true);
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				myFunction1(this);
			}
		};
		xhttp.send();
	}
	function myFunction1(xml) {
		var i;
		var xmlDoc = xml.responseXML;
		var x = xmlDoc.getElementsByTagName("Servicos");
		var SEDEX = "SEDEX ";
		for (i = 0; i < x.length; i++) {
			SEDEX += "Valor: "
					+ x[i].getElementsByTagName("Valor")[0].childNodes[0].nodeValue;
			SEDEX += " Prazo entrega: "
					+ x[i].getElementsByTagName("PrazoEntrega")[0].childNodes[0].nodeValue;
		}
		document.getElementById("SEDEX").value = SEDEX;
	}
</script>

</head>

<body id="cor">

	<header>
		<!-- inicio primeiro menu -->
		<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="indexLogado.jsp"> <img
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
					<ul class="nav navbar-nav navbar-right">
						<li><a href="carrinhoCompraLogado.jsp"> <i
								class="material-icons">local_shipping</i>
						</a>
					</ul>

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
							aria-expanded="false"> PLAYSTATION </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="produtosCatLogado.jsp?categoria=3">Consoles</a> <a
									class="dropdown-item" href="produtosCatLogado.jsp?categoria=1">Jogos</a>
								<a class="dropdown-item"
									href="produtosCatLogado.jsp?categoria=2">Acessorios</a>
							</div></li>

						<li class="nav-item dropdown" style="margin-left: 50px;"><a
							class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> XBOX </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="produtosCatLogado.jsp?categoria=6">Consoles</a> <a
									class="dropdown-item" href="produtosCatLogado.jsp?categoria=4">Jogos</a>
								<a class="dropdown-item"
									href="produtosCatLogado.jsp?categoria=5">Acessorios</a>
							</div></li>

						<li class="nav-item dropdown" style="margin-left: 50px;"><a
							class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> SWITCH </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="produtosCatLogado.jsp?categoria=9">Consoles</a> <a
									class="dropdown-item" href="produtosCatLogado.jsp?categoria=7">Jogos</a>
								<a class="dropdown-item"
									href="produtosCatLogado.jsp?categoria=8">Acessorios</a>
							</div></li>
					</ul>
				</div>
			</nav>
		</div>
		<!-- fim segundo menu -->
	</header>

	<%
		Double valorParcelado;
		Double valorDesconto;

		int id = Integer.parseInt(request.getParameter("produto"));
		Produto p = new Produto();
		p.setId(id);

		ProdutoDAO produtoDAO = new ProdutoDAO();
		p = (Produto) produtoDAO.consultarPorId(p);

		valorParcelado = valorDesconto = p.getPrecoVenda();
		valorParcelado = valorParcelado / 10;
		valorDesconto = valorDesconto - ((valorDesconto / 100) * 12);
		DecimalFormatSymbols simbolosDecimais = new DecimalFormatSymbols();
		simbolosDecimais.setDecimalSeparator(',');
		simbolosDecimais.setGroupingSeparator('.');
		DecimalFormat df = new DecimalFormat("###,###,##0.00", simbolosDecimais);
	%>

	<div class="conteiner">
		<div class="painelA">
			<div class="foto">
				<img class="fotoA" src=" <%=p.getUrlFoto()%>">
			</div>

		</div>

		<div class="painelB">
			<div class="painelNome">
				<p><%=p.getNome()%></p>
			</div>
			<div class="bordaInferior">
				<div class="icon">
					<i class="material-icons" style="color: green;">check_circle</i>
				</div>

				<div class="painelProd">
					<p>PRODUTO DISPONÍVEL</p>
				</div>
				<div class="painelCod">
					<h5>COD00001</h5>
				</div>
			</div>

			<div class="bordaInferior">
				<div class="icon" style="bottom: 25px;">
					<i class="material-icons">credit_card</i>
				</div>

				<div class="painelPrecoA">
					<p style="color: red; font-size: 22px;">
						R$
						<%=df.format(p.getPrecoVenda())%>
						<br>
					<h6 style="font-size: 16px";>
						10x de
						<%=df.format(valorParcelado)%>
						sem juros no cartão
					</h6>
					</p>
				</div>

				<div class="icon" style="bottom: 25px;">
					<i class="material-icons">view_column</i>
				</div>

				<div class="botaoComprar" style="top: 0px;">
					<button type="button" class="btn btn-success">
						<a
							href="ControleCarrinho2?id=<%=request.getParameter("produto")%>&opcao=add"
							style="color: #FFF;">Comprar</a>
					</button>
				</div>

				<div class="painelPrecoB">
					<p style="color: green;">
						à vista R$
						<%=df.format(valorDesconto)%></p>
					<h5>no boleto com 12% de desconto</h5>
				</div>
			</div>


			<div class="icon" style="top: 10px;">
				<i class="material-icons">local_shipping</i>
			</div>

			<div class="painelCEP">
				<h5>&nbsp;Calcular o frete e o prazo de entrega:&nbsp;</h5>
			</div>

			<div class="caixaCEP" style="width: 120px;">
				<input type="text" name="cep" id="cep" onkeyup="Digitos_cep()"
					class="form-control" />
			</div>

			<div class="formulario">
				<form id="meuForm">
					<input type="text" name="PAC" id="PAC" class="form-control"
						readonly> <br> <input type="text" name="SEDEX"
						id="SEDEX" class="form-control" readonly> <br>
				</form>
			</div>

		</div>


		<div class="painelC">
			<div class="painelDescricao">
				<p style="color: red;">Descrição</p>
				<h3><%=p.getDescricao()%></h3>

			</div>
		</div>

	</div>



</body>
</html>
