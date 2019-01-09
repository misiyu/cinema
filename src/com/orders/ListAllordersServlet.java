package com.orders;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.OrderAction;
import com.support.Page;




@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/ListAllordersServlet", 
				"/Admin/ListAllordersServlet",
				"/User/ListAllordersServlet"
		})


public class ListAllordersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ListAllordersServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out=response.getWriter();		
		int CurPage = 1;
		String tmp=request.getParameter("CurPage");
		if(tmp!=null){
			System.out.println("Curpage been edited is :"+tmp);
			CurPage = Integer.parseInt(request.getParameter("CurPage"));
		}
		else{
			System.out.println("tmp is not null:"+tmp);
		}
		
		
		OrderAction dbuserAcess= new OrderAction();
		Map map = dbuserAcess.findAllorder(CurPage);
		
		try {
			LinkedList list=(LinkedList) map.get("list");
			Page page = (Page) map.get("pa");
			request.setAttribute("CurPage", page.getCurPage());//鍚戞樉绀洪〉浼犻�掑綋鍓嶉〉椤电爜
			request.setAttribute("pageCount", page.getPageCount());//sum of page
			request.setAttribute("list", list);
			System.out.println();
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.getRequestDispatcher("/Admin/orderList.jsp").forward(request, response);
		
		
		
	}

}
