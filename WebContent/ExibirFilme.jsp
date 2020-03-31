<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filme</title>
</head>
<body>
	<h1>Filme</h1>
	<strong>ID:</strong> ${filme.id}<br/>
	<strong>Titulo:</strong> ${filme.titulo}<br/>
	<strong>Descrição:</strong> ${filme.descricao}<br/>
	<strong>Diretor:</strong> ${filme.diretor}<br/>
	<strong>Genero:</strong> ${filme.genero.nome}<br/>
</body>
</html>