package com.hotelmate.admin.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AdminAuthFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        boolean isLoggedIn = (session != null && session.getAttribute("adminUser") != null);
        String loginURI = httpRequest.getContextPath() + "/admin/login";
        boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);
        
        if (isLoggedIn || isLoginRequest) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendRedirect(loginURI);
        }
    }
}