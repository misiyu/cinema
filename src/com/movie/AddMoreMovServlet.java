package com.movie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.MovieAction;
import com.entity.Movie;


/**
 * Servlet implementation class AddMoreMovServlet
 */

@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/AddMoreMovServlet", 
				"/Movie/AddMoreMovServlet"
		})
public class AddMoreMovServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddMoreMovServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		MovieAction action = new MovieAction();
		//js 鍒ゆ柇
		Movie movie = new Movie();
		
		String id = request.getParameter("id");
		String  movname= request.getParameter("movname");
		String  director= request.getParameter("director");
		String  origins= request.getParameter("origins");
		String  actorset= request.getParameter("actorset");
		String  Dstyle= request.getParameter("Dstyle");
		
		String  score= request.getParameter("score");
		String  date= request.getParameter("date");
		String  time= request.getParameter("time");
		String  language= request.getParameter("language");
		String  money= request.getParameter("money");
		String  introduction= request.getParameter("introduction");
		//String  = request.getParameter("");
		System.out.println(id+":"+movname+":"+director +":"+origins +":"+ actorset+":"+Dstyle +":"+score +":"+ date+":"+time +":"+ language+":"+ money+":"+ introduction+":");
		try {
			movie.setiD(Integer.parseInt(id));
			movie.setMovieName(movname);
			movie.setDirector(director);
			movie.setOrigins(origins);
			movie.setActor_sum(actorset);
			if(Dstyle!=null&&!Dstyle.equals(""))
				movie.setD_type(Integer.parseInt(Dstyle));
			if(score!=null&&!score.equals(""))
			movie.setScore(Double.parseDouble(score)); 
			movie.setRelease_date(date);
			movie.setTime(time);
			movie.setLanguage(language);
			if(money!=null&&!money.equals(""))
				movie.setMoney(Double.parseDouble(money));
			if(introduction!=null){
				movie.setIntroduction(introduction);
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", "addMovie Fail");
			request.getRequestDispatcher("ListAllmovieServlet").forward(request, response);
		}
		
		
		if(action.addMovie(movie)==true)
		 {
			 session.setAttribute("message", "addMovie Success");
			 request.getRequestDispatcher("ListAllmovieServlet").forward(request, response);
			
		 }
		 else{
			 session.setAttribute("message", "addMovie Fail");
			request.getRequestDispatcher("ListAllmovieServlet").forward(request, response);
		 }
		
		
		
		
	}

}
