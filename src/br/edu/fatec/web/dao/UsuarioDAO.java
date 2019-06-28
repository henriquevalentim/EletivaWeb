package br.edu.fatec.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import br.edu.fatec.web.modelo.Cliente;
import br.edu.fatec.web.modelo.EntidadeDominio;
import br.edu.fatec.web.modelo.Usuario;
import br.edu.fatec.web.util.Conexao;

public class UsuarioDAO implements IDAO {

	private Connection connection;
	
	@Override
	public void salvar(EntidadeDominio entidade) {

		PreparedStatement pst=null;
		Usuario usuario = (Usuario)entidade;
		
		
		try {
			if(connection == null){
				connection = Conexao.getConnectionPostgres();
			}
			connection.setAutoCommit(false);
			
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO tb_usuario(usu_login,usu_senha,usu_nivel_acesso) VALUES (?,?,?) ");
			pst = connection.prepareStatement(sql.toString(),
					Statement.RETURN_GENERATED_KEYS);
			
			pst.setString(1, usuario.getLogin());
			pst.setString(2, usuario.getSenha());
			pst.setInt(3,usuario.getId());
			
			
			pst.executeUpdate();		
					
			ResultSet rs = pst.getGeneratedKeys();
			int idUsuario=0;
			if(rs.next())
				idUsuario = rs.getInt(1);
			usuario.setId(idUsuario);
			
			connection.commit();					
		} catch (Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();	
		}finally{
				try {
					pst.close();
						connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
	}
	
	
	public EntidadeDominio autenticar(EntidadeDominio entidade) {
		PreparedStatement pst = null;
		ResultSet rs;
		Usuario usuario = (Usuario)entidade;
		Usuario usuarioAutenticado = null;
		try {
			connection = Conexao.getConnectionPostgres();

			
			StringBuilder sql = new StringBuilder();
			sql.append("select usu_id,usu_login,usu_senha,usu_nivel_acesso ");
			sql.append("from tb_usuario where usu_login=? and usu_senha=?");
			
			pst = connection.prepareStatement(sql.toString());
			pst.setString(1, usuario.getLogin());
			pst.setString(2, usuario.getSenha());
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				usuarioAutenticado = new Usuario();
				usuarioAutenticado.setId(Integer.parseInt(rs.getString("usu_id")));
				usuarioAutenticado.setLogin(rs.getString("usu_login"));
				usuarioAutenticado.setSenha(rs.getString("usu_senha"));
				usuarioAutenticado.setNivelAcesso(Integer.parseInt(rs.getString("usu_nivel_acesso")));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
				try {
					pst.close();
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return usuarioAutenticado;
	}
	

	@Override
	public void alterar(EntidadeDominio entidade) {
	}

	@Override
	public void excluir(EntidadeDominio entidade) {
	}
	
	public EntidadeDominio consultarPorId(EntidadeDominio entidade) {
		PreparedStatement pst = null;
		ResultSet rs;

		Usuario usuario = (Usuario)entidade;
		Cliente cliente = new Cliente();

		try {
			connection = Conexao.getConnectionPostgres();

			pst = connection.prepareStatement("select * from tb_usuario as usu,tb_cliente as cli where cli.cli_usu_id = usu.usu_id and usu.usu_id = ?");
			pst.setInt(1, usuario.getId());
			rs = pst.executeQuery();

			while (rs.next()) {
				
				cliente.setId(rs.getInt("cli_id"));
				cliente.setNome(rs.getString("cli_nome"));
				cliente.setEmail(rs.getString("cli_email"));
				cliente.setCpf(rs.getString("cli_cpf"));
				cliente.setCep(rs.getString("cli_cep"));
				cliente.setLogradouro(rs.getString("cli_logradouro"));
				cliente.setBairro(rs.getString("cli_bairro"));
				cliente.setEstado(rs.getString("cli_estado"));
				cliente.setNumero(rs.getString("cli_numero"));
				cliente.setMunicipio(rs.getString("cli_municipio"));
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

		return cliente;
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		return null;
	}

}
