package ads.pipoca.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ads.pipoca.model.entity.Compra;
import ads.pipoca.model.entity.Filme;
import ads.pipoca.model.entity.Usuario;
import ads.pipoca.model.service.CompraService;
import ads.pipoca.model.service.FilmeService;
import sun.plugin.javascript.navig.Array;

@WebServlet("/comprar_filmes.do")
public class ComprarFilmesController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String acao = request.getParameter("acao");

        FilmeService fService = new FilmeService();
        CompraService cService = new CompraService();

        String saida = "index.jsp";

        HttpSession session = request.getSession();

        Filme filme = null;

        TreeSet<Filme> carrinho = null;
        ArrayList<Compra> compras = null;
        ArrayList<Filme> filmes = null;
        ArrayList<Integer> listaIds = null;

        Object aux = null;

        String path = request.getRealPath(request.getContextPath());
        Usuario logado = (Usuario) session.getAttribute("logado");

        switch (acao) {
            case "page-todos":
                filmes = fService.listarFilmes();
                request.setAttribute("filmes", filmes);
                saida = "FilmesListaComprar.jsp";
                break;

            case "page-comprar":
                filmes = fService.listarFilmes(obterIds(request));
                //pegar o carrinho da sessão e ver se já tem filmes
                aux = session.getAttribute("filmes");
                if (aux instanceof TreeSet<?>) {
                    carrinho = (TreeSet<Filme>) aux;
                } else {
                    carrinho = new TreeSet<>();
                }
                carrinho.addAll(filmes);
                session.setAttribute("filmes", carrinho);
                saida = "Carrinho.jsp";
                break;

            case "btn-exibir":
                listaIds = obterIds(request);
                filme = fService.buscarFilme(listaIds.get(0));
                request.setAttribute("filme", filme);
                saida = "Filme.jsp";
                break;

            case "btn-excluir-do-carrinho":
                filmes = fService.listarFilmes(obterIds(request));
                aux = session.getAttribute("filmes");

                if (aux != null && aux instanceof TreeSet<?>) {
                    carrinho = (TreeSet<Filme>) aux;
                    if (carrinho.size() > 0) {
                        carrinho.removeAll(filmes);
                    }
                }
                session.setAttribute("filmes", carrinho);
                saida = "Carrinho.jsp";
                break;

            case "btn-finalizar":
                aux = session.getAttribute("filmes");
                if(aux instanceof TreeSet<?>) {
                    carrinho = (TreeSet<Filme>)aux;
                    compras = new ArrayList<>();

                    for(Filme item:carrinho) {
                        Compra compra = new Compra();
                        compra.setDataCompra(new Date());
                        compra.setIdFilme(item.getId());
                        compra.setTituloFilme(item.getTitulo());
                        compra.setUsuario(logado.getUsername());
                        compras.add(compra);
                    }
                    cService.gravarLogCompra(path, compras);
                }
                //para zerar o carrinho
                session.setAttribute("filmes", null);
                saida = "Agradecimentos.jsp";
                break;

            case "listar-compras":
                compras = cService.lerLogCompra(path);
                if (compras == null) {
                    compras = new ArrayList<>();
                }
                request.setAttribute("compras", compras);
                saida = "LogCompras.jsp";
                break;

        }
        RequestDispatcher view = request.getRequestDispatcher(saida);
        view.forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private ArrayList<Integer> obterIds(HttpServletRequest request) {
        Enumeration<String> pars = request.getParameterNames();
        ArrayList<Integer> listaIds = new ArrayList<>();
        String par;
        String[] vals = null;

        try {
            while ((par = pars.nextElement()) != null) {
                if (par.startsWith("box")) {
                    System.out.println(par + " = " + Arrays.toString(request.getParameterValues(par)));
                    vals = request.getParameterValues(par);
                    if (vals != null && vals.length > 0 && vals[0].equals("on")) {
                        listaIds.add(Integer.parseInt(par.substring(3)));
                    }
                }
            }
        } catch (NoSuchElementException nsee) {
            nsee.printStackTrace();
        }
        return listaIds;
    }
}
