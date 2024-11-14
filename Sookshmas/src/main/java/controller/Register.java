package controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Registration;
import model.Student;

@WebServlet(name = "register", urlPatterns = {"/register"})
public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // type of the response sent to the client or browser
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Registration reg = new Registration(session);
        try {
            if (request.getParameter("register") != null) {

                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String pw = request.getParameter("pw");
                String cp = request.getParameter("cp");

                if (pw.equals(cp)) {
                    String status = reg.Registration(name, phone, email, pw);
                    
                    
                    if (status.equals("existed")) {

                        request.setAttribute("status", "Existed record");
                        RequestDispatcher rd1 = request.getRequestDispatcher("registration.jsp");
                        rd1.forward(request, response);

                    } else if (status.equals("success")) {
                        request.setAttribute("status", "Successfully Registered");
                        RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                        rd1.forward(request, response);

                    } else if (status.equals("failure")) {
                        request.setAttribute("status", "Registration failed");
                        RequestDispatcher rd1 = request.getRequestDispatcher("registration.jsp");
                        rd1.forward(request, response);

                    }
                }
            } else if (request.getParameter("login") != null) {
                String email = request.getParameter("email");
                String pass = request.getParameter("pw");
                String status = reg.login(email, pass);
                if (status.equals("success")) {

                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");

                    rd1.forward(request, response);

                } else if (status.equals("failure")) {
                    request.setAttribute("status", "Login failed");
                    RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                    rd1.forward(request, response);
                }
            } else if (request.getParameter("logout") != null) {
                session.invalidate();
                RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                rd1.forward(request, response);
            } 
            else if (session.getAttribute("uname") != null && request.getParameter("submit") != null) {
                String name = request.getParameter("name");
                String pno = request.getParameter("pno");
                String email = request.getParameter("email");
                Registration u = new Registration(session);
                String status = u.update(name, pno, email);
                if (status.equals("success")) {
                    request.setAttribute("status", "Profile successfully Updated");
                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request, response);
                } else {
                    request.setAttribute("status", "Updation failure");
                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request, response);
                }
            }
         // Forgot Password ----------------------
            else if (request.getParameter("forgotPass") != null) {
                String mail = request.getParameter("email");
                String pw = request.getParameter("pw");
                String cp = request.getParameter("cpw");
                if (pw.equals(cp)) {
                    String status = reg.ForgotPassword(mail, pw);
                    if (status.equals("success")) {
                        request.setAttribute("status", "Password Reset Successfully");
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);
                    } else if (status.equals("failure")) {
                        request.setAttribute("status", "Password Reset Failed");
                        RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
                        rd.forward(request, response);
                    }
                } else {
                    request.setAttribute("status", "Password mismatch");
                    RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
                    rd.forward(request, response);
                }
                
            }
            else if (request.getParameter("reset") != null) {
                String eamil = request.getParameter("email");
                String opw = request.getParameter("opw");
                String npw = request.getParameter("npw");
                if (opw.equals(npw)) {

                    String s = reg.getPassword(eamil, opw);
                    //System.out.println("Hi");
                    if (s.equals("success") && (opw.equals(npw))) {
                        //if (opw.equals(npw)) {
                        request.setAttribute("status", "New Passwordis same as old Password");
                        RequestDispatcher rd = request.getRequestDispatcher("changePass.jsp");
                        rd.forward(request, response);
                        //} 
                    }
                } else {
                    System.out.println("Inside reset");
                    String status = reg.resetPassword(eamil, npw);
                    System.out.println(status);
                     if (status.equals("success")) 
                        request.setAttribute("status", "Password changed successfully");
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);
//                             } else  {
//                                 request.setAttribute("status", "Both Are same ");
//                                 RequestDispatcher rd = request.getRequestDispatcher("changePass.jsp");
//                                 rd.forward(request, response);
//                             }
                }
             
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

   
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
