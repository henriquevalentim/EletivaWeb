package br.edu.fatec.web.filtro;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import br.edu.fatec.web.dao.ProdutoDAO;
import br.edu.fatec.web.modelo.EntidadeDominio;
import br.edu.fatec.web.modelo.Produto;

@WebFilter(urlPatterns = {"/index.jsp"})
public class IndexProduto implements Filter {

    public IndexProduto() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		ArrayList<EntidadeDominio> produtos = null;
		produtos = (ArrayList<EntidadeDominio>) request.getAttribute("todosProdutos");
		if(produtos == null) {
			ProdutoDAO produtoDAO = new ProdutoDAO();
			List<Produto> entidades = (List<Produto>) produtoDAO.listar();
			HttpServletRequest httpServletRequest = (HttpServletRequest)request;
			
			
			request.setAttribute("todosProdutos", entidades);			
		}
		
		chain.doFilter(request, response);
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
