/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gestions;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ilyas
 */
@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter();){
            String Userid = request.getParameter("uid");
            String Password = request.getParameter("pass");
            Connection conn = DCM.getConnection();
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("Select * from Client where nomcp = '"+Userid+"' and password='"+Password+"'");
            
            if (rs.next()){
                out.println("<div style='width: 300px;\n" +
                            "    background-color: #cccccc;\n" +
                            "    border-radius: 10px;\n" +
                            "    text-align: center;\n" +
                            "    padding: 20px;\n" +
                            "    margin: 80px auto; font-family: sans-serif;'>"
                        + "<center><h2 >👋 Hello, "+Userid+"</h2></center>"
                                + "</div>");
            } else {
                out.println("<div style='width: 300px;\n" +
                            "    background-color: #ff8080;\n" +
                            "    border-radius: 10px;\n" +
                            "    text-align: center;\n" +
                            "    padding: 20px;\n" +
                            "    margin: 80px auto 10px auto; font-family: sans-serif;'>"
                        + "<center><h2 >Wrong Username/Password ⁉</h2></center>"
                                + "</div>"
                        + "<a href='LoginClient.jsp' style='text-decoration: none; color:black;'><div style='width: 300px;\n" +
                            "    background-color: #99b3ff;\n" +
                            "    border-radius: 10px;\n" +
                            "    text-align: center;\n" +
                            "    padding: 20px;\n" +
                            "    margin: 10px auto; font-family: sans-serif;"
                        + "'>🔄 Retry</div></a>"
                        + "<a href='RegisterClient.jsp' style='text-decoration: none; color:black;'><div style='width: 300px;\n" +
                            "    background-color: #99b3ff;\n" +
                            "    border-radius: 10px;\n" +
                            "    text-align: center;\n" +
                            "    padding: 20px;\n" +
                            "    margin: 10px auto; font-family: sans-serif;"
                        + "text-decoration: none;'>Create new account</div></a>");
            }
        } catch (SQLException ex){
            out.println("Error: "+ex.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
