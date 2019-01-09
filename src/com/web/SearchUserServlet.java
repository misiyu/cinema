package com.web;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.UserAction;
import com.entity.User;

/**
 * Servlet implementation class SearchUserServlet
 */
@WebServlet("/Admin/SearchUserServlet")
public class SearchUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
        public SearchUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		String signid =request.getParameter("signid");
	
		
		
		 
		//String signid = request.getParameter("signid");
		
		String signname = request.getParameter("signname");
		//Integer 
		
		Integer type=null;
		System.out.println("---"+request.getParameter("type")+"---");
		if(request.getParameter("type")!=null && !request.getParameter("type").equals("")){
			type= new Integer(request.getParameter("type"));
		}
		String dollar = request.getParameter("dollar");
		
		
		String grade = request.getParameter("grade");
		System.out.println("id:"+signid+"name:"+signname+"type:"+type);
		UserAction dbuserAcess= new UserAction();
		List list = dbuserAcess.findAlluserBymultCon(signid,signname,type,dollar, grade);
		request.setAttribute("list", list);
		System.out.println("Search--Size:"+list.size());
		for (int i = 0; i < list.size(); i++) {
			User user=  (User) list.get(i);
			System.out.println(user.getUserName());
			System.out.println("Admin num is :"+user.isSystemAdmin());
		}
		request.getRequestDispatcher("userList.jsp").forward(request, response);
		
		
	}

}
