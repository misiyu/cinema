package com.movie;

import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.MovieAction;
import com.entity.Movie;

/**
 * Servlet implementation class SearchMovServlet
 */
@WebServlet("/Movie/SearchMovServlet")
public class SearchMovServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SearchMovServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String area= request.getParameter("area");
		String moviename= request.getParameter("moviename");
		String type= request.getParameter("type");
		
		String score1= request.getParameter("score1");
		String score2= request.getParameter("score2");
		String contentype= request.getParameter("contentype");
		/*
		if(score1!=null && !score1.equals("")){
			int score1int=Integer.parseInt(score1);
		}
		if(score2!=null && !score2.equals("")){
			int score2int=Integer.parseInt(score2);
		}
		*/
		
		
		//String = request.getParameter("");
		
		System.out.println("area:"+area+"moviename:"+moviename+"type:"+type+":"+score1+":"+score2+":"+contentype);
		MovieAction dbuserAcess= new MovieAction();
		List list = dbuserAcess.findAllmovBymultCon(area,moviename,type,score1, score2,contentype);
		request.setAttribute("list", list);
		System.out.println("Search--Size:"+list.size());
		for (int i = 0; i < list.size(); i++) {
			Movie mov=  (Movie) list.get(i);
			System.out.println(mov.getMovieName());
			
		}
		request.getRequestDispatcher("movieList.jsp").forward(request, response);
		
		
		
		
	}

}
