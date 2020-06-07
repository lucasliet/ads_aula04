</html><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
		
		<title>Dados da compra</title>
		
		<link rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
			integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
			crossorigin="anonymous">
		<script src="https://kit.fontawesome.com/da77f520d1.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="css/style.css">
	</head>
<body>
	<header id="topo">
		<c:import url="Menu.jsp" />
		<div class="bg-dark cbg-rolo text-white text-center p-2">
			<h1 class="text-bold text-uppercase ctext-shadow ">🍿Dados da compra🍿</h1>
		</div>
	</header>
	<form action="comprar_filmes.do" method="GET">
		<div class="container">
			<div class="row mt-3 justify-content-center">
			</div>
			<div class="row justify-content-center my-3">
				<div class="bg-dark col-md-10 pl-5 py-3 rounded-top shadow" style="background-color: rgba(255,255,255,.05)">
					<button id="btnComprar" type="submit" name="acao"
						value="btn-finalizar" class="btn btn-success text-uppercase">Finalizar
					</button>
				</div>
				<table class="table table-dark table-striped col-sm-10 rounded-bottom shadow">
					<thead>
						<tr>
							<th class="text-center" scope="col">Data</th>
							<th class="text-center" scope="col">Id</th>
							<th class="text-center" scope="col">Título</th>
							<th class="text-center" scope="col">Usuário</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="compra" items="${compras}">
							<tr>
								<td class="align-middle text-center"><fmt:formatDate
										value="${compra.dataCompra}" dateStyle="SHORT" /></td>
								<td class="align-middle text-center">${compra.idFilme}</td>
								<td class="align-middle text-center">${compra.tituloFilme}</td>
								<td class="align-middle text-center">${compra.usuario}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>	
			<div class="fixed-bottom mb-5 mr-2">
				<p><a class="btn btn-secondary btn-topo" href="#topo" role="button"> ^ </a></p>
			</div>  
		</div>
	</form>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<script>
		var caixa = [];
		function tratarBotoes(element) {
			if (element.checked) {
				caixa.push(element);
			} else {
				caixa.pop();
			}
			if (caixa.length === 0) {
				document.getElementById("btnExibir").disabled = true;
				document.getElementById("btnExcluir").disabled = true;
			} else if (caixa.length === 1) {
				document.getElementById("btnExibir").disabled = false;
				document.getElementById("btnExcluir").disabled = false;
			} else {
				document.getElementById("btnExibir").disabled = true;
				document.getElementById("btnExcluir").disabled = false;
			}
		}
	</script>
</body>
</html>