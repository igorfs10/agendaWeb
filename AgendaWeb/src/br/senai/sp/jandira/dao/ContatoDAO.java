package br.senai.sp.jandira.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import br.senai.sp.jandira.dbutils.Conexao;
import br.senai.sp.jandira.modelo.Contato;

public class ContatoDAO {
	
	private Contato contato;
	private PreparedStatement stm;
	private ResultSet rs;
	
	public ArrayList<Contato> getContatos(int idUsuario){
		ArrayList<Contato> contatos = new ArrayList<>();
		
		String sql = "SELECT * FROM contatos "
				+ "WHERE idUsuario = ?";
		
		try{
			
			stm = Conexao.getConexao().prepareStatement(sql);
			stm.setInt(1, idUsuario);
			
			rs = stm.executeQuery();
			
			while(rs.next()){
				contato = new Contato();
				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setDtNasc(rs.getDate("dtNasc"));
				contato.setLogradouro(rs.getString("logradouro"));
				contato.setBairro(rs.getString("bairro"));
				contato.setCidade(rs.getString("cidade"));
				contato.setEstado(rs.getString("estado"));
				contato.setCep(rs.getString("cep"));
				contato.setTelefone(rs.getString("telefone"));
				contato.setCelular(rs.getString("celular"));
				contato.setSexo(rs.getString("sexo"));
				contato.setIdUsuario(rs.getInt("idUsuario"));
				contatos.add(contato);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return contatos;
	}
}
