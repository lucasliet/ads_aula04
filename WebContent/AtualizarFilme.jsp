<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atualizar Filme</title>
</head>
<body>
	<h1>Filme</h1>
	<p>Digite o dados do Filme para mostrar seus dados</p>
	<form action="manter_filmes.do" method="POST">
		<strong>Filme:</strong><input value="${filme.id}" name="id"/>
		<label>Titulo:</label><input type="text" value="${filme.titulo}" name="titulo"/>
		<label>Descrição:</label><input type="text" value="${filme.descricao}" name="descricao"/>
		<label>Diretor:</label><input type="text" value="${filme.diretor}" name="diretor"/>
		<select name="genero">
			${options}
		</select>
		<label>Data:</label><input type="text" value="${filme.dataLancamento}" name="data"/>
		<label>Popularidade:</label><input type="text"value="${filme.popularidade}" name="popularidade"/>
		<input type="submit" name="acao" value="atualizar"/>
	</form>
</body>
</html>