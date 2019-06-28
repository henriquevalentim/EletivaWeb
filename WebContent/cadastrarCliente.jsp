<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
										<a href="index.jsp" class="text-success"> <span><img
												src="assets/images/logo.png" alt=""></span>
										</a>
									</h2>

								</div>
								<div class="account-content">
									<form class="form-horizontal" action="ControleCliente"
										method="POST" name="formCliente"
										onsubmit="return validarSenha();">

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="username">Seu Nome</label> <input
													class="form-control" type="text" name="txtNome"
													id="txtNome" required="required"
													placeholder="Henrique Valentim Nunes">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="emailaddress">Email</label> <input
													class="form-control" type="email" name="txtEmail"
													id="txtEmail" required="required"
													placeholder="henrique@gmail.com">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="senha">Criar uma Senha</label> <input
													class="form-control" type="password" required="required"
													name="txtSenha" id="txtSenha" placeholder="*********">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="senha">Confirme sua Senha</label> <input
													class="form-control" type="password" required="required"
													name="txtSenha2" id="txtSenha2"
													placeholder="Confirmação de Senha">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="cpf">CPF</label> <input class="form-control"
													type="text" required="required" name="txtCpf" id="txtCpf"
													placeholder="Ex.: 12345678912">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="cep">CEP</label> <input class="form-control"
													type="text" required="required" name="txtCep" id="txtCep"
													onkeyup="Digitos_CEP()">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="logradouro">Logradouro</label> <input
													type="text" class="form-control" name="txtLogradouro"
													id="txtLogradouro" required="required" />
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="bairro">Bairro</label> <input type="text"
													class="form-control" name="txtBairro" id="txtBairro"
													required="required" />
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="municipio">Município</label> <input type="text"
													class="form-control" name="txtMunicipio" id="txtMunicipio"
													required="required" />
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="estado">Estado</label> <input type="text"
													class="form-control" name="txtUf" id="txtUf" required="required" />
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="numero">Número</label> <input type="text"
													class="form-control" name="txtNumero" id="txtNumero"
													required="required" />
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">

												<div class="checkbox checkbox-success">
													<input id="remember" type="checkbox" checked=""> <label
														for="remember"> I accept <a href="#">Terms and
															Conditions</a>
													</label>
												</div>

											</div>
										</div>

										<div class="form-group text-center m-t-10">
											<div class="col-xs-12">
												<button
													class="btn btn-md btn-block btn-primary waves-effect waves-light"
													type="submit">Criar seu cadastro</button>
											</div>
										</div>

									</form>

									<div class="row">
										<div class="col-sm-12">
											<div class="text-center">
												<button type="button"
													class="btn m-r-5 btn-facebook waves-effect waves-light">
													<i class="fa fa-facebook"></i>
												</button>
												<button type="button"
													class="btn m-r-5 btn-googleplus waves-effect waves-light">
													<i class="fa fa-google"></i>
												</button>
												<button type="button"
													class="btn m-r-5 btn-twitter waves-effect waves-light">
													<i class="fa fa-twitter"></i>
												</button>
											</div>
										</div>
									</div>

									<div class="row m-t-50">
										<div class="col-sm-12 text-center">
											<p class="text-muted">
												Já tem um cadastro? <a href="login.jsp"
													class="text-dark m-l-5"><b>Entrar</b></a>
											</p>
										</div>
									</div>

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