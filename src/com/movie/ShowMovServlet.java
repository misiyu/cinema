package com.movie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.MovieAction;
import com.entity.Movie;



@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/ShowMovServlet", 
				"/Movie/ShowMovServlet"
		})
public class ShowMovServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ShowMovServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Show detail info--------");
		request.setCharacterEncoding("UTF-8");
		//PrintWriter out=response.getWriter();
		response.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		MovieAction dbAcess = new MovieAction();
		Movie movie =  dbAcess.findMovById(userId);
		request.setAttribute("movie", movie);
		System.out.println(movie.getMovieName());
		request.getRequestDispatcher("/Movie/movieShow.jsp").forward(request, response);
		
	}

}
