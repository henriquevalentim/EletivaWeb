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

public class ClienteDAO implements IDAO {
	private Connection connection = null;

	public void salvar(EntidadeDominio entidade) {
		PreparedStatement pst = null;
		Cliente cliente = (Cliente) entidade;

		try {
			connection = Conexao.getConnectionPostgres();

			UsuarioDAO usuarioDAO = new UsuarioDAO();
			usuarioDAO.salvar(cliente.getUsuario());

			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO tb_cliente(cli_nome, cli_email,cli_cpf,cli_cep,");
			sql.append(
					"cli_logradouro,cli_bairro,cli_municipio,cli_estado,cli_numero,cli_usu_id) VALUES (?,?,?,?,?,?,?,?,?,?)");

			pst = connection.prepareStatement(sql.toString());

			pst.setString(1, cliente.getNome());
			pst.setString(2, cliente.getEmail());
			pst.setString(3, cliente.getCpf());
			pst.setString(4, cliente.getCep());
			pst.setString(5, cliente.getLogradouro());
			pst.setString(6, cliente.getBairro());
			pst.setString(7, cliente.getMunicipio());
			pst.setString(8, cliente.getEstado());
			pst.setString(9, cliente.getNumero());
			pst.setInt(10, cliente.getUsuario().getId());

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

	public void alterar(EntidadeDominio entidade) {
		PreparedStatement pst = null;
		Cliente cliente = (Cliente) entidade;

		try {
			connection = Conexao.getConnectionPostgres();

			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE tb_cliente SET cli_nome = ?, cli_cpf = ?,");
			sql.append("cli_email = ?,cli_cep = ?,cli_logradouro=?,");
			sql.append("cli_bairro=?,cli_municipio=?,cli_estado=?,cli_numero=? where cli_id = ?");

			pst = connection.prepareStatement(sql.toString());

			pst.setString(1, cliente.getNome());
			pst.setString(2, cliente.getCpf());
			pst.setString(3, cliente.getEmail());
			pst.setString(4, cliente.getCep());
			pst.setString(5, cliente.getLogradouro());
			pst.setString(6, cliente.getBairro());
			pst.setString(7, cliente.getMunicipio());
			pst.setString(8, cliente.getEstado());
			pst.setString(9, cliente.getNumero());
			pst.setInt(10, cliente.getId());

			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void excluir(EntidadeDominio entidade) {

		PreparedStatement pst = null;
		Cliente cliente = (Cliente) entidade;

		try {
			connection = Conexao.getConnectionPostgres();

			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM tb_cliente WHERE pro_id=?");

			pst = connection.prepareStatement(sql.toString());

			pst.setInt(1, cliente.getId());

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

	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		PreparedStatement pst = null;
		ResultSet rs;

		List<EntidadeDominio> clientes = new ArrayList<>();

		try {
			connection = Conexao.getConnectionPostgres();

			pst = connection.prepareStatement("SELECT * FROM tb_cliente");
			rs = pst.executeQuery();

			while (rs.next()) {
				Cliente cliente = new Cliente();
				cliente.setId(rs.getInt("cli_id"));
				cliente.setNome(rs.getString("cli_nome"));
				cliente.setEmail(rs.getString("cli_emaiç"));
				cliente.setCpf(rs.getString("cli_cpf"));
				cliente.setCep(rs.getString("cli_cep"));
				cliente.setLogradouro(rs.getString("cli_logradouro"));
				cliente.setBairro(rs.getString("cli_bairro"));
				cliente.setEstado(rs.getString("cli_estado"));
				cliente.setNumero(rs.getString("cli_numero"));
				cliente.setMunicipio(rs.getString("cli_municipio"));

				clientes.add(cliente);
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

		return clientes;
	}


}
