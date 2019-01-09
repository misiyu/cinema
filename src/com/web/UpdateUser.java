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
 * Servlet implementation class UpdateTeacher
 */
@WebServlet("/Admin/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//System.out.println("HAHAHAHA");
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userid=request.getParameter("user_id");
		
		//String username=request.getParameter("user_name");
		//String userpwd=request.getParameter("user_pwd");
		//String usertime=request.getParameter("user_time");
		
		
		UserAction dbAcess = new UserAction();
		
		User user = dbAcess.findUserById(userid);
		//System.out.println("Update Name is----"+request.getParameter("user_name"));
		user.setUserName(request.getParameter("user_name"));
		user.setPassword(request.getParameter("user_pwd"));
		if(request.getParameter("userGrade")!=null&&!request.getParameter("userGrade").equals(""))
			user.setGrade(request.getParameter("userGrade").charAt(0)); 
		user.setEmail(request.getParameter("userEmail"));
		if(request.getParameter("userMoney")!=null&&!request.getParameter("userMoney").equals(""))
			user.setMoney(Double.parseDouble(request.getParameter("userMoney")));
		int admin=0;
		if(request.getParameter("isAdmin").equals("User"))
			admin=0;
		else if(request.getParameter("isAdmin").equals("Admin"))
			admin=1;
		
		user.setSystemAdmin(admin);
			//request.getParameter("")
		if(dbAcess.updateUser(user))
			session.setAttribute("message", "UpDate Success"); 
		else
			session.setAttribute("message", "UpDate Fail"); 
		
		request.getRequestDispatcher("listAlluserServlet").forward(request, response);
				
				
		
		
	}

}
