package br.edu.fatec.web.controle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.fatec.web.dao.AnaliseDAO;
import br.edu.fatec.web.dao.ProdutoDAO;
import br.edu.fatec.web.dao.UsuarioDAO;
import br.edu.fatec.web.modelo.AnaliseDados;
import br.edu.fatec.web.modelo.EntidadeDominio;
import br.edu.fatec.web.modelo.Produto;
import br.edu.fatec.web.modelo.Usuario;

@WebServlet("/Autenticacao")
public class Autenticacao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Autenticacao() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String login = request.getParameter("txtLogin");
		String senha = request.getParameter("txtSenha");

		Usuario usuario = new Usuario();
		usuario.setLogin(login);
		usuario.setSenha(senha);

		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario usuarioAutenticado = null;
		usuarioAutenticado = (Usuario) usuarioDAO.autenticar(usuario);
		ProdutoDAO produtoDAO = new ProdutoDAO();

		List<Produto> entidades = (List<Produto>) produtoDAO.listar();

		HttpSession sessao = request.getSession();
		sessao.setAttribute("todosProdutos", entidades);

		if (usuarioAutenticado != null && usuarioAutenticado.getNivelAcesso() == 0) {
			sessao.setAttribute("usuarioAutenticado", usuarioAutenticado);
			request.getRequestDispatcher("indexLogado.jsp").forward(request, response);

		} else if (usuarioAutenticado != null && usuarioAutenticado.getNivelAcesso() == 1) {
			sessao.setAttribute("usuarioAutenticado", usuarioAutenticado);
			
			AnaliseDAO analiseDAO = new AnaliseDAO();
			AnaliseDados analise = new AnaliseDados();
			analise.setQtdeCliente(analiseDAO.contarClientes());
			analise.setQtdeProduto(analiseDAO.contarProdutos());
			analise.setLucroBrutoMensal(analiseDAO.lucroBrutoMensal());
			analise.setLucroBrutoAnual(analiseDAO.lucroBrutoAnual());
			analise.setMeses(analiseDAO.qtdeVendasPorMes());
			analise.setMaisVendidos(analiseDAO.maisVendidos());
			
			sessao.setAttribute("analise", analise);
			
			request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);

		} else {
			response.sendRedirect("login.jsp");

		}

	}

}
