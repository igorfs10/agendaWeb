package br.senai.sp.jandira.dbutils;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	
	private static Connection con;
	
	public static Connection getConexao(){
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String dbUrl = "jdbc:mysql://10.107.134.3:3306/agenda?useSSL=false";
			con = DriverManager.getConnection(dbUrl, "root", "bcd127");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Ocorreu um erro na conexão com o banco!");
		}
		
		return con;
	}
	
}
