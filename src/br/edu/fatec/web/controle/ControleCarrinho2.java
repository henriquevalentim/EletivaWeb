package br.edu.fatec.web.controle;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.fatec.web.dao.ItensVendaDAO;
import br.edu.fatec.web.dao.ProdutoDAO;
import br.edu.fatec.web.dao.VendaDAO;
import br.edu.fatec.web.modelo.Produto;
import br.edu.fatec.web.modelo.Usuario;
import br.edu.fatec.web.modelo.Venda;

@WebServlet("/ControleCarrinho2")
public class ControleCarrinho2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControleCarrinho2() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = 0;
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
		}
		HttpSession sessao = request.getSession();
		ArrayList<Integer> carrinho = null;
		carrinho = (ArrayList<Integer>) sessao.getAttribute("carrinho");
		ProdutoDAO produtoDAO = new ProdutoDAO();
		ArrayList<Produto> carrinhoProdutos = new ArrayList<Produto>();
		String opcao = request.getParameter("opcao");

		if (opcao != null) {
			if (request.getParameter("opcao").equals("excluir")) {
				for (int i = 0; i < carrinho.size(); i++) {
					if (carrinho.get(i).equals(id)) {
						carrinho.remove(i);
						break;
					}
				}
				if (carrinho.size() > 0) {
					carrinhoProdutos = (ArrayList<Produto>) produtoDAO.consultarPorIDs(carrinho);
				} else {
					carrinhoProdutos = new ArrayList<Produto>();
				}
				sessao.setAttribute("carrinhoProd", carrinhoProdutos);
				request.getRequestDispatcher("carrinhoCompraLogado.jsp").forward(request, response);

			} else if (request.getParameter("opcao").equals("add")) {

				if (carrinho != null) {
					carrinho.add(id);
					sessao.setAttribute("carrinho", carrinho);

					carrinhoProdutos = (ArrayList<Produto>) produtoDAO.consultarPorIDs(carrinho);
					sessao.setAttribute("carrinhoProd", carrinhoProdutos);
					request.getRequestDispatcher("carrinhoCompraLogado.jsp").forward(request, response);
				} else {
					carrinho = new ArrayList<Integer>();
					carrinho.add(id);
					sessao.setAttribute("carrinho", carrinho);

					carrinhoProdutos = (ArrayList<Produto>) produtoDAO.consultarPorIDs(carrinho);
					sessao.setAttribute("carrinhoProd", carrinhoProdutos);
					request.getRequestDispatcher("carrinhoCompraLogado.jsp").forward(request, response);
				}
			} else if (request.getParameter("opcao").equals("salvar")) {

				carrinhoProdutos = (ArrayList<Produto>) produtoDAO.consultarPorIDs(carrinho);
				Usuario usuario = (Usuario) sessao.getAttribute("usuarioAutenticado");
				Venda venda = new Venda();
				venda.setCarrinho(carrinhoProdutos);
				venda.setUsuario(usuario);
				double total = 0;
				for (int i = 0; i < venda.getCarrinho().size(); i++) {
					total += venda.getCarrinho().get(i).getPrecoVenda();
				}
				venda.setTotal(total);
				ItensVendaDAO vendaDAO = new ItensVendaDAO();
				vendaDAO.salvarLista(venda);
				sessao.removeAttribute("carrinho");
				sessao.removeAttribute("carrinhoProd");
				request.getRequestDispatcher("indexLogado.jsp").forward(request, response);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
