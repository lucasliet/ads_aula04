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
		<c:import url="Menu.jsp"/>
	</header>
	<div class="container">
		<div class="header">
            <div class="cbg-rolo text-white text-center p-2">
                <h1 class="text-bold text-uppercase ctext-shadow ">🍿Lista de filme🍿</h1>
            </div>
        </div>
		<div class="row justify-content-center">
			<table class="table table-light my-3 col-md-10 rounded shadow">
				<thead class="thead-dark">
					<tr>
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
							<td scope="row"><img src="${filme.posterPath}" class="img-thumbnail" width="70"></td>
							<td class="align-middle text-center">${filme.id}</td>
							<td class="align-middle">${filme.titulo}</td>
							<td class="align-middle">${filme.genero.nome}</td>
							<td class="align-middle">${filme.diretor}</td>
							<td class="align-middle text-center"><fmt:formatDate value="${filme.dataLancamento}" dateStyle="SHORT"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>