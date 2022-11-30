package com.example.ejemplojakarta;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet(name = "prueba", value = "/prueba")
public class DataServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String username=req.getParameter("usuario");
        String pass = req.getParameter("password");
        String correo = req.getParameter("email");
        String pais= req.getParameter("pais");
        String[] lenguajes = req.getParameterValues("lenguajes");
        String[] roles = req.getParameterValues("roles");
        String idioma=req.getParameter("idioma");
        boolean habilitar = req.getParameter("habilitar")!=null && req.getParameter("habilitar").equals("on");
        String secreto= req.getParameter("secreto");

        Map<String , String> errores = new HashMap<>();

        if(username== null || username.equals("") || username.equals(" ")){
            errores.put("usuario","el usuario es requerido");
        }
        if(pass== null || pass.isBlank()){
            errores.put("password","el pasword es requerido");
        }
        if(correo== null || !correo.contains("@")){
            errores.put("email","el correo es requerido y debe tener el formato correcto");
        }
        if(pais== null || pais.equals("") || pais.equals(" ")){
            errores.put("pais","el pais  es requerido");
        }
        if(lenguajes== null || lenguajes.length == 0){
            errores.put("lenguajes","debe seleccionar un lenguaje");
        }
        if(roles== null || roles.length == 0){
            errores.put("roles","debe seleccionar un rol");
        }
        if(idioma== null){
            errores.put("idioma","debe seleccionar un idioma");
        }
        try(PrintWriter out = resp.getWriter()) {
            if(errores.size()!=0 || !errores.isEmpty()) {
               /* errores.forEach(error -> {
                    out.println("<li>" + error + "</li>");
                });
                out.println("<p><a hre=\"/appprueba/index.html\">VOLVER HOME</a></p>"); */

                req.setAttribute("errores",errores); /* pasamos datos de SERvlet al JSP*/
                req.getRequestDispatcher("/index.jsp").forward(req,resp);
            }else {
                out.println("<html><body>");
                out.println("<h1>RESULTADO FORM </h1>");
                out.println("<ul>");
                out.println("<li>" + username + "</li>");
                out.println("<li>" + pass + "</li>");
                out.println("<li>" + correo + "</li>");
                out.println("<li>" + pais + "</li>");
                out.println("<li>LENGUAJES<ul>");
                Arrays.asList(lenguajes).forEach(lenguaje -> {
                    out.println("<li>" + lenguaje + "</li>");
                });
                out.println("</ul></li>");
                /**/
                out.println("<li>ROLES<ul>");
                Arrays.asList(roles).forEach(rol -> {
                    out.println("<li>" + rol + "</li>");
                });
                out.println("</ul></li>");
                out.println("<li> IDIOMA " + idioma + "</li>");
                out.println("<li> HABILITADO" + habilitar + "</li>");
                out.println("<li> SECRETO" + secreto + "</li>");
                out.println("</ul>");
                out.println("</body></html>");
            }

        }
    }


}
