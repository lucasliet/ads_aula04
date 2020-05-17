<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
		
		<title>Agradecimentos</title>
		
		<link rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
			integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
			crossorigin="anonymous">
		<script src="https://kit.fontawesome.com/da77f520d1.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<header>
			<c:import url="Menu.jsp" />
			<div class="bg-dark cbg-rolo text-white text-center p-2">
				<h1 class="text-bold text-uppercase ctext-shadow ">🍿Parabéns🍿</h1>
			</div>
		</header>
		<div class="container">
			<div class="row justify-content-center">
				<div class="card my-4">
					<div class="bg-dark text-white text-center p-2">
						<h1>Obrigado pela compra! Volte sempre!</h1>
					</div>

					<div class="row my-3">
						<div class="col-md-7">
							<img src="img/mascote.png">
						</div>
						<div class="col-md-5">
							<img src="img/fala.png" alt="" width="280">
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>