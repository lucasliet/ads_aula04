package ads.pipoca.model.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import ads.pipoca.model.entity.Filme;
import ads.pipoca.model.entity.Genero;

public class FilmeDAO {
    public ArrayList<Filme> listarFilmes() throws IOException {
        ArrayList<Filme> filmes = new ArrayList<>();
        String sql = "SELECT f.id, titulo, descricao, diretor, posterpath, "
                + "popularidade, data_lancamento, id_genero, nome "
                + "FROM FILME f JOIN GENERO g ON f.id_genero = g.id ORDER BY id";

        try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pst = conn.prepareStatement(sql);
				ResultSet rs = pst.executeQuery();) {

            while (rs.next()) {
                Filme filme = new Filme();
                filme.setId(rs.getInt("id"));
                filme.setTitulo(rs.getString("titulo"));
                filme.setDescricao(rs.getString("descricao"));
                filme.setDiretor(rs.getString("diretor"));
                filme.setPosterPath(rs.getString("posterpath"));
                filme.setPopularidade(rs.getDouble("popularidade"));
                filme.setDataLancamento(rs.getDate("data_lancamento"));
                Genero genero = new Genero();
                genero.setId(rs.getInt("id_genero"));
                genero.setNome(rs.getString("nome"));
                filme.setGenero(genero);
                filmes.add(filme);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new IOException(e);
        }
        /*for (int i = 0; i<filmes.size(); i++) {
        	System.out.println(filmes.get(i)+"\n");
        }*/
        return filmes;
    }

    public Filme buscarFilme(int id) throws IOException {
        Filme filme = null;
        String sql = "SELECT f.id, titulo, descricao, diretor, posterpath, "
                + "popularidade, data_lancamento, id_genero, nome "
                + "FROM FILME f, GENERO g "
                + "WHERE f.id_genero = g.id AND f.id = ?";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql);){

            pst.setInt(1, id);
            try (ResultSet rs = pst.executeQuery();) {

                while (rs.next()) {
                    filme = new Filme();
                    filme.setId(id);
                    filme.setTitulo(rs.getString("titulo"));
                    filme.setDescricao(rs.getString("descricao"));
                    filme.setDiretor(rs.getString("diretor"));
                    filme.setPosterPath(rs.getString("posterpath"));
                    filme.setPopularidade(rs.getDouble("popularidade"));
                    filme.setDataLancamento(rs.getDate("data_lancamento"));
                    Genero genero = new Genero();
                    genero.setId(rs.getInt("id_genero"));
                    genero.setNome(rs.getString("nome"));
                    filme.setGenero(genero);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                throw new IOException(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new IOException(e);
        }
        return filme;
    }

    public int deletarFilme(int id) throws IOException {
        int feedback = -1;
        Filme filme;
        String sql = "DELETE FROM FILME WHERE id = ?";

        try(Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement(sql);){
                filme = buscarFilme(id);
                pst.setInt(1, id);
                pst.execute();
                System.out.println("filme deletado");
                feedback = 1;
        }catch (SQLException e) {
            e.printStackTrace();
            throw new IOException(e);
        }
        if (feedback == -1){
            System.out.println("Operação falhou");
        }else{
            System.out.println("Filme "+filme.getTitulo()+" de ID "+filme.getId()+" foi removido com sucesso");
        }
        return feedback;
    }

    public int inserirFilme(Filme filme) throws IOException {
        int id = -1;
        String sql = "INSERT INTO FILME (titulo, descricao, diretor, posterpath, "
                + "popularidade, data_lancamento, id_genero) VALUES (?,?,?,?,?,?,?)";

        try (Connection conn = ConnectionFactory.getConnection(); PreparedStatement pst = conn.prepareStatement(sql);) {

            pst.setString(1, filme.getTitulo());
            pst.setString(2, filme.getDescricao());
            pst.setString(3, filme.getDiretor());
            pst.setString(4, filme.getPosterPath());
            pst.setDouble(5, filme.getPopularidade());
            pst.setDate(6, new java.sql.Date(filme.getDataLancamento().getTime()));
            pst.setInt(7, filme.getGenero().getId());
            pst.execute();

            // obter o id criado
            String query = "select LAST_INSERT_ID()";
            try (PreparedStatement pst1 = conn.prepareStatement(query); ResultSet rs = pst1.executeQuery();) {

                if (rs.next()) {
                    id = rs.getInt(1);
                    filme.setId(id);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new IOException(e);
        }
        System.out.println("Filme "+filme.getTitulo()+" de ID "+filme.getId()+" gerado no banco com sucesso");
        return id;
    }

    public Filme atualizarFilme(Filme filme) throws IOException {
        String sql = "UPDATE FILME SET titulo = ?, descricao = ?, diretor = ?, popularidade = ?, data_lancamento = ?, id_genero = ? WHERE id = ?";
        try (Connection conn = ConnectionFactory.getConnection(); PreparedStatement pst = conn.prepareStatement(sql);) {
            pst.setString(1, filme.getTitulo());
            pst.setString(2, filme.getDescricao());
            pst.setString(3, filme.getDiretor());
            pst.setDouble(4, filme.getPopularidade());
            pst.setDate(5, new java.sql.Date(filme.getDataLancamento().getTime()));
            pst.setInt(6, filme.getGenero().getId());
            pst.setInt(7, filme.getId());
            pst.execute();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new IOException(e);
        }
            Filme filmeAlterado = buscarFilme(filme.getId());
        return filmeAlterado;
    }
}
