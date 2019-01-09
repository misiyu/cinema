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


@WebServlet("/Admin/DelUserServlet")
public class DelUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DelUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userId=request.getParameter("userId");
		System.out.println("DelUser id :"+userId);
		UserAction dbAcess = new UserAction();
		
		if(dbAcess.delUser(userId))
		{
			System.out.println("É¾³ý³É¹¦");
			session.setAttribute("message", "É¾³ý³É¹¦");
		  	
		}
		else{
			System.out.println("É¾³ýÊ§°Ü");
			session.setAttribute("message", "É¾³ýÊ§°Ü");
		}
		request.getRequestDispatcher("listAlluserServlet").forward(request, response);
		
		
	}

}
