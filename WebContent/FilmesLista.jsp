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
<script src="https://kit.fontawesome.com/da77f520d1.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/Style.css">
</head>
<body>
	<header>
		<a href="manter_filmes.do?acao=page-adm"
			class="btn cbtn-back text-white"> <i
			class="fas fa-arrow-circle-left"></i>
		</a>
		<div class="bg-dark cbg-rolo text-white text-center p-2">
			<h1 class="text-bold text-uppercase ctext-shadow">Lista de Filmes</h1>
		</div>
	</header>
	<div class="container">
		<div class="row justify-content-center">
			<table class="table my-3 col-md-10 rounded shadow">
				<thead class="thead-dark">
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Título</th>
						<th scope="col">Diretor</th>
						<th scope="col">Gênero</th>
					</tr>
				</thead>
				<tbody class="bg-light">
					<c:forEach var="filme" items="${filmes}">
						<tr>
							<th scope="row">${filme.id}</th>
							<td>${filme.titulo}</td>
							<td>${filme.diretor}</td>
							<td>${filme.genero.nome}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>