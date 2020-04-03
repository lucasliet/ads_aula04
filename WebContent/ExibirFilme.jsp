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
			<h1><a href="manter_filmes.do?acao=page-adm" class="text-white"><i class="fas fa-arrow-circle-left"></i></a>
			</h1>
		</button>
            <div class="bg-dark cbg-rolo text-white text-center p-2">
                <h1 class="text-bold text-uppercase ctext-shadow">🍿Exibir Filme🍿</h1>
            </div>
        </header>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-sm-10">
                    <form action="manter_filmes.do" method="GET" class="card my-3 rounded shadow bg-light">
                        <div class="card-header bg-dark text-white p-3">
                            <h1><i class="fas fa-film"></i> Filme</h1>
                        </div>

                        <div class="my-auto">
                            <div class="card-body p-3">
                                <div class="row">
                                    <img class="col-sm-12 col-md-5 col-lg-3 mb-3 img-fluid" src="${filme.posterPath}">

                                    <div class="col">
                                        <div class="form-row">
                                            <div class="form-group col-sm-4 col-lg-3">
                                                <label for="id">ID</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1">
														<i class="fas fa-fingerprint"></i>
													</span>
                                                    </div>
                                                    <p class="form-control" id="id">${filme.id}</p>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-12 col-md-12 col-lg-9">
                                                <label for="titulo">Titulo</label>
                                                <div class="input-group ">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1">
														<i class="fas fa-video"></i>
													</span>
                                                    </div>
                                                    <p class="form-control" id="titulo">${filme.titulo}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-sm-12 col-md-6">
                                                <label for="diretor">Diretor</label>
                                                <div class="input-group ">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1">
														<i class="fas fa-address-book"></i>
													</span>
                                                    </div>
                                                    <p class="form-control" id="diretor">${filme.diretor}</p>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-12 col-md-6">
                                                <label for="diretor">Gênero</label>
                                                <div class="input-group ">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1">
														<i class="fas fa-theater-masks"></i>
													</span>
                                                    </div>
                                                    <p class="form-control" id="genero">${filme.genero.nome}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-sm-12 col-md-6">
                                                <label for="data">Data</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1">
													<i class="fas fa-calendar-day"></i>
												</span>
                                                    </div>
                                                    <p class="form-control" id="data">${data}</p>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-12 col-md-6">
                                                <label for="popularnameade">Popularidade</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1">
													<i class="fas fa-star"></i>
												</span>
                                                    </div>
                                                    <p class="form-control" id="popularidade">${filme.popularidade}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <label for="titulo">Descrição</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">
									        <i class="fas fa-file-alt"></i>
								        </span>
                                    </div>
                                    <textarea class="form-control" name="descricao" rows="4">${filme.descricao}></textarea>
                                </div>
								${btn-excluir} 
                            </div>
                        </div>
                        <div class="modal fade" id="modalExcluir" tabindex="-1" role="dialog" aria-labelledby="modalExcluirTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="modalExcluirLongTitle">Tem certeza que deseja excluir? </h5>
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                  </button>
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                  <button type="submit" value="btn-excluir" class="btn btn-danger text-uppercase">Excluir</button>
                                </div>
                              </div>
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