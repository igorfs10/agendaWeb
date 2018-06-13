package br.senai.sp.jandira.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.jandira.dao.UsuarioDAO;
import br.senai.sp.jandira.modelo.Usuario;

@WebServlet("/GravarUsuario")
public class GravarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GravarUsuario() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = new Usuario();
		usuario.setNome(request.getParameter("txtNome"));
		usuario.setEmail(request.getParameter("txtEmail"));
		usuario.setSenha(request.getParameter("txtSenha"));
		usuario.setCidade(request.getParameter("txtCidade"));
		usuario.setDtNasc(request.getParameter("txtDtNasc"));
		
		UsuarioDAO uDao = new UsuarioDAO();
		
		RequestDispatcher rd;
		
		if(uDao.gravar(usuario)){
			rd = request.getRequestDispatcher("sucesso.html");
		} else {
			rd = request.getRequestDispatcher("novo_usuario.html");
		}
		
		rd.forward(request, response);
	}

}
