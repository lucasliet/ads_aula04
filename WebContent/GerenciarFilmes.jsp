<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

        <title>Pipoca Admin</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/da77f520d1.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="Style.css">

    </head>

    <body>
        <header>
            <button class="btn cbtn-back ">
            <h1><a href="index.html" class="text-white"><i class="fas fa-arrow-circle-left"></i></a></h1>
            </button>
            <div class="bg-dark cbg-rolo text-white text-center p-2">
                <h1 class="text-bold text-uppercase ctext-shadow ">🍿Pipoca admin🍿</h1>
            </div>
            
        </header>
        <div class="container my-3">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <form action="manter_filmes.do" method="GET" class="card my-3 rounded shadow bg-light">
                        <div class="card-header bg-dark text-white p-3">
                            <h1><i class="fas fa-film"></i> Exibir Filme</h1>
                            <p>Selecione um Filme para ser exibido</p>
                        </div>
                        <div class="cad-body p-3">
                            <div class="form-row">
                                <div class="form-group col-12">
                                    <label for="id_exibir">Filme</label>
                                    <div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"  id="basic-addon1">
												<i class="fas fa-video"></i> 
											</span>
				 						</div>
                	                    <select name="id_exibir" class="form-control" required>
            	                            <option value="" disabled selected>Selecione o filme</option>
									 		${filmes} 
										</select>
									</div>
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" name="acao" value="exibir" class="btn btn-secondary">Exibir</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-sm-12 col-md-6">
                    <form action="manter_filmes.do" method="GET" class="card my-3 rounded shadow bg-light">
                        <div class="card-header bg-dark text-white p-3">
                            <h1><i class="fas fa-film"></i> Atualizar Filme</h1>
                            <p>Selecione o Filme para ser alterado</p>
                        </div>
                        <div class="cad-body p-3">
                            <div class="form-row">
                                <div class="form-group col-12">
                                    <label for="id_atualizar">Filme</label>
                                     <div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"  id="basic-addon1">
												<i class="fas fa-video"></i> 
											</span>
				 						</div>
                	                    <select name="id_exibir" class="form-control" required>
            	                            <option value="" disabled selected>Selecione o filme</option>
									 		${filmes} 
										</select>
									</div>
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" name="acao" value="atualizar_filme" class="btn btn-warning">Atualizar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <form action="manter_filmes.do" method="POST" class="card my-3 rounded shadow bg-light">
                <div class="card-header bg-dark text-white p-3">
                    <h1><i class="fas fa-film"></i> Inserir Filme</h1>
                    <p>Preencha os dados para inserir um novo filme</p>
                </div>
                <div class="cad-body p-3">
                    <div class="form-row">
                        <div class="form-group col-sm-12 col-md-6">
                            <label for="titulo">Titulo</label>
                            <div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"  id="basic-addon1">
										<i class="fas fa-video"></i> 
									</span>
				 				</div>
                            	<input type="text" class="form-control" name="titulo" placeholder="Náufrago" required>
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
     	                       <input type="text" class="form-control" name="diretor" placeholder="Robert Zemeckis" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="descricao">Descrição</label>
                        <div class="input-group">
                       	    <div class="input-group-prepend">
								<span class="input-group-text"  id="basic-addon1">
									<i class="fas fa-file-alt"></i>
								</span>
						    </div>
                        	<textarea type="text" class="form-control" name="descricao" placeholder="O dedicado funcionário executivo da FedEx, Chuck Noland, viaja a trabalho para a Malásia quando o avião da empresa cai sobre o Oceano Pacífico durante uma tempestade. Como o único sobrevivente do acidente, Chuck vai parar em uma ilha deserta. Quando suas tentativas de socorro se esgotam, Chuck aprende a sobreviver na ilha." rows=3></textarea>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-sm-12 col-md-4">
                            <label for="data">Data</label>
                            <div class="input-group">
            	           	    <div class="input-group-prepend">
									<span class="input-group-text"  id="basic-addon1">
										<i class="fas fa-calendar-day"></i>
									</span>
							    </div>
                    	        <input type="date" class="form-control" name="data" placeholder="dd/mm/yyyy" required>
                            </div>
                        </div>
                        <div class="form-group col-sm-12 col-md-4">
                            <label for="popularnameade">Popularidade</label>
                            <div class="input-group">
            	           	    <div class="input-group-prepend">
									<span class="input-group-text"  id="basic-addon1">
										<i class="fas fa-star"></i>
									</span>
							    </div>
                            	<input type="number" class="form-control" name="popularidade" max=1000 placeholder="60.5" required>
                            </div>
                        </div>
                        <div class="form-group col-sm-12 col-md-4">
                            <label for="genero">Genero</label>
                            <div class="input-group">
            	           	    <div class="input-group-prepend">
									<span class="input-group-text"  id="basic-addon1">
										<i class="fas fa-theater-masks"></i>
									</span>
							    </div>
                            	<select name="genero" class="form-control" required>
                                	<option value="" disabled selected>Selecione o genero</option>
									${generos}
								</select>
							</div>
                        </div>
                    </div>
                    <div class="text-right">
                        <button type="submit" name="acao" value="inserir" class="btn btn-primary">Enviar</button>
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <form action="manter_filmes.do" method="GET" class="card my-3 rounded shadow bg-light">
                        <div class="card-header bg-dark text-white p-3">
                            <h1><i class="fas fa-film"></i> Excluir Filme</h1>
                            <p>Selecione o Filme para ser <span class="badge badge-danger p-1 text-uppercase	">excluído</span></p>
                        </div>
                        <div class="cad-body p-3">
                            <div class="form-row">
                                <div class="form-group col-12">
                                    <label for="id_excluir">Filme</label>
                                     <div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"  id="basic-addon1">
												<i class="fas fa-video"></i> 
											</span>
				 						</div>
                	                    <select name="id_exibir" class="form-control" required>
            	                            <option value="" disabled selected>Selecione o filme</option>
									 		${filmes} 
										</select>
									</div>
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" name="acao" value="excluir_filme" class="btn btn-danger text-uppercase">excluir</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-sm-12 col-md-6 my-auto">
                    <img class="img-fluid" src="img/cine.png">
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>

    </html>