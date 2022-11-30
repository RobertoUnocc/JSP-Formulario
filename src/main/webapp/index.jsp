<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>

<%
    Map<String , String> erroresForm= (Map<String,String>) request.getAttribute("errores");
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>JSP</title>
</head>
<body class="container">
<h1><%= "Hello World!" %>
</h1>
<br/>
<h3>Formulario de usuarios</h3>

<% if(erroresForm.size()>0){%>
<% for (String error: erroresForm.values()){ %>
<div class="alert alert-danger"><%=error %></div>
<% } %>
<%}%>
<form action="prueba" method="post">
    <div class="row container">
    <div class="col-sm-6">
    <div class="row mb-3">
    <label for="usuario" class="col-form-label col-sm-2">USUARIO</label>
        <div class="col-sm-4">
            <input type="text"  class="form-control" name="usuario" id="usuario" value="${param.usuario}">
        </div>
     <%
         if(erroresForm != null  && erroresForm.containsKey("usuario")){
             out.println("<small style='color:red;'>"+erroresForm.get("usuario")+"</small>");
         }
     %>
    </div>
    </br>
    <div class="row mb-3">
    <label for="password" class="col-form-label col-sm-2">PASSWORD</label>
        <div class="col-sm-4"><input type="password" class="form-control" name="password" id="password" value="${param.password}">
        </div>
        <%
            if(erroresForm != null  && erroresForm.containsKey("password")){
                out.println("<small style='color:red;'>"+erroresForm.get("password")+"</small>");
            }
        %>
    </br>
    </div>
    <div class="row mb-3">
    <label for="email" class="col-form-label col-sm-2">EMAIL</label><div class="col-sm-4"><input type="email" class="form-control" name="email" id="email" value="${param.email}"></div>
        <%
            if(erroresForm != null  && erroresForm.containsKey("email")){
                out.println("<small style='color:red;'>"+erroresForm.get("email")+"</small>");
            }
        %>
    </div>

    <div class="row mb-3"><label for="pais" class="col-form-label col-sm-2">PAISES</label>
        <div class="col-sm-4"><select name="pais" id="pais" class="form-select">
            <option value="0">--SELECCIONAR--</option>
            <option value="1" ${param.pais.equals("1")?"selected":""}>Peru</option>
            <option value="2" ${param.pais.equals("2")?"selected":""}>Argentino</option>
            <option value="3" ${param.pais.equals("3")?"selected":""}>Brasil</option>
            <option value="4" ${param.pais.equals("4")?"selected":""}>España</option>
        </select></div>
        <%
            if(erroresForm != null  && erroresForm.containsKey("pais")){
                out.println("<small style='color:red;'>"+erroresForm.get("pais")+"</small>");
            }
        %>
    </div>

    <div class="row mb-3"><label for="lenguajes" class="col-form-label col-sm-2">Lenguajes de progración</label>
        <div class="col-sm-4"><select name="lenguajes" id="lenguajes" multiple class="form-select">
            <option value="0">--SELECCIONAR--</option>
            <option value="java" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("java")).get()?"selected":""}>Java</option>
            <option value="spring" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("spring")).get()?"selected":""}>Spring</option>
            <option value="js" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("js")).get()?"selected":""}>JavaScript</option>
            <option value="react" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("react")).get()?"selected":""}>React</option>
        </select></div>
        <%
            if(erroresForm != null  && erroresForm.containsKey("lenguajes")){
                out.println("<small style='color:red;'>"+erroresForm.get("lenguajes")+"</small>");
            }
        %>
    </div>
    </div>
    <div class="col-sm-6">
    <div class="row mb-3">
        <label class="col-form-label col-sm-2">Roles</label>
        <div class="col-sm-4">
        <div class="form-check">
            <input type="checkbox" name="roles" value="ROLE_ADMIN"
            ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_ADMIN")).get()?"checked":""}
            >
            <label>Administrador</label>
        </div>
        <div class="form-check">
            <input type="checkbox" name="roles" value="ROLE_USER"
            ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_USER")).get()?"checked":""}
            >
            <label>Usuario</label>
        </div>
        <div class="form-check">
            <input type="checkbox" name="roles" value="ROLE_MODERADOR"
            ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_MODERADOR")).get()?"checked":""}
            >
            <label>Moderador</label>
        </div>
        <%
            if(erroresForm != null  && erroresForm.containsKey("roles")){
                out.println("<small style='color:red;'>"+erroresForm.get("roles")+"</small>");
            }
        %>
        </div>
    </div>


    <div class="row mb-3">
        <label class="col-form-label col-sm-2">IDIOMA</label>
        <div class="col-sm-4">
        <div class="form-check">
            <input type="radio" name="idioma" value="es" ${param.idioma.equals("es")?"checked":""}>
            <label>Español</label>
        </div>
        <div class="form-check">
            <input type="radio" name="idioma" value="en" ${param.idioma.equals("en")?"checked":""}>
            <label>Ingles</label>
        </div>
        <div class="form-check">
            <input type="radio" name="idioma" value="fr" ${param.idioma.equals("fr")?"checked":""}>
            <label>Frances</label>
        </div>
        <%
            if(erroresForm != null  && erroresForm.containsKey("idioma")){
                out.println("<small style='color:red;'>"+erroresForm.get("idioma")+"</small>");
            }
        %>
        </div>
    </div>

    <div class="row mb-3">
        <label for="habilitar" class="col-form-label col-sm-2">Habilitar</label>
        <div class="col-sm-4">
            <input type="checkbox" name="habilitar" id="habilitar" checked>
        </div>
    </div>

    <div><input type="submit" value="ENVIAR" class="btn btn-primary"/> </div>
    </div>
    </div>
    <input type="hidden" name="secreto" value="123456">
</form>

</body>
</html>