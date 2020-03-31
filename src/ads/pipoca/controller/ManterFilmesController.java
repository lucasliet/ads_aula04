package ads.pipoca.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ads.pipoca.model.dao.GeneroDAO;
import ads.pipoca.model.entity.Filme;
import ads.pipoca.model.entity.Genero;
import ads.pipoca.model.service.FilmeService;
import ads.pipoca.model.service.GeneroService;


@WebServlet("/manter_filmes.do")
public class ManterFilmesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String acao = request.getParameter("acao");

		switch (acao) {
		case "mostrar":
			String id_filme = request.getParameter("id_filme");
			int idFilme = Integer.parseInt(id_filme);
			Filme filme = buscarFilme(idFilme);
			System.out.println(filme);
			request.setAttribute("filme", filme);
			RequestDispatcher view = request.getRequestDispatcher("Filme.jsp");
			view.forward(request, response);
			break;
		case "inserir":
			String titulo = request.getParameter("titulo");
			String descricao = request.getParameter("descricao");
			String diretor = request.getParameter("diretor");
			int idGenero = Integer.parseInt(request.getParameter("idGenero"));
			String data = request.getParameter("data");
			double popularidade = Double.parseDouble(request.getParameter("popularidade"));
			inserirFilme(titulo, descricao, diretor, idGenero, data, popularidade);
			break;
		case "atualizar":
			break;
		case "excluir":
			int idFilme = Integer.parseInt(request.getParameter("id_filme"));
			
			break;
		}

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

	public int inserirFilme(String titulo, String descricao, String diretor, int idGenero, String data,
			double popularidade) throws IOException {
		Filme filme;
		Genero genero;
		filme = new Filme();
		filme.setTitulo(titulo);
		filme.setDescricao(descricao);
		filme.setDiretor(diretor);

		GeneroDAO generoDAO = new GeneroDAO();
		genero = generoDAO.buscarGenero(idGenero);
		filme.setGenero(genero);

		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		try {
			filme.setDataLancamento(formatter.parse(data));
		} catch (ParseException e) {
			e.printStackTrace();
			filme.setDataLancamento(null);
		}

		filme.setPopularidade(popularidade);
		filme.setPosterPath("img/" + titulo + ".jpg");
		FilmeService service = new FilmeService();
		return service.inserirFilme(filme);
	}

	public Filme atualizarFilme(int id, String titulo, String descricao, String diretor, int idGenero, String data,
			double popularidade) throws IOException {
		Filme filme;
		Genero genero;
		filme = new Filme();
		filme.setId(id);
		filme.setTitulo(titulo);
		filme.setDescricao(descricao);
		filme.setDiretor(diretor);

		GeneroDAO generoDAO = new GeneroDAO();
		genero = generoDAO.buscarGenero(idGenero);
		filme.setGenero(genero);

		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		try {
			filme.setDataLancamento(formatter.parse(data));
		} catch (ParseException e) {
			e.printStackTrace();
			filme.setDataLancamento(null);
		}

		filme.setPopularidade(popularidade);
		filme.setPosterPath("img/" + titulo + ".jpg");
		FilmeService service = new FilmeService();
		return service.atualizarFilme(filme);
	}
}
