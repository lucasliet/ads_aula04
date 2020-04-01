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
								<textarea class="form-control" aria-label="Com textarea"></textarea>
							 </div>
						
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>