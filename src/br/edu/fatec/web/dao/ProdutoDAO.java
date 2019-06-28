package br.edu.fatec.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.fatec.web.modelo.Cliente;
import br.edu.fatec.web.modelo.EntidadeDominio;
import br.edu.fatec.web.modelo.Produto;
import br.edu.fatec.web.util.Conexao;

public class ProdutoDAO implements IDAO {

	private Connection connection = null;

	@Override
	public void salvar(EntidadeDominio entidade) {

		PreparedStatement pst = null;
		Produto produto = (Produto) entidade;

		try {
			connection = Conexao.getConnectionPostgres();

			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO produto(pro_nome, pro_descricao,pro_preco_compra,pro_preco_venda,");
			sql.append("pro_url_foto,pro_cat_id) VALUES (?,?,?,?,?,?)");

			pst = connection.prepareStatement(sql.toString());

			pst.setString(1, produto.getNome());
			pst.setString(2, produto.getDescricao());
			pst.setDouble(3, produto.getPrecoCompra());
			pst.setDouble(4, produto.getPrecoVenda());
			pst.setString(5, produto.getUrlFoto());
			pst.setInt(6, produto.getIdCategoria());

			pst.executeUpdate();

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

	@Override
	public void alterar(EntidadeDominio entidade) {
		
		PreparedStatement pst = null;
		Produto produto = (Produto) entidade;

		try {
			connection = Conexao.getConnectionPostgres();

			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE produto SET pro_nome = ?, pro_descricao = ?,pro_preco_compra = ?,");
			sql.append("pro_preco_venda = ?,pro_url_foto = ?,pro_cat_id=? where pro_id = ?");

			pst = connection.prepareStatement(sql.toString());

			pst.setString(1, produto.getNome());
			pst.setString(2, produto.getDescricao());
			pst.setDouble(3, produto.getPrecoCompra());
			pst.setDouble(4, produto.getPrecoVenda());
			pst.setString(5, produto.getUrlFoto());
			pst.setInt(6, produto.getIdCategoria());
			pst.setInt(7, produto.getId());

			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void excluir(EntidadeDominio entidade) {

		PreparedStatement pst = null;
		Produto produto = (Produto) entidade;

		try {
			connection = Conexao.getConnectionPostgres();

			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM produto WHERE pro_id=?");

			pst = connection.prepareStatement(sql.toString());

			pst.setInt(1, produto.getId());

			pst.executeUpdate();

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

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		return null;
	}

	public List<Produto> listar() {

		PreparedStatement pst = null;
		ResultSet rs;

		List<Produto> produtos = new ArrayList<>();

		try {
			connection = Conexao.getConnectionPostgres();

			pst = connection.prepareStatement("SELECT * FROM produto");
			rs = pst.executeQuery();

			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getInt("pro_id"));
				produto.setNome(rs.getString("pro_nome"));
				produto.setDescricao(rs.getString("pro_descricao"));
				produto.setPrecoCompra(rs.getDouble("pro_preco_compra"));
				produto.setPrecoVenda(rs.getDouble("pro_preco_venda"));
				produto.setUrlFoto(rs.getString("pro_url_foto"));
				produto.setIdCategoria(rs.getInt("pro_cat_id"));

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

	public EntidadeDominio consultarPorId(EntidadeDominio entidade) {

		PreparedStatement pst = null;
		ResultSet rs;

		Produto produto = (Produto) entidade;

		try {
			connection = Conexao.getConnectionPostgres();

			pst = connection.prepareStatement("SELECT * FROM produto where pro_id=?");
			pst.setInt(1, produto.getId());
			rs = pst.executeQuery();

			while (rs.next()) {
				produto.setId(rs.getInt("pro_id"));
				produto.setNome(rs.getString("pro_nome"));
				produto.setDescricao(rs.getString("pro_descricao"));
				produto.setPrecoCompra(rs.getDouble("pro_preco_compra"));
				produto.setPrecoVenda(rs.getDouble("pro_preco_venda"));
				produto.setUrlFoto(rs.getString("pro_url_foto"));
				produto.setIdCategoria(rs.getInt("pro_cat_id"));
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

		return produto;
	}

	public List<EntidadeDominio> consultarPorCategoria(EntidadeDominio entidade) {

		PreparedStatement pst = null;
		ResultSet rs;

		Produto p = (Produto) entidade;
		List<EntidadeDominio> produtos = new ArrayList<>();
		try {
			connection = Conexao.getConnectionPostgres();

			pst = connection.prepareStatement("SELECT * FROM produto where pro_cat_id=?");
			pst.setInt(1, p.getIdCategoria());
			rs = pst.executeQuery();

			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getInt("pro_id"));
				produto.setNome(rs.getString("pro_nome"));
				produto.setDescricao(rs.getString("pro_descricao"));
				produto.setPrecoCompra(rs.getDouble("pro_preco_compra"));
				produto.setPrecoVenda(rs.getDouble("pro_preco_venda"));
				produto.setUrlFoto(rs.getString("pro_url_foto"));
				produto.setIdCategoria(rs.getInt("pro_cat_id"));

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

	public List<Produto> consultarPorIDs(ArrayList<Integer> ids) {

		PreparedStatement pst = null;
		ResultSet rs;

		List<Produto> produtos = new ArrayList<>();
		try {
			for (int i = 0; i < ids.size(); i++) {
				connection = Conexao.getConnectionPostgres();

				pst = connection.prepareStatement("SELECT * FROM produto where pro_id=?");
				pst.setInt(1, ids.get(i));
				rs = pst.executeQuery();
				if (rs.next()) {

					Produto produto = new Produto();
					produto.setId(rs.getInt("pro_id"));
					produto.setNome(rs.getString("pro_nome"));
					produto.setDescricao(rs.getString("pro_descricao"));
					produto.setPrecoCompra(rs.getDouble("pro_preco_compra"));
					produto.setPrecoVenda(rs.getDouble("pro_preco_venda"));
					produto.setUrlFoto(rs.getString("pro_url_foto"));
					produto.setIdCategoria(rs.getInt("pro_cat_id"));

					produtos.add(produto);

				}
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
