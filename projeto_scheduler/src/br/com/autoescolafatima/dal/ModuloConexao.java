/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.autoescolafatima.dal;

import java.sql.*;

/**
 *
 * @author mathe_000
 */
public class ModuloConexao {
    //Conecta com o banco
    public static Connection conector() {
        java.sql.Connection conexao = null;
        //Chama o driver
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/db_autoescola";
        String user = "root";
        String password = "";
        
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
