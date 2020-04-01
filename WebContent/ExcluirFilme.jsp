<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filme</title>
</head>
<body>
	<form action="manter_filmes.do" method="GET">
		<h1>Filme</h1>
		<strong>ID:</strong> ${filme.id}<br/>
		<strong>Titulo:</strong> ${filme.titulo}<br/>
		<strong>Descrição:</strong> ${filme.descricao}<br/>
		<strong>Diretor:</strong> ${filme.diretor}<br/>
		<strong>Genero:</strong> ${filme.genero.nome}<br/>
		<input type="hidden" value="${filme.id}" name="id_excluir">
		<!-- Abrir modal aqui, e o botão de excluir debaixo tem que ta dentro do modal pra confirmação -->
		<button type="submit" name="acao" value="excluir" class="btn btn-danger">EXCLUIR</button>
	</form>
</body>
</html>