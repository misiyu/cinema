package com.web;

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

import com.database.UserAction;
import com.support.Page;


/**
 * Servlet implementation class ListAlluserServlet
 */


@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/listAlluserServlet", 
				"/Admin/listAlluserServlet"
		})

public class ListAlluserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		/*
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.write("silence");
		out.flush();
		out.close();
		System.out.println("Success");
		*/
		System.out.println("It is Get methord");
		request.setCharacterEncoding("UTF-8");
		doPost(request, response);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		UserAction dbuserAcess= new UserAction();
		Map map = dbuserAcess.findAlluser(CurPage);
		
		LinkedList list=(LinkedList) map.get("list");
		Page page = (Page) map.get("pa");
		request.setAttribute("CurPage", page.getCurPage());//向显示页传递当前页页码
		request.setAttribute("pageCount", page.getPageCount());//sum of page
		request.setAttribute("list", list);
		System.out.println();
		request.getRequestDispatcher("/Admin/userList.jsp").forward(request, response);
		
		
		
	}

}
