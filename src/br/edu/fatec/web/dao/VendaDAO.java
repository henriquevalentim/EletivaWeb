package br.edu.fatec.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import br.edu.fatec.web.modelo.Cliente;
import br.edu.fatec.web.modelo.EntidadeDominio;
import br.edu.fatec.web.modelo.Venda;
import br.edu.fatec.web.util.Conexao;


public class VendaDAO implements IDAO {
	private Connection connection = null;

	
	public void salvar(EntidadeDominio entidade) {
		
	}
	public void salvarLista(Venda venda) {
		PreparedStatement pst = null;
		try {
			connection = Conexao.getConnectionPostgres();
			connection.setAutoCommit(false);

			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO tb_venda(ven_total, ven_usu_id) VALUES(?,?)");

			pst = connection.prepareStatement(sql.toString(), 
					Statement.RETURN_GENERATED_KEYS);

			pst.setDouble(1, venda.getTotal());
			pst.setInt(2, venda.getUsuario().getId());

			pst.executeUpdate();
			ResultSet rs = pst.getGeneratedKeys();
			int idVenda=0;
			if(rs.next())
				idVenda = rs.getInt(1);
			venda.setId(idVenda);
			
			connection.commit();
			
		} catch (Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}


	public void alterar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub

	}

	public void excluir(EntidadeDominio entidade) {
		// TODO Auto-generated method stub

	}

	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		return null;
	}

}

