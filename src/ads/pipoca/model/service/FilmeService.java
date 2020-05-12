package ads.pipoca.model.service;

import java.io.IOException;
import java.util.ArrayList;

import ads.pipoca.model.dao.FilmeDAO;
import ads.pipoca.model.entity.Filme;

public class FilmeService {
    public ArrayList<Filme> listarFilmes() throws IOException {
        FilmeDAO dao = new FilmeDAO();
        return dao.listarFilmes();
    }

    public ArrayList<Filme> listarFilmes(ArrayList<Integer> lista) throws IOException {
        ArrayList<Filme> filmes = new ArrayList<>();
        for(int id:lista) {
            filmes.add(buscarFilme(id));
        }
        return filmes;
    }

    public Filme buscarFilme(int id) throws IOException {
        FilmeDAO dao = new FilmeDAO();
        return dao.buscarFilme(id);
    }

    public int deletarFilme(int id) throws IOException {
        FilmeDAO dao = new FilmeDAO();
        return dao.deletarFilme(id);
    }

    public int inserirFilme(Filme filme) throws IOException {
        FilmeDAO dao = new FilmeDAO();
        return dao.inserirFilme(filme);
    }

    public Filme atualizarFilme(Filme filme) throws IOException {
        FilmeDAO dao = new FilmeDAO();
        return dao.atualizarFilme(filme);
    }

    public void excluirVariosFilmes(ArrayList<Integer> lista) throws IOException{
        FilmeDAO dao = new FilmeDAO();
		for(int id:lista) {
			dao.deletarFilme(id);
		}
    }
}
