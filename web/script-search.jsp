<%-- 
    Document   : script-search
    Created on : 16 avr. 2020, 00:07:50
    Author     : Ilyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String index = request.getParameter("index");
    response.sendRedirect("ListArticle.jsp?index="+index);
%>
