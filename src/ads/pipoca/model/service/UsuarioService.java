package ads.pipoca.model.service;

import java.io.IOException;

import ads.pipoca.model.dao.UsuarioDAO;
import ads.pipoca.model.entity.Usuario;

public class UsuarioService {
	private UsuarioDAO dao;

	public UsuarioService(){
		this.dao = new UsuarioDAO();
	}

	public boolean validar(Usuario usuario) throws IOException{
		return dao.validar(usuario);
	}

	public int cadastrar(Usuario usuario) throws IOException {
		return dao.cadastrar(usuario);
	}
}
