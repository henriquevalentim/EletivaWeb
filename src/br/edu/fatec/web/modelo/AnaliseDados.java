package br.edu.fatec.web.modelo;

import java.util.ArrayList;
import java.util.List;

public class AnaliseDados {

	private int qtdeCliente;
	private int qtdeProduto;
	private double lucroBrutoMensal;
	private double lucroBrutoAnual;
	private List<Integer> meses;
	private List<Produto> maisVendidos;
	
	public AnaliseDados() {
		super();
		this.meses = new ArrayList<Integer>();
		this.maisVendidos = new ArrayList<Produto>();
	}
	
	public List<Produto> getMaisVendidos() {
		return maisVendidos;
	}

	public void setMaisVendidos(List<Produto> maisVendidos) {
		this.maisVendidos = maisVendidos;
	}
	
	public double getLucroBrutoMensal() {
		return lucroBrutoMensal;
	}
	public void setLucroBrutoMensal(double lucroBrutoMensal) {
		this.lucroBrutoMensal = lucroBrutoMensal;
	}
	public double getLucroBrutoAnual() {
		return lucroBrutoAnual;
	}
	public List<Integer> getMeses() {
		return meses;
	}
	public void setMeses(List<Integer> meses) {
		this.meses = meses;
	}
	public void setLucroBrutoAnual(double lucroBrutoAnual) {
		this.lucroBrutoAnual = lucroBrutoAnual;
	}
	public int getQtdeCliente() {
		return qtdeCliente;
	}
	public void setQtdeCliente(int qtdeCliente) {
		this.qtdeCliente = qtdeCliente;
	}
	public int getQtdeProduto() {
		return qtdeProduto;
	}
	public void setQtdeProduto(int qtdeProduto) {
		this.qtdeProduto = qtdeProduto;
	}
	
}
