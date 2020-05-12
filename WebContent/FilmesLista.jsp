<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		
		<title>Lista de Filmes</title>
		
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
			<h1 class="text-bold text-uppercase ctext-shadow ">🍿Lista de
				filme🍿</h1>
		</div>
	</header>
	<form action="manter_filmes.do" method="POST">
		<div class="container">
			<div class="row mt-3 justify-content-center">
			</div>
			<div class="row justify-content-center my-3">
				<div class="bg-dark col-md-10 pl-5 py-3 rounded-top shadow" style="background-color: rgba(255,255,255,.05)">
					<button id="btnExcluir" type="button"
						class="btn btn-danger text-uppercase" data-toggle="modal"
						data-target="#modalExcluir" disabled>Excluir</button>
					<button id="btnEditar" type="submit" name="acao"
						value="btn-atualizar-lista" class="btn btn-warning text-uppercase mx-3"
						disabled>Editar</button>
					<button id="btnVisualizar" type="submit" name="acao"
						value="btn-exibir-lista" class="btn btn-primary text-uppercase"
						disabled>Exibir</button>
				</div>
				<table class="table table-dark table-striped col-sm-10 rounded-bottom shadow">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">Pôster</th>
							<th scope="col">Id</th>
							<th scope="col">Título</th>
							<th scope="col">Gênero</th>
							<th scope="col">Diretor</th>
							<th scope="col">Lançamento</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="filme" items="${filmes}">
							<tr>
								<td scope="row" class="align-middle"><input type="checkbox"
									name="box${filme.id}" onClick="tratarBotoes(this)"></td>
								<td class="align-middle"><img src="${filme.posterPath}"
									class="img-thumbnail" width="70"></td>
								<td class="align-middle text-center">${filme.id}</td>
								<td class="align-middle">${filme.titulo}</td>
								<td class="align-middle">${filme.genero.nome}</td>
								<td class="align-middle">${filme.diretor}</td>
								<td class="align-middle text-center"><fmt:formatDate
										value="${filme.dataLancamento}" dateStyle="SHORT" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>	
			<div class="fixed-bottom mb-5 mr-2">
				<p><a class="btn btn-secondary btn-topo" href="#topo" role="button"> ^ </a></p>
			</div>  
		</div>
		<div class="modal fade" id="modalExcluir" tabindex="-1" role="dialog"
			aria-labelledby="modalExcluirTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header bg-dark text-white">
						<h5 class="modal-title" id="modalExcluirLongTitle">Tem
							certeza que deseja excluir?</h5>
						<button type="button" class="close text-white"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancelar</button>
						<button type="submit" name="acao" value="btn-excluir-lista"
							class="btn btn-danger text-uppercase">Excluir</button>
					</div>
				</div>
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
			if (caixa.length == 0) {
				document.getElementById("btnEditar").disabled = true;
				document.getElementById("btnVisualizar").disabled = true;
				document.getElementById("btnExcluir").disabled = true;
			} else if (caixa.length == 1) {
				document.getElementById("btnEditar").disabled = false;
				document.getElementById("btnVisualizar").disabled = false;
				document.getElementById("btnExcluir").disabled = false;
			} else {
				document.getElementById("btnEditar").disabled = true;
				document.getElementById("btnVisualizar").disabled = true;
				document.getElementById("btnExcluir").disabled = false;
			}
		}
	</script>
</body>
</html>