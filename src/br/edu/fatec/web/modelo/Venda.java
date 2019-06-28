package br.edu.fatec.web.modelo;

import java.util.ArrayList;

public class Venda extends EntidadeDominio{

	private double total;
	private ArrayList<Produto> carrinho;
	private Usuario usuario;
	
	public double getTotal() {
		return total;
	}

	public void setTotal(double total2) {
		this.total = total2;
	}

	public ArrayList<Produto> getCarrinho() {
		return carrinho;
	}

	public void setCarrinho(ArrayList<Produto> carrinho) {
		this.carrinho = carrinho;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Venda() {
		super();
	}

	
	
	
}
