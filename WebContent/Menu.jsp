<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="AdmPanel.jsp">
        	<img src="img/favicon.ico" width="35">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link text-white" href="comprar_filmes.do?acao=page-todos">
                        <i class="fas fa-home mr-1"></i>Home
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link text-white" href="manter_filmes.do?acao=page-adm">
                        <i class="fas fa-user-shield mr-1"></i>Painel ADM
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link text-white" href="comprar_filmes.do?acao=page-comprar">
                        <i class="fas fa-shopping-cart mr-1"></i>Carrinho
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link text-white" href="login.do?acao=logout">
                        <i class="fas fa-power-off mr-1"></i>Sair
                    </a>
                </li>
            </ul> 
        </div>   
    </nav>