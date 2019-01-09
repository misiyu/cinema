package com.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.SystemUser;
import com.entity.User;
import com.support.StringExtend;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String email = request.getParameter("user[email]");
		String password = request.getParameter("user[password]");
		System.out.println(email);
		System.out.println(password);

		User user = new User(email, password);
		System.out.println(session.getAttribute("login")+"-----------");
		//if(session.getAttribute("login"))
		if (user.login()) {
			// 如果用户名正确
			// 客户端跳转

			request.getSession().setAttribute("userid4", user.getID());
			// System.out.println();
			if (user.isIsroot()) {
				session.setAttribute("login","admin");
				response.sendRedirect("usermain.jsp");

			} else{
				session.setAttribute("login","user");
				response.sendRedirect("movieChoose.jsp");
			}
		} else {
			// 服务器跳转
			request.setAttribute("error", "用户名或密码错误!");
			request.getRequestDispatcher("sign.jsp").forward(request, response);
			return;
		}
	}

}
