<%@page import="br.edu.fatec.web.modelo.Produto"%>
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

</head>


<body class="bg-accpunt-pages">

<%
	Produto p = (Produto)request.getSession().getAttribute("alterar");
%>

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
									<form class="form-horizontal" action="ControleProduto?opcao=alterar"
										method="POST" name="formProduto">

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="nome">Nome</label> <input class="form-control"
													type="text" name="txtNome" id="txtNome" required="required" value="<%= p.getNome() %>"
													placeholder="Resident Evil 7">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="descricao">Descrição</label> <input
													class="form-control" type="text" name="txtDescricao"
													id="txtDescricao" required="required" value="<%= p.getDescricao() %>"
													placeholder="Zumbi para todo lado....">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="preço compra">Preço Compra</label> <input
													class="form-control" type="text" required="required"
													name="txtPrecoCompra" id="txtPrecoCompra" value="<%= p.getPrecoCompra() %>"
													placeholder="10,90">
											</div>
										</div>


										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="preço venda">Preço Venda</label> <input
													class="form-control" type="text" required="required" value="<%= p.getPrecoVenda() %>"
													name="txtPrecoVenda" id="txtPrecoVenda" placeholder="20,00">
											</div>
										</div>

										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="URL FOTO">URL Foto</label> <input
													class="form-control" type="text" required="required"
													name="txtUrlFoto" id="txtUrlFoto" value="<%= p.getUrlFoto() %>"
													placeholder="img/jogos/resident.png">
											</div>
										</div>


										<div class="form-group m-b-20">
											<div class="col-xs-12">
												<label for="categoria">Categoria</label> <select
													name="txtCategoria" id="txtCategoria" class="form-control"
													>
													<option value="<%= p.getIdCategoria() %>">Selecione a Categoria do Produto</option>
													<option value="1">Jogo de Playstation</option>
													<option value="2">Acessorio de Playstation</option>
													<option value="3">Console Playstation</option>
													<option value="4">Jogo de XBox</option>
													<option value="5">Acessorio de XBox</option>
													<option value="6">Console XBox</option>
													<option value="7">Jogo de Switch</option>
													<option value="8">Acessorio de Switch</option>
													<option value="9">Console Switch</option>
												</select>
											</div>
										</div>
										<input type="text" name="txtId" id="txtId" value="<%= p.getId() %>">


										<div class="form-group text-center m-t-10">
											<div class="col-xs-12">
												<button
													class="btn btn-md btn-block btn-primary waves-effect waves-light"
													type="submit">Alterar Produto</button>
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