package br.edu.fatec.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.fatec.web.modelo.AnaliseDados;
import br.edu.fatec.web.modelo.Produto;
import br.edu.fatec.web.util.Conexao;

public class AnaliseDAO {

	private Connection connection = null;

	public int contarProdutos() {

		PreparedStatement pst = null;
		ResultSet rs;
		int numero = 0;
		try {
			connection = Conexao.getConnectionPostgres();

			pst = connection.prepareStatement("SELECT count(pro_id) FROM produto");
			rs = pst.executeQuery();

			while (rs.next()) {
				numero = rs.getInt("count");

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return numero;
	}

	public int contarClientes() {

		PreparedStatement pst = null;
		ResultSet rs;
		int numero = 0;
		try {
			connection = Conexao.getConnectionPostgres();

			pst = connection.prepareStatement("SELECT count(cli_id) FROM tb_cliente");
			rs = pst.executeQuery();

			while (rs.next()) {
				numero = rs.getInt("count");

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return numero;
	}

	public double lucroBrutoMensal() {

		PreparedStatement pst = null;
		ResultSet rs;
		double numero = 0;
		try {
			connection = Conexao.getConnectionPostgres();

			pst = connection.prepareStatement(
					"SELECT sum(p.pro_preco_venda - p.pro_preco_compra) FROM tb_venda as v,tb_itens_venda as i,produto as p WHERE i.itens_ven_id = v.ven_id and p.pro_id = i.itens_pro_id and v.ven_data > CURRENT_DATE - 30");
			rs = pst.executeQuery();

			while (rs.next()) {
				numero = rs.getDouble("sum");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return numero;
	}

	public double lucroBrutoAnual() {

		PreparedStatement pst = null;
		ResultSet rs;
		double numero = 0;
		try {
			connection = Conexao.getConnectionPostgres();

			pst = connection.prepareStatement(
					"SELECT sum(p.pro_preco_venda - p.pro_preco_compra) FROM tb_venda as v,tb_itens_venda as i,produto as p WHERE i.itens_ven_id = v.ven_id and p.pro_id = i.itens_pro_id and v.ven_data > CURRENT_DATE - 365");
			rs = pst.executeQuery();

			while (rs.next()) {
				numero = rs.getDouble("sum");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return numero;
	}

	public List<Integer> qtdeVendasPorMes() {

		PreparedStatement pst = null;
		ResultSet rs;
		AnaliseDados analiseDados = new AnaliseDados();
		try {
			connection = Conexao.getConnectionPostgres();

			StringBuilder sql = new StringBuilder();
			sql.append("select to_char(ven_data, 'Month'),count(to_char(ven_data, 'Month')) ");
			sql.append("from tb_venda as v,tb_itens_venda as i ");
			sql.append("where i.itens_ven_id = v.ven_id and v.ven_data ");
			sql.append("BETWEEN '2018-01-01' and '2018-12-31' ");
			sql.append("group by to_char(ven_data, 'Month'),EXTRACT(MONTH FROM ven_data) ");
			sql.append("order by EXTRACT(MONTH FROM ven_data);");

			pst = connection.prepareStatement(sql.toString());
			rs = pst.executeQuery();

			while (rs.next()) {
				analiseDados.getMeses().add(rs.getInt("count"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return analiseDados.getMeses();
	}
	
	
	public List<Produto> maisVendidos() {

		PreparedStatement pst = null;
		ResultSet rs;

		List<Produto> produtos = new ArrayList<>();

		try {
			connection = Conexao.getConnectionPostgres();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT p.pro_nome, count(i.itens_pro_id) ");
			sql.append("FROM tb_itens_venda as i ");
			sql.append("JOIN Produto AS p ON ( p.pro_id = i.itens_pro_id) ");
			sql.append("GROUP BY p.pro_id, p.pro_nome ");
			sql.append("ORDER BY count(i.itens_pro_id) DESC LIMIT 5;");

			pst = connection.prepareStatement(sql.toString());
			rs = pst.executeQuery();

			while (rs.next()) {
				Produto produto = new Produto();
				produto.setNome(rs.getString("pro_nome"));
				produtos.add(produto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return produtos;
	}

}
