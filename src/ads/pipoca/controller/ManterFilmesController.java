package ads.pipoca.controller;

import java.io.IOException;
import java.text.DateFormat;
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
		case "exibir":
			String id_filme = request.getParameter("id_exibir");
			int idFilme = Integer.parseInt(id_filme);
			Filme filme = buscarFilme(idFilme);
			request.setAttribute("filme", filme);
			SimpleDateFormat formatterE=new SimpleDateFormat("dd/MM/yyyy");
			String dataE=formatterE.format(filme.getDataLancamento());
			request.setAttribute("data", dataE);
			RequestDispatcher view = request.getRequestDispatcher("ExibirFilme.jsp");
			view.forward(request, response);
			break;
			
		case "gerenciar_filmes":
			ArrayList<Genero> generos = listarGeneros();
			String html = "";
			for (Genero genero : generos) {
				html += "<option value='" + genero.getId() + "'>" + genero.getNome() + "</option>\n";
			}
			request.setAttribute("generos", html);
			ArrayList<Filme> filmes = listarFilmes();
			String htmlFilmes = "";
			for (Filme filme1 : filmes) {
				htmlFilmes += "<option value='" + filme1.getId() + "'>" + filme1.getTitulo() + "</option>\n";
			}
			request.setAttribute("filmes", htmlFilmes);
			RequestDispatcher view2 = request.getRequestDispatcher("GerenciarFilmes.jsp");
			view2.forward(request, response);
			break;
			
		case "atualizar_filme":
			int idFilme3 = Integer.parseInt(request.getParameter("id_atualizar"));
			Filme filme2 = buscarFilme(idFilme3);
			request.setAttribute("filme", filme2);
			SimpleDateFormat formatter=new SimpleDateFormat("dd/MM/yyyy");
			String data=formatter.format(filme2.getDataLancamento());
			request.setAttribute("data", data);
			ArrayList<Genero> generos2 = listarGeneros();
			String html2 = "";
			for (Genero genero : generos2) {
				if (genero.getId() == filme2.getGenero().getId()) {
					html2 += "<option value='" + genero.getId() + "' selected>" + genero.getNome() + "</option>\n";
				} else {
					html2 += "<option value='" + genero.getId() + "'>" + genero.getNome() + "</option>\n";
				}
			}
			request.setAttribute("options", html2);
			RequestDispatcher view3 = request.getRequestDispatcher("AtualizarFilme.jsp");
			view3.forward(request, response);
			break;
			
		case "excluir_filme":
			String idExcluido = request.getParameter("id_excluir");
			int idFilmeExcluido = Integer.parseInt(idExcluido);
			Filme filmeExcluido = buscarFilme(idFilmeExcluido);
			request.setAttribute("filme", filmeExcluido);
			RequestDispatcher viewExcluido = request.getRequestDispatcher("ExcluirFilme.jsp");
			viewExcluido.forward(request, response);
			break;
			
		case "inserir":
			String titulo = request.getParameter("titulo");
			String diretor = request.getParameter("diretor");
			String descricao = request.getParameter("descricao");
			SimpleDateFormat sql = new SimpleDateFormat("yyyy-MM-dd");
			Date data1 = null;
			try {
				data1 = sql.parse(request.getParameter("data"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			double popularidade = Double.parseDouble(request.getParameter("popularidade"));
			int idGenero = Integer.parseInt(request.getParameter("genero"));
			String posterPath = request.getParameter("posterpath");
			int idInserido = inserirFilme(titulo, descricao, diretor, idGenero, data1, popularidade, posterPath);
			Filme filmeInserido = buscarFilme(idInserido);
			System.out.println(filmeInserido);
			request.setAttribute("filme", filmeInserido);
			RequestDispatcher viewInserir = request.getRequestDispatcher("ExibirFilme.jsp");
			viewInserir.forward(request, response);
			break;
			
		case "atualizar":
			int id = Integer.parseInt(request.getParameter("id"));
			String titulo2 = request.getParameter("titulo");
			String descricao2 = request.getParameter("descricao");
			String diretor2 = request.getParameter("diretor");
			int idGenero2 = Integer.parseInt(request.getParameter("genero"));
			String data2 = request.getParameter("data");
			double popularidade2 = Double.parseDouble(request.getParameter("popularidade"));
			Filme filmeAtualizado = atualizarFilme(id, titulo2, descricao2, diretor2, idGenero2, data2, popularidade2);
			request.setAttribute("filme", filmeAtualizado);
			RequestDispatcher viewAtualizar = request.getRequestDispatcher("ExibirFilme.jsp");
			viewAtualizar.forward(request, response);
			break;
			
		case "excluir":
			int filmeId = Integer.parseInt(request.getParameter("id_excluir"));
			System.out.println(filmeId);
			int feedback = deletarFilme(filmeId);
			request.setAttribute("feedback", feedback);
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

	public int inserirFilme(String titulo, String descricao, String diretor, int idGenero, Date data,
			double popularidade, String posterPath) throws IOException {
		Filme filme;
		Genero genero;
		filme = new Filme();
		filme.setTitulo(titulo);
		filme.setDescricao(descricao);
		filme.setDiretor(diretor);

		GeneroDAO generoDAO = new GeneroDAO();
		genero = generoDAO.buscarGenero(idGenero);
		filme.setGenero(genero);

		/*DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		try {
			filme.setDataLancamento(formatter.parse(data));
		} catch (ParseException e) {
			e.printStackTrace();
			filme.setDataLancamento(null);
		}*/
		filme.setDataLancamento(data);
		
		filme.setPopularidade(popularidade);
		filme.setPosterPath(posterPath);
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
