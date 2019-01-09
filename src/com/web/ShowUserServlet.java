package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.SysexMessage;

import com.database.DBConnection;
import com.database.UserAction;
import com.entity.User;

/**
 * Servlet implementation class ShowUserServlet
 */
@WebServlet("/Admin/ShowUserServlet")
public class ShowUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Show detail info--------");
		request.setCharacterEncoding("UTF-8");
		//PrintWriter out=response.getWriter();
		response.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		UserAction dbAcess = new UserAction();
		User user = dbAcess.findUserById(userId);
		request.setAttribute("user", user);
		System.out.println(user.getUserName());
		request.getRequestDispatcher("/Admin/userShow.jsp").forward(request, response);
		
	}

}
