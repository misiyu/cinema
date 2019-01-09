package com.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.UserAction;
import com.entity.User;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/Admin/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id= request.getParameter("user_id");
		String user_name=request.getParameter("user_name");
		String email=request.getParameter("userEmail");
		String money= request.getParameter("userMoney");
		String  grade= request.getParameter("grade");
		
		
		UserAction action = new UserAction();
		User user = new User();
		user.setID(Integer.parseInt(id));
		user.setUserName(user_name);
		user.setEmail(email);
		user.setPassword(request.getParameter("user_pwd"));
		if(request.getParameter("grade")!=null)
			user.setGrade(request.getParameter("grade").charAt(0));
		if(money!=null && !money.equals("")){
			System.out.println("Money is:"+money);
			user.setMoney(Double.parseDouble(money));
		}
		else{
			System.out.println("Money none");
		}
			
		
		
		 if(action.addUser(user)==true)
		 {
			 session.setAttribute("message", "添加注册人员成功");
			 request.getRequestDispatcher("listAlluserServlet").forward(request, response);
			
		 }
		 else{
			 session.setAttribute("message", "所要添加失败！");
			request.getRequestDispatcher("listAlluserServlet").forward(request, response);
		 }
		
		
		
		
		
		
	}

}
