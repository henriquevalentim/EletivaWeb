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

@WebServlet("/ControleProduto")
public class ControleProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControleProduto() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("opcao").equals("salvar")) {
			String nome = request.getParameter("txtNome");
			String descricao = request.getParameter("txtDescricao");
			double precoCompra = Double.parseDouble(request.getParameter("txtPrecoCompra"));
			double precoVenda = Double.parseDouble(request.getParameter("txtPrecoVenda"));
			String urlFoto = request.getParameter("txtUrlFoto");
			int categoria = Integer.parseInt(request.getParameter("txtCategoria"));

			Produto produto = new Produto(nome, descricao, precoCompra, precoVenda, urlFoto, categoria);

			ProdutoDAO produtoDAO = new ProdutoDAO();
			produtoDAO.salvar(produto);

			request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
		} else if (request.getParameter("opcao").equals("alterar")) {

			int id = Integer.parseInt(request.getParameter("txtId"));
			String nome = request.getParameter("txtNome");
			String descricao = request.getParameter("txtDescricao");
			double precoCompra = Double.parseDouble(request.getParameter("txtPrecoCompra"));
			double precoVenda = Double.parseDouble(request.getParameter("txtPrecoVenda"));
			String urlFoto = request.getParameter("txtUrlFoto");
			int categoria = Integer.parseInt(request.getParameter("txtCategoria"));
			System.out.println("passou aki");

			Produto produto = new Produto(nome, descricao, precoCompra, precoVenda, urlFoto, categoria);
			produto.setId(id);
			ProdutoDAO produtoDAO = new ProdutoDAO();
			produtoDAO.alterar(produto);
			
			request.getRequestDispatcher("ControleAdmin?opcao=listar").forward(request, response);
		}

	}

}
