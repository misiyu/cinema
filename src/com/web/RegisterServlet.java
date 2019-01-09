package com.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userName=request.getParameter("user[firstname]");
		String email = request.getParameter("user[email]");
		String password = request.getParameter("user[password]");
		if(userName==null||email==null||password==null){
			request.getRequestDispatcher("sign.html").forward(request, response);
			return;
		}
		System.out.println("register servlet "+userName);
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String registerTime = dateFormat.format( now ); 
		User user = new User(userName, email, password, registerTime, false);
		if(user.hasRegistered()){
			//request.setAttribute("registererror", "该邮箱已经注册过了");
			//request.getRequestDispatcher("sign.jsp").forward(request, response);
			request.setAttribute("registerResult", "该邮箱已经注册过了");
			request.getRequestDispatcher("sign.jsp").forward(request, response);
			return;
		}
		else {
			user.register();
			request.setAttribute("registerResult", "注册成功");
			session.setAttribute("message", "注册成功成功，输入信息来登录");
			request.getRequestDispatcher("sign.jsp").forward(request, response);
		}
	}
}
