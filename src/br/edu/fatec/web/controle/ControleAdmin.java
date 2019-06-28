package br.edu.fatec.web.controle;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.fatec.web.dao.ProdutoDAO;
import br.edu.fatec.web.modelo.Produto;

@WebServlet("/ControleAdmin")
public class ControleAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControleAdmin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession sessao = request.getSession();
		if (request.getParameter("opcao").equals("listar")) {

			ProdutoDAO produtoDAO = new ProdutoDAO();

			ArrayList<Produto> produtosADM = (ArrayList<Produto>) produtoDAO.listar();

			sessao.setAttribute("produtosADM", produtosADM);

			request.getRequestDispatcher("listarProdutos.jsp").forward(request, response);
		} else if (request.getParameter("opcao").equals("excluir")) {

			Produto produto = new Produto();
			produto.setId(Integer.parseInt(request.getParameter("id")));

			ProdutoDAO produtoDAO = new ProdutoDAO();
			produtoDAO.excluir(produto);

			request.getRequestDispatcher("ControleAdmin?opcao=listar").forward(request, response);
			
		} else if (request.getParameter("opcao").equals("buscar")) {

			Produto produto = new Produto();
			produto.setId(Integer.parseInt(request.getParameter("id")));

			ProdutoDAO produtoDAO = new ProdutoDAO();
			Produto p = (Produto)produtoDAO.consultarPorId(produto);
			
			sessao.setAttribute("alterar", p);

			request.getRequestDispatcher("alterarProduto.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession sessao = request.getSession();
		if (request.getParameter("opcao").equals("listar")) {

			ProdutoDAO produtoDAO = new ProdutoDAO();

			ArrayList<Produto> produtosADM = (ArrayList<Produto>) produtoDAO.listar();

			sessao.setAttribute("produtosADM", produtosADM);

			request.getRequestDispatcher("listarProdutos.jsp").forward(request, response);
		}
	}

}
