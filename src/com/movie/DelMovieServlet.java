package com.movie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.MovieAction;




@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/DelMovieServlet", 
				"/Movie/DelMovieServlet"
		})
public class DelMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DelMovieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userId=request.getParameter("userId");
		
		MovieAction dbAcess = new MovieAction();
		
		if(dbAcess.delmovie(userId))
		{
			session.setAttribute("message", "É¾³ý³É¹¦");
		  	
		}
		else{
			session.setAttribute("message", "É¾³ýÊ§°Ü");
		}
		request.getRequestDispatcher("ListAllmovieServlet").forward(request, response);
		
	}

}
