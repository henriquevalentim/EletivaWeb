package br.edu.fatec.web.modelo;

public class Cliente extends EntidadeDominio{

	private String nome;
	private String email;
	private String cpf;
	private String cep;
	private String logradouro;
	private String bairro;
	private String municipio;
	private Usuario usuario;
	
	public Cliente() {
		super();
	}

	public Cliente(String nome, String email, String cpf, String cep, String logradouro, String bairro,
			String municipio, String estado, String numero,Usuario usuario) {
		super();
		this.nome = nome;
		this.email = email;
		this.cpf = cpf;
		this.cep = cep;
		this.logradouro = logradouro;
		this.bairro = bairro;
		this.municipio = municipio;
		this.estado = estado;
		this.numero = numero;
		this.usuario = usuario;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getMunicipio() {
		return municipio;
	}
	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}
	private String estado;
	private String numero;
	
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	
	
	
}
