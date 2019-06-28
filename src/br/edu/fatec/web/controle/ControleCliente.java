package br.edu.fatec.web.controle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.fatec.web.dao.ClienteDAO;
import br.edu.fatec.web.dao.UsuarioDAO;
import br.edu.fatec.web.modelo.Cliente;
import br.edu.fatec.web.modelo.Usuario;

@WebServlet("/ControleCliente")
public class ControleCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControleCliente() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("opcao").equals("buscar")) {
			Usuario usuario = (Usuario)request.getSession().getAttribute("usuarioAutenticado");
			UsuarioDAO usuarioDAO = new UsuarioDAO();
			Cliente cliente = (Cliente) usuarioDAO.consultarPorId(usuario);
			request.setAttribute("cliente", cliente);
			request.getRequestDispatcher("alterarCliente.jsp").forward(request,response);
		}else if(request.getParameter("opcao").equals("alterar")) {
			
			int id = Integer.parseInt(request.getParameter("txtId"));
			String nome = request.getParameter("txtNome");
			String email = request.getParameter("txtEmail");
			String cpf = request.getParameter("txtCpf");
			String cep = request.getParameter("txtCep");
			String logradouro = request.getParameter("txtLogradouro");
			String bairro = request.getParameter("txtBairro");
			String municipio = request.getParameter("txtMunicipio");
			String estado = request.getParameter("txtUf");
			String numero = request.getParameter("txtNumero");
			
			Cliente cliente = new Cliente(nome, email, cpf, cep, logradouro, bairro, municipio, estado, numero, null);
			cliente.setId(id);
			
			ClienteDAO clienteDAO = new ClienteDAO();
			clienteDAO.alterar(cliente);
			
			request.getRequestDispatcher("indexLogado.jsp").forward(request,response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("txtNome");
		String email = request.getParameter("txtEmail");
		String cpf = request.getParameter("txtCpf");
		String cep = request.getParameter("txtCep");
		String logradouro = request.getParameter("txtLogradouro");
		String bairro = request.getParameter("txtBairro");
		String municipio = request.getParameter("txtMunicipio");
		String estado = request.getParameter("txtUf");
		String numero = request.getParameter("txtNumero");
		String login = request.getParameter("txtEmail");
		String senha = request.getParameter("txtSenha");
		Usuario usuario = new Usuario(login, senha);
		
		Cliente cliente = new Cliente(nome, email, cpf, cep, logradouro, bairro, municipio, estado, numero, usuario);

		ClienteDAO clienteDao = new ClienteDAO();
		clienteDao.salvar(cliente);
		
		request.getRequestDispatcher("login.jsp").forward(request,response);
		
	}

}
