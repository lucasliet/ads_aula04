<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Gerenciamento de Filmes</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    	<link rel="stylesheet" href="Style.css">
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <form action="manter_filmes.do" method="GET" class="card m-3 rounded shadow">
                        <div class="card-header bg-dark text-white p-3">
                            <h1>Exibir Filme</h1>
                            <p>Selecione um Filme para ser exibido</p>
                        </div>
                        <div class="cad-body p-3">
                            <div class="form-row">
                                <div class="form-group col-12">
                                    <label for="id_exibir">Selecione o Filme</label>
                                    <select name="id_exibir" class="form-control">
								 		${filmes} 
									</select>
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" name="acao" value="exibir" class="btn btn-secondary">Exibir</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-sm-12 col-md-6">
                    <form action="manter_filmes.do" method="GET" class="card m-3 rounded shadow">
                        <div class="card-header bg-dark text-white p-3">
                            <h1>Atualizar Filme</h1>
                            <p>Selecione o Filme para ser alterado</p>
                        </div>
                        <div class="cad-body p-3">
                            <div class="form-row">
                                <div class="form-group col-12">
                                    <label for="id_atualizar">Selecione o Filme</label>
                                    <select name="id_atualizar" class="form-control">
								 		${filmes} 
									</select>
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" name="acao" value="atualizar_filme" class="btn btn-warning">Atualizar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <form action="manter_filmes.do" method="POST" class="card m-3 rounded shadow">
                <div class="card-header bg-dark text-white p-3">
                    <h1>Inserir um Filme</h1>
                    <p>Digite o dados do Filme para mostrar seus dados</p>
                </div>
                <div class="cad-body p-3">
                    <div class="form-row">
                        <div class="form-group col-sm-12 col-md-6">
                            <label for="titulo">Titulo</label>
                            <input type="text" class="form-control" name="titulo" placeholder="Náufrago">
                        </div>
                        <div class="form-group col-sm-12 col-md-6">
                            <label for="diretor">Diretor</label>
                            <input type="text" class="form-control" name="diretor" placeholder="Robert Zemeckis">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="descricao">Descrição</label>
                        <textarea type="text" class="form-control" name="descricao" placeholder="A FedEx executive undergoes a physical and emotional transformation after crash landing on a deserted island."></textarea>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-sm-12 col-md-4">
                            <label for="data">Data</label>
                            <input type="text" class="form-control" name="data" placeholder="dd/mm/yyyy">
                        </div>
                        <div class="form-group col-sm-12 col-md-4">
                            <label for="popularnameade">Popularidade</label>
                            <input type="number" class="form-control" name="popularidade" max=999 placeholder="603.5">
                        </div>
                        <div class="form-group col-sm-12 col-md-4">
                            <label for="genero">Genero</label>
                            <select name="genero" class="form-control">
								${generos}
							</select>
                        </div>
                    </div>
                    <div class="text-right">
                        <button type="submit" name="acao" value="inserir" class="btn btn-primary">Enviar</button>
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <form action="manter_filmes.do" method="GET" class="card m-3 rounded shadow">
                        <div class="card-header bg-dark text-white p-3">
                            <h1>Excluir Filme</h1>
                            <p>Selecione o Filme para ser <span class="badge badge-danger p-1">EXCLUIDO</span></p>
                        </div>
                        <div class="cad-body p-3">
                            <div class="form-row">
                                <div class="form-group col-12">
                                    <label for="id_excluir">Selecione o Filme</label>
                                    <select name="id_excluir" class="form-control">
								 		${filmes} 
									</select>
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" name="acao" value="excluir_filme" class="btn btn-danger">EXCLUIR</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-sm-12 col-md-6 my-auto">
                    <img src="img/cine.png">
                </div>
            </div>
        </div>
    </body>

    </html>