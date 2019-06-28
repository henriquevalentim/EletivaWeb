package br.edu.fatec.web.test;

import java.util.ArrayList;

import br.edu.fatec.web.dao.ProdutoDAO;
import br.edu.fatec.web.modelo.Produto;

public class TestarCarrinhoCompra {

	public static void main(String[] args) {

		ProdutoDAO produtoDAO = new ProdutoDAO();
		
		ArrayList<Integer> carrinhoIds = new ArrayList<Integer>();
		carrinhoIds.add(10);
		carrinhoIds.add(5);
		carrinhoIds.add(7);
		carrinhoIds.add(6);
		carrinhoIds.add(8);
		
		ArrayList<Produto> produtosCarrinho = null;
		produtosCarrinho = (ArrayList<Produto>) produtoDAO.consultarPorIDs(carrinhoIds);
		
		for(int i = 0;i < produtosCarrinho.size();i++) {
			System.out.println(produtosCarrinho.get(i).getNome());
		}
		
	}

}
