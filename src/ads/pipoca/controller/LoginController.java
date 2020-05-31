package ads.pipoca.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ads.pipoca.model.entity.Filme;
import ads.pipoca.model.entity.Usuario;
import ads.pipoca.model.service.FilmeService;
import ads.pipoca.model.service.UsuarioService;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UsuarioService service = new UsuarioService();
		HttpSession session = request.getSession();
		String saida = "index.html";
		String acao = request.getParameter("acao");

		switch (acao){
			case "login":
				Usuario usuario = new Usuario();
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				usuario.setUsername(username);
				usuario.setPassword(password);

				if (service.validar(usuario)) {
					session.setAttribute("logado", usuario);
					FilmeService fService = new FilmeService();
					ArrayList<Filme> filmes = fService.listarFilmes();
					request.setAttribute("filmes", filmes);
					saida = "FilmesListaComprar.jsp";
				}
				break;
			case "logout":
				session.invalidate();
		}

		RequestDispatcher view = request.getRequestDispatcher(saida);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
