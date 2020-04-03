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

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/da77f520d1.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="Style.css">
</head>

<body>
	<header>
		<button class="btn cbtn-back">
			<h1>
				<a href="manter_filmes.do?acao=page-adm" class="text-white"><i
					class="fas fa-arrow-circle-left"></i></a>
			</h1>
		</button>
		<div class="bg-dark cbg-rolo text-white text-center p-2">
			<h1 class="text-bold text-uppercase ctext-shadow">🍿Exibir
				Filme🍿</h1>
		</div>
	</header>
	<div class="container">
		<div class="row justify-content-center">
			  <form action="manter_filmes.do" method="POST" class="card my-3 rounded shadow bg-light">
                <div class="card-header bg-dark text-white p-3">
                    <h1><i class="fas fa-film"></i> Atualizar Filme</h1>
                    <p>Preencha os dados para atualizar o filme</p>
                </div>
                <div class="cad-body p-3">
                	<input type="hidden" value="${filme.id}">
                	<div class="row">
                	<img class="col-sm-12 col-md-5 col-lg-3 mb-3 img-fluid" src="${filme.posterPath}">
	                	<div class="col">
		                    <div class="form-row">
		                        <div class="form-group col-sm-12 col-md-6">
		                            <label for="titulo">Titulo</label>
		                            <div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"  id="basic-addon1">
												<i class="fas fa-video"></i> 
											</span>
						 				</div>
		                            	<input type="text" class="form-control" name="titulo" value="${filme.titulo}"required>
		                            </div>
		                        </div>
		                        <div class="form-group col-sm-12 col-md-6">
		                            <label for="diretor">Diretor</label>
		                            <div class="input-group">
		                        	   <div class="input-group-prepend">
											<span class="input-group-text"  id="basic-addon1">
												<i class="fas fa-address-book"></i>
											</span>
									   </div>
		     	                       <input type="text" class="form-control" name="diretor" value="${filme.diretor}" required>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="form-row">
		                        <div class="form-group col-sm-12 col-md-6">
		                            <label for="data">Data de lançamento</label>
		                            <div class="input-group">
		            	           	    <div class="input-group-prepend">
											<span class="input-group-text"  id="basic-addon1">
												<i class="fas fa-calendar-day"></i>
											</span>
									    </div>
		                    	        <input type="date" class="form-control" name="data" value="${filme.dataLancamento}" required>
		                            </div>
		                        </div>
		                        <div class="form-group col-sm-12 col-md-6">
		                            <label for="popularnameade">Popularidade</label>
		                            <div class="input-group">
		            	           	    <div class="input-group-prepend">
											<span class="input-group-text"  id="basic-addon1">
												<i class="fas fa-star"></i>
											</span>
									    </div>
		                            	<input type="number" class="form-control" name="popularidade" max=1000 value="${filme.popularidade}" required>
		                            </div>
		                        </div>
		                    </div>
		                    <div class ="form-row">
		                        <div class="form-group col-sm-12 col-md-6">
		                            <label for="genero">Genero</label>
		                            <div class="input-group">
		            	           	    <div class="input-group-prepend">
											<span class="input-group-text"  id="basic-addon1">
												<i class="fas fa-theater-masks"></i>
											</span>
									    </div>
		                            	<select name="genero" class="form-control" required>
											${generos}
										</select>
									</div>
		                        </div>
		                         <div class="form-group col-sm-12 col-md-6">
		                            <label for="posterpath">Link do poster</label>
		                            <div class="input-group">
		            	           	    <div class="input-group-prepend">
											<span class="input-group-text"  id="basic-addon1">
												<i class="fas fa-image"></i>
											</span>
									    </div>
		                    	        <input type="text" class="form-control" name="posterpath" value="${filme.posterPath}" required>
		                            </div>
		                        </div>
		                    </div>
	                    </div>
	                 </div>
                     <div class="form-group">
                        <label for="descricao">Sinopse</label>
                        <div class="input-group">
                       	    <div class="input-group-prepend">
								<span class="input-group-text"  id="basic-addon1">
									<i class="fas fa-file-alt"></i>
								</span>
						    </div>
                        	<textarea type="text" class="form-control" name="descricao" rows=3 required>${filme.descricao}</textarea>
                        </div>
                    </div>
                    <div class="text-right">
                        <button type="submit" name="acao" value="btn-atualizar" class="btn btn-warning">Atualizar</button>
                    </div>
                </div>
            </form>
		</div>
</body>
</html>