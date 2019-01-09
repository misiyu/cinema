package com.movie;

import java.io.IOException;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.MovieAction;
import com.entity.Movie;

import com.support.Page;

/**
 * Servlet implementation class ListAllmovieServlet
 */

@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/ListAllmovieServlet", 
				"/Movie/ListAllmovieServlet"
		})
public class ListAllmovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ListAllmovieServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
		System.out.println("Get Methord");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In post");
		response.setContentType("text/html;charset=UTF-8");
		int CurPage = 1;
		String tmp=request.getParameter("CurPage");
		if(tmp!=null){
			System.out.println("Curpage been edited is :"+tmp);
			CurPage = Integer.parseInt(request.getParameter("CurPage"));
		}
		else{
			System.out.println("tmp is not null:"+tmp);
		}
		MovieAction dbuserAcess=new MovieAction();
		Map map = dbuserAcess.findAllmovie(CurPage);
		
		try {
			LinkedList list=(LinkedList) map.get("list");
			Page page = (Page) map.get("pa");
			request.setAttribute("CurPage", page.getCurPage());//閸氭垶妯夌粈娲�夋导鐘伙拷鎺戠秼閸撳秹銆夋い鐢电垳
			request.setAttribute("pageCount", page.getPageCount());//sum of page
			request.setAttribute("list", list);
			/*
			for( int i=0;i<list.size();i++){
				Movie tp = (Movie) list.get(i);
				System.out.println("Movieget"+tp.getMovieName()+":"+tp.getTime()+" ");
				
			}
			System.out.println();
			*/
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.getRequestDispatcher("/Movie/movieList.jsp").forward(request, response);
		System.out.println("List all MovieList finish~~");
		
	}

}
