package br.edu.fatec.web.filtro;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.fatec.web.modelo.Usuario;

@WebFilter(urlPatterns = { "/indexLogado.jsp", "/indexAdmin.jsp" })
public class Login implements Filter {

	public Login() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;

		HttpSession sessao = httpServletRequest.getSession();
		Usuario usuario = (Usuario)sessao.getAttribute("usuAutenticado");
		if (usuario != null) {
			chain.doFilter(request, response);
		} else {
			//falar com o luque???
			//perdendo a sessao e sempre entrando no else
			request.getRequestDispatcher("indexLogado.jsp").forward(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
