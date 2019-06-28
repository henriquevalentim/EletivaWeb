package br.edu.fatec.web.test;

import br.edu.fatec.web.dao.ProdutoDAO;
import br.edu.fatec.web.modelo.Produto;

public class TestCadastrarProduto {
	public static void main(String[] args) {
		
		
		Produto produto = new Produto("Henrique", "eu sou lindo", 10.00, 11.00, "henrique/seilaoq", 1);
		
		ProdutoDAO produtoDAO = new ProdutoDAO();
		produtoDAO.salvar(produto);
	}
}
