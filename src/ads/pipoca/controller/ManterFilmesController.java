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
		String acao = request.getParameter("acao");

		switch (acao) {
		case "page-adm":
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
			RequestDispatcher view2 = request.getRequestDispatcher("AdmPanel.jsp");
			view2.forward(request, response);
			break;
			
		case "page-exibir":
			String id_filme = request.getParameter("id_exibir");
			int idFilme = Integer.parseInt(id_filme);
			Filme filme = buscarFilme(idFilme);
			request.setAttribute("filme", filme);
			
			SimpleDateFormat formatterE=new SimpleDateFormat("dd/MM/yyyy");
			String dataE=formatterE.format(filme.getDataLancamento());
			request.setAttribute("data", dataE);
			
			request.setAttribute("titulo", "Exibir Filme");
			RequestDispatcher view = request.getRequestDispatcher("Filme.jsp");
			view.forward(request, response);
			break;
			
		case "page-excluir":
			String idExcluido = request.getParameter("id_excluir");
			int idFilmeExcluido = Integer.parseInt(idExcluido);
			Filme filmeExcluido = buscarFilme(idFilmeExcluido);
			request.setAttribute("filme", filmeExcluido);
			
			SimpleDateFormat formatterExcluir=new SimpleDateFormat("dd/MM/yyyy");
			String dataExcluir=formatterExcluir.format(filmeExcluido.getDataLancamento());
			request.setAttribute("data", dataExcluir);
			
			request.setAttribute("titulo", "Excluir Filme");
			String btnExcluir = " <button type=\"button\" class=\"btn btn-danger text-uppercase\" data-toggle=\"modal\" data-target=\"#modalExcluir\">Excluir </button>";
			request.setAttribute("btn", btnExcluir);
			RequestDispatcher viewExcluido = request.getRequestDispatcher("Filme.jsp");
			viewExcluido.forward(request, response);
			break;
			
		case "page-atualizar":
			int idFilme3 = Integer.parseInt(request.getParameter("id_atualizar"));
			Filme filme2 = buscarFilme(idFilme3);
			request.setAttribute("filme", filme2);
			ArrayList<Genero> generos2 = listarGeneros();
			String html2 = "";
			for (Genero genero : generos2) {
				if (genero.getId() == filme2.getGenero().getId()) {
					html2 += "<option value='" + genero.getId() + "' selected>" + genero.getNome() + "</option>\n";
				} else {
					html2 += "<option value='" + genero.getId() + "'>" + genero.getNome() + "</option>\n";
				}
			}
			request.setAttribute("generos", html2);
			RequestDispatcher view3 = request.getRequestDispatcher("AtualizarFilme.jsp");
			view3.forward(request, response);
			break;
			
		case "btn-inserir":
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
			request.setAttribute("filme", filmeInserido);
			request.setAttribute("titulo", "Filme Inserido");
			
			SimpleDateFormat formatterI=new SimpleDateFormat("dd/MM/yyyy");
			String dataI=formatterI.format(filmeInserido.getDataLancamento());
			request.setAttribute("data", dataI);
			
			RequestDispatcher viewInserir = request.getRequestDispatcher("Filme.jsp");
			viewInserir.forward(request, response);
			break;
			
		case "btn-atualizar":
			int id = Integer.parseInt(request.getParameter("id_atualizar"));
			String titulo2 = request.getParameter("titulo");
			String descricao2 = request.getParameter("descricao");
			String diretor2 = request.getParameter("diretor");
			int idGenero2 = Integer.parseInt(request.getParameter("genero"));
			
			SimpleDateFormat sql2 = new SimpleDateFormat("yyyy-MM-dd");
			Date data2 = null;
			try {
				data2 = sql2.parse(request.getParameter("data"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			double popularidade2 = Double.parseDouble(request.getParameter("popularidade"));
			String posterPath2 = request.getParameter("posterpath");
			Filme filmeAtualizado = atualizarFilme(id, titulo2, descricao2, diretor2, idGenero2, data2, popularidade2, posterPath2);
			System.out.println(filmeAtualizado);
			request.setAttribute("filme", filmeAtualizado);
			
			SimpleDateFormat formatterA=new SimpleDateFormat("dd/MM/yyyy");
			String dataA=formatterA.format(filmeAtualizado.getDataLancamento());
			request.setAttribute("data", dataA);
			
			request.setAttribute("titulo", "Filme Atualizado");
			RequestDispatcher viewAtualizar = request.getRequestDispatcher("Filme.jsp");
			viewAtualizar.forward(request, response);
			break;
			
		case "btn-excluir":
			int filmeId = Integer.parseInt(request.getParameter("id_excluir"));
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

		GeneroService generoService = new GeneroService();
		genero = generoService.buscarGenero(idGenero);
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
		System.out.println(posterPath);
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
		/*
		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
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
		return service.atualizarFilme(filme);
	}
}
