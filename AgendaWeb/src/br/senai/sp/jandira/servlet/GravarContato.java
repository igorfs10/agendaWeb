package br.senai.sp.jandira.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.jandira.dao.ContatoDAO;
import br.senai.sp.jandira.modelo.Contato;

@WebServlet("/GravarContato")
public class GravarContato extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public GravarContato() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(request.getParameter("idUsuario"));
		
		Contato c = new Contato();
		c.setBairro(request.getParameter("txtBairro"));
		c.setCelular(request.getParameter("txtCelular"));
		c.setCep(request.getParameter("txtCep"));
		c.setCidade(request.getParameter("txtCidade"));
		c.setDtNasc(request.getParameter("txtDtNasc"));
		c.setEmail(request.getParameter("txtEmail"));
		c.setEstado(request.getParameter("txtEstado"));
		c.setIdUsuario(Integer.parseInt(request.getParameter("txtIdUsuario")));
		c.setLogradouro(request.getParameter("txtLogradouro"));
		c.setNome(request.getParameter("txtNome"));
		c.setSexo(request.getParameter("cbSexo"));
		c.setTelefone(request.getParameter("txtTelefone"));
		
		ContatoDAO cDao = new ContatoDAO(c);
		
		RequestDispatcher rd;
		
		if(cDao.gravarContato()){
			rd = request.getRequestDispatcher("index.jsp");
		} else {
			rd = request.getRequestDispatcher("cadastrar_contato.jsp");
		}
		
		rd.forward(request, response);
	}

}
