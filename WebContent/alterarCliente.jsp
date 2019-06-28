<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="br.edu.fatec.web.modelo.Cliente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>CompreAki - Vem tranquilo</title>
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
<link href="../plugins/bootstrap-select/css/bootstrap-select.min.css"
	rel="stylesheet" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/core.css" rel="stylesheet" type="text/css" />
<link href="assets/css/components.css" rel="stylesheet" type="text/css" />
<link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
<link href="assets/css/pages.css" rel="stylesheet" type="text/css" />
<link href="assets/css/menu.css" rel="stylesheet" type="text/css" />
<link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />

<script src="assets/js/modernizr.min.js"></script>

<script>
	function Digitos_CEP() {
		if (document.getElementById('txtCep').value.length === 8) {
			loadDoc();
		}
	}

	function loadDoc() {
		var CEP = document.getElementById('txtCep').value;
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState === 4 && this.status === 200) {
				myFunction(this);
			}
		};
		xhttp.open("GET", "https://viacep.com.br/ws/" + CEP + "/xml", true);
		xhttp.send();
	}

	function myFunction(xml) {
		var i;
		var xmlDoc = xml.responseXML;
		var x = xmlDoc.getElementsByTagName("xmlcep");
		for (i = 0; i < x.length; i++) {
			document.getElementById("txtLogradouro").value = x[i]
					.getElementsByTagName("logradouro")[0].childNodes[0].nodeValue;
			document.getElementById("txtBairro").value = x[i]
					.getElementsByTagName("bairro")[0].childNodes[0].nodeValue;
			document.getElementById("txtMunicipio").value = x[i]
					.getElementsByTagName("localidade")[0].childNodes[0].nodeValue;
			document.getElementById("txtUf").value = x[i]
					.getElementsByTagName("uf")[0].childNodes[0].nodeValue;
		}
	}

	function validarSenha() {
		senha1 = document.getElementById('txtSenha').value;
		senha2 = document.getElementById('txtSenha2').value;
		if (senha1 !== senha2) {
			alert("SENHAS DIFERENTES!\nFAVOR DIGITAR SENHAS IGUAIS");
			return false;
		} else {
			//alert("CADASTRO REALIZADO COM SUCESSO!");
			return true;
		}
	}
</script>

</head>

<%
	Cliente cliente = (Cliente) request.getAttribute("cliente");
%>

<body class="bg-accpunt-pages">

	<!-- HOME -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="wrapper-page">
						<div class="account-pages">
							<div class="account-box">
								<div class="account-logo-box">
									<h2 class="text-uppercase text-center">
										<a href="indexLogado.jsp" class="text-success"> <span><img
												src="assets/images/logo.png" alt=""></span>
										</a>
									</h2>

								</div>
								<div class="account-content">
									<form class="form-horizontal" action="ControleCliente?opcao=alterar"
										method="GET" name="formCliente"
										onsubmit="return validarSenha();">

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="username">Seu Nome</label> <input
													class="form-control" type="text" name="txtNome"
													id="txtNome" required="required" value=<%= cliente.getNome() %>
													placeholder="Henrique Valentim Nunes">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="emailaddress">Email</label> <input
													class="form-control" type="email" name="txtEmail"
													id="txtEmail" required="required" value=<%= cliente.getEmail() %>
													placeholder="henrique@gmail.com">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="cpf">CPF</label> <input class="form-control"
													type="text" required="required" name="txtCpf" id="txtCpf" value=<%= cliente.getCpf() %>
													placeholder="Ex.: 12345678912">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="cep">CEP</label> <input class="form-control"
													type="text" required="required" name="txtCep" id="txtCep" value=<%= cliente.getCep() %>
													onkeyup="Digitos_CEP()">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="logradouro">Logradouro</label> <input
													type="text" class="form-control" name="txtLogradouro" value=<%= cliente.getLogradouro() %>
													id="txtLogradouro" required="required" />
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="bairro">Bairro</label> <input type="text"
													class="form-control" name="txtBairro" id="txtBairro" value=<%= cliente.getBairro() %>
													required="required" />
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="municipio">Município</label> <input type="text"
													class="form-control" name="txtMunicipio" id="txtMunicipio" value=<%= cliente.getMunicipio() %>
													required="required" />
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="estado">Estado</label> <input type="text"
													class="form-control" name="txtUf" id="txtUf"value=<%= cliente.getEstado() %>
													required="required" />
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="numero">Número</label> <input type="text"
													class="form-control" name="txtNumero" id="txtNumero" value=<%= cliente.getNumero() %>
													required="required" />
											</div>
										</div>
										
										<input type="hidden"
													 name="txtId" id="txtId" value=<%= cliente.getId() %>
													required="required" />

										<div class="form-group text-center m-t-10">
											<div class="col-xs-12">
												<button
													class="btn btn-md btn-block btn-primary waves-effect waves-light"
													type="submit" name="opcao" id="opcao" value="alterar">Alterar dados</button>
											</div>
										</div>

									</form>

								</div>
							</div>
							<!-- end card-box-->
						</div>


					</div>
					<!-- end wrapper -->

				</div>
			</div>
		</div>
	</section>
	<!-- END HOME -->



	<script>
		var resizefunc = [];
	</script>

	<!-- jQuery  -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/metisMenu.min.js"></script>
	<script src="assets/js/waves.js"></script>
	<script src="assets/js/jquery.slimscroll.js"></script>
	<script src="../plugins/bootstrap-select/js/bootstrap-select.min.js"
		type="text/javascript"></script>

	<!-- App js -->
	<script src="assets/js/jquery.core.js"></script>
	<script src="assets/js/jquery.app.js"></script>

</body>
</html>