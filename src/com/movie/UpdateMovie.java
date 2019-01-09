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
 * Servlet implementation class UpdateMovie
 */


@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/UpdateMovie", 
				"/Movie/UpdateMovie"
		})
public class UpdateMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateMovie() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In update Information of movie"+request.getParameter("id"));
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userid=request.getParameter("user_id");
		
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
		System.out.println(id+":"+movname+":"+director +":"+origins +":"+ actorset+":" +":"+score +":"+ date+":"+time +":"+ language+":"+ money+":"+ introduction+":");
		System.out.println("---------------------");
		try {
			if(id!=null)
			movie.setiD(Integer.parseInt(id));
			movie.setMovieName(movname);
			movie.setDirector(director);
			movie.setOrigins(origins);
			movie.setActor_sum(actorset);
			if(Dstyle!=null)
			movie.setD_type(Integer.parseInt(Dstyle));
			if(score!=null)
			movie.setScore(Double.parseDouble(score)); 
			movie.setRelease_date(date);
			movie.setTime(time);
			movie.setLanguage(language);
			if(money!=null)
			movie.setMoney(Double.parseDouble(money));
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", "addMovie Fail");
			request.getRequestDispatcher("ListAllmovieServlet").forward(request, response);
		}
		
		MovieAction dbAcess = new MovieAction();
		if(dbAcess.updateMovie(movie)){
			session.setAttribute("message", "Update Success"); 
		}
		else {
			session.setAttribute("message", "Update False"); 
		}
		
		request.getRequestDispatcher("ListAllmovieServlet").forward(request, response);
	}

}
