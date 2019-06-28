<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>CompreAki - Login</title>
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
									<form class="form-horizontal" action="Autenticacao" method="POST">

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="emailaddress">E-mail:</label> <input
													class="form-control" type="email" name="txtLogin" id="txtLogin"
													required="required" placeholder="john@d.com">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="password">Senha:</label> <input
													class="form-control" type="password" required="required"
													name="txtSenha" id="txtSenha" placeholder="Enter your password">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">

												<div class="checkbox checkbox-success">
													<input id="remember" type="checkbox" checked=""> <label
														for="remember"> Remember me </label>
												</div>

											</div>
										</div>

										<div class="form-group text-center m-t-10">
											<div class="col-xs-12">
												<button
													class="btn btn-md btn-block btn-primary waves-effect waves-light"
													type="submit">Entrar</button>
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
												Não tem cadastro? <a href="cadastrarCliente.jsp"
													class="text-dark m-l-5"><b>Cadastre-se</b></a>
											</p>
										</div>
									</div>

								</div>
							</div>
						</div>
						<!-- end card-box-->


					</div>
					<!-- end wrapper -->

				</div>
			</div>
		</div>
	</section>
	<!-- END HOME -->

</body>
</html>