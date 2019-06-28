package br.edu.fatec.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import br.edu.fatec.web.modelo.EntidadeDominio;
import br.edu.fatec.web.modelo.Venda;
import br.edu.fatec.web.util.Conexao;

public class ItensVendaDAO implements IDAO {

	private Connection connection;

	@Override
	public void salvar(EntidadeDominio entidade) {
	}

	public void salvarLista(Venda venda) {

		PreparedStatement pst = null;

		try {
			if (connection == null) {
				connection = Conexao.getConnectionPostgres();
			}
			connection.setAutoCommit(false);
			
			VendaDAO vendaDAO = new VendaDAO();
			vendaDAO.salvarLista(venda);
			
			for (int i = 0; i < venda.getCarrinho().size(); i++) {
				StringBuilder sql = new StringBuilder();
				sql.append("INSERT INTO tb_itens_venda(itens_ven_id,itens_pro_id) VALUES (?,?) ");
				pst = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);

				pst.setInt(1, venda.getId());
				pst.setInt(2, venda.getCarrinho().get(i).getId());

				pst.executeUpdate();

			}
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	@Override
	public void alterar(EntidadeDominio entidade) {
	}

	@Override
	public void excluir(EntidadeDominio entidade) {
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		return null;
	}

}
