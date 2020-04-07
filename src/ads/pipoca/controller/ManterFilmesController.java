package ads.pipoca.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ads.pipoca.model.entity.Filme;
import ads.pipoca.model.entity.Genero;
import ads.pipoca.model.service.FilmeService;
import ads.pipoca.model.service.GeneroService;

@WebServlet("/manter_filmes.do")
public class ManterFilmesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String acao = request.getParameter("acao");
		
		Filme filme = null;
		int idFilme, idGenero;
		String titulo, diretor, descricao, posterPath = null;
		SimpleDateFormat sqlDate = new SimpleDateFormat("yyyy-MM-dd");
		Date data = null;
		double popularidade;
		
		ArrayList<Filme> filmes = null;
		ArrayList<Genero> generos = null;
		
		String saida = null;
		
		switch (acao) {
		case "page-adm":
			generos = listarGeneros();
			request.setAttribute("generos", generos);
			filmes = listarFilmes();
			request.setAttribute("filmes", filmes);
			saida = "AdmPanel.jsp";
			break;
			
		case "page-todos":
			filmes = listarFilmes();
			request.setAttribute("filmes", filmes);
			saida = "FilmesLista.jsp";
			break;
			
		case "page-exibir":
			idFilme = Integer.parseInt(request.getParameter("id_exibir"));
			filme = buscarFilme(idFilme);
			request.setAttribute("filme", filme);
			request.setAttribute("titulo", "Exibir Filme");
			saida = "Filme.jsp";
			break;
			
		case "page-excluir":
			idFilme = Integer.parseInt(request.getParameter("id_excluir"));
			filme = buscarFilme(idFilme);
			request.setAttribute("filme", filme);
			request.setAttribute("titulo", "Excluir Filme");
			request.setAttribute("btn", "<button type=\"button\" class=\"btn btn-danger text-uppercase\" data-toggle=\"modal\" data-target=\"#modalExcluir\">Excluir </button>");
		    saida = "Filme.jsp";
			break;
			
		case "page-atualizar":
			idFilme = Integer.parseInt(request.getParameter("id_atualizar"));
			filme = buscarFilme(idFilme);
			request.setAttribute("filme", filme);
			generos = listarGeneros();
			request.setAttribute("generos", generos);
			saida = "AtualizarFilme.jsp";
			break;
			
		case "btn-inserir":
			titulo = request.getParameter("titulo");
			diretor = request.getParameter("diretor");
			descricao = request.getParameter("descricao");
			
			try {
				data = sqlDate.parse(request.getParameter("data"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			popularidade = Double.parseDouble(request.getParameter("popularidade"));
			idGenero = Integer.parseInt(request.getParameter("genero"));
			posterPath = request.getParameter("posterpath");
			
			idFilme = inserirFilme(titulo, descricao, diretor, idGenero, data, popularidade, posterPath);
			Filme filmeInserido = buscarFilme(idFilme);
			
			request.setAttribute("filme", filmeInserido);
			request.setAttribute("titulo", "Filme Inserido");
			saida = "Filme.jsp";
			break;
			
		case "btn-atualizar":
			idFilme = Integer.parseInt(request.getParameter("id_atualizar"));
			titulo = request.getParameter("titulo");
			descricao = request.getParameter("descricao");
			diretor = request.getParameter("diretor");
			idGenero = Integer.parseInt(request.getParameter("genero"));
			
			try {
				data = sqlDate.parse(request.getParameter("data"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			popularidade = Double.parseDouble(request.getParameter("popularidade"));
			posterPath = request.getParameter("posterpath");
			filme = atualizarFilme(idFilme, titulo, descricao, diretor, idGenero, data, popularidade, posterPath);
			request.setAttribute("filme", filme);
			request.setAttribute("titulo", "Filme Atualizado");
			saida = "Filme.jsp";
			break;
			
		case "btn-excluir":
			int filmeId = Integer.parseInt(request.getParameter("id_excluir"));
			int feedback = deletarFilme(filmeId);
			generos = listarGeneros();
			filmes = listarFilmes();
			request.setAttribute("feedback", feedback);
			request.setAttribute("generos", generos);
			request.setAttribute("filmes", filmes);
			saida = "AdmPanel.jsp";
			
			break;
		}
		RequestDispatcher view = request.getRequestDispatcher(saida);
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public Filme buscarFilme(int id) throws IOException {
		FilmeService filmeService;
		filmeService = new FilmeService();
		Filme filme;
		filme = filmeService.buscarFilme(id);
		return filme;
	}

	public ArrayList<Filme> listarFilmes() throws IOException {
		FilmeService filmeService = new FilmeService();
		ArrayList<Filme> filmes = filmeService.listarFilmes();
		return filmes;
	}

	public ArrayList<Genero> listarGeneros() throws IOException {
		GeneroService genero;
		genero = new GeneroService();
		ArrayList<Genero> generos = genero.listarGeneros();
		return generos;
	}

	public int deletarFilme(int id) throws IOException {
		FilmeService filmeService = new FilmeService();
		return filmeService.deletarFilme(id);
	}

	public int inserirFilme(String titulo, String descricao, String diretor, int idGenero, Date data,
			double popularidade, String posterPath) throws IOException {
		Filme filme;
		Genero genero;
		filme = new Filme();
		filme.setTitulo(titulo);
		filme.setDescricao(descricao);
		filme.setDiretor(diretor);

		GeneroService generoService = new GeneroService();
		genero = generoService.buscarGenero(idGenero);
		filme.setGenero(genero);

		filme.setDataLancamento(data);
		
		filme.setPopularidade(popularidade);
		filme.setPosterPath(posterPath);
		FilmeService service = new FilmeService();
		return service.inserirFilme(filme);
	}

	public Filme atualizarFilme(int id, String titulo, String descricao, String diretor, int idGenero, Date data,
			double popularidade, String posterPath) throws IOException {
		Filme filme;
		Genero genero;
		filme = new Filme();
		filme.setId(id);
		filme.setTitulo(titulo);
		filme.setDescricao(descricao);
		filme.setDiretor(diretor);

		GeneroService generoService = new GeneroService();
		genero = generoService.buscarGenero(idGenero);
		filme.setGenero(genero);

		filme.setDataLancamento(data);
		filme.setPopularidade(popularidade);
		filme.setPosterPath(posterPath);
		FilmeService service = new FilmeService();
		return service.atualizarFilme(filme);
	}
}
