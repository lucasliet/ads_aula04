<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gerenciamento de Filmes</title>
</head>
<body>
	<h1>Exibir Filme</h1>
	<p>Digite o código do Filme para mostrar seus dados</p>
	<form action="manter_filmes.do" method="GET">
		<label>ID do filme</label>
		<input type="text" name="id_exibir"/>
		<input type="submit" name="acao" value="exibir"/>
	</form>

	<h1>Inserir um Filme</h1>
	<p>Digite o dados do Filme para mostrar seus dados</p>
	<form action="manter_filmes.do" method="POST">
		<strong>Filme:</strong>
		<label>Titulo:</label><input type="text" name="titulo"/>
		<label>Descrição:</label><input type="text" name="descricao"/>
		<label>Diretor:</label><input type="text" name="diretor"/>
		<select name="genero">
			${generos}
		</select>
		<label>Data:</label><input type="text" name="data"/>
		<label>Popularidade:</label><input type="text" name="popularidade"/>
		<input type="submit" name="acao" value="inserir"/>
	</form>
	
	<h1>Atualizar Filme</h1>
	<p>Digite o código do Filme para atualizar seus dados</p>
	<form action="manter_filmes.do" method="GET">
		<label>ID do filme</label>
		<input type="text" name="id_atualizar"/>		
		<input type="submit" name="acao" value="atualizar_filme"/>
	</form>
	
	<h1>Excluir Filme</h1>
	<p>Digite o código do Filme a ser excluido</p>
	<form action="manter_filmes.do" method="GET">
		<label>ID do filme</label>
		<input type="text" name="id_excluir"/>		
		<input type="submit" name="acao" value="excluir"/>
	</form>
</body>
</html>