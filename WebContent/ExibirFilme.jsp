<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
		
		<title>Filme</title>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/da77f520d1.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="Style.css">
	</head>
	<body>
		<header>
			<button class="btn cbtn-back">
				<h1><a href="manter_filmes.do?acao=gerenciar_filmes" class="text-white"><i class="fas fa-arrow-circle-left"></i></a></h1>
			</button>
			<div class="bg-dark cbg-rolo text-white text-center p-2">
				<h1 class="text-bold text-uppercase ctext-shadow">🍿Exibir Filme🍿</h1>
			</div>
		</header>
		<div class="container">
			<div class="row">
				<div class="col-sm-12" >
					<form action="manter_filmes.do" method="GET" class="card my-3 rounded shadow" style="background-color: rgb(197, 195, 195);">
						<div class="card-header bg-dark text-white p-3">
							<h1><i class="fas fa-film"></i>Filme</h1>
						</div>
						<div class="col-sm-12 col-md-6 my-auto" >
							<img class="img-fluid" src="img/cine.png">
						</div>
							
						<div class="cad-body p-3">
							<div class="form-row">
								<div class="form-group col-sm-12 col-md-6">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"  id="basic-addon1">ID</span>
										</div>
										<input type="text" class="form-control" name="titulo" value="${filme.id}">
									</div>
								</div>
								<div class="form-group col-sm-12 col-md-6">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1">Titulo</span>
										</div>
										<input type="text" class="form-control" name="titulo" value="${filme.titulo}">
									</div>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-sm-12 col-md-6">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1">Diretor</span>
										</div>
										<input type="text" class="form-control" name="titulo" value="${filme.diretor}">
									</div>
								</div>
								<div class="form-group col-sm-12 col-md-6">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1">Gênero</span>
										</div>
										<input type="text" class="form-control" name="titulo" value="${filme.genero.nome}">
									</div>
								</div>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
								  <span class="input-group-text">Descrição</span>
								</div>
								<textarea ${filme.descricao} class="form-control" aria-label="Com textarea"></textarea>
							 </div>
						
						</div>
					</form>
				</div>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>