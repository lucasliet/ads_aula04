package ads.pipoca.model.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ads.pipoca.model.entity.Usuario;

public class UsuarioDAO {
    public boolean validar(Usuario usuario) throws IOException {
        String sqlSelect = "SELECT username, password FROM usuario " +
                "WHERE username = ? and password = ?";

        // usando o try with resources do Java 7, que fecha o que abriu
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
            stm.setString(1, usuario.getUsername());
            stm.setString(2, usuario.getPassword());
            try (ResultSet rs = stm.executeQuery();) {
                if (rs.next()) {
                    return true;
                } else {
                    return false;
                }
            } catch (SQLException e) {
                e.printStackTrace();
                throw new IOException(e);
            }
        } catch (SQLException e1) {
            e1.getStackTrace();
            throw new IOException(e1);
        }
    }

    public int cadastrar(Usuario usuario) throws IOException {
        String sql = "INSERT INTO usuario (username, password) VALUES (?, ?)";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
             pst.setString(1,usuario.getUsername());
             pst.setString(2,usuario.getPassword());
             pst.execute();

            String query = "select LAST_INSERT_ID()";
            try (PreparedStatement pst1 = conn.prepareStatement(query); ResultSet rs = pst1.executeQuery();) {

                if (rs.next()) {
                    int id = rs.getInt(1);
                    usuario.setId(id);
                }
            }

        } catch (SQLException e) {
            e.getStackTrace();
            throw new IOException(e);
        }
        return usuario.getId();
    }
}
