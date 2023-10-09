package com.simplilearn.flyawayweb.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.simplilearn.flyawayweb.model.FlightSearch;
import com.simplilearn.flyawayweb.model.Passenger;

public class FlightSearchServlet extends HttpServlet {

	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException{
		
		res.setContentType("text/html");
		String travelDate= req.getParameter("travelDate");
		String source = req.getParameter("src");
		String destination = req.getParameter("dest");
		String totalCount = req.getParameter("totalCount");
		
		PrintWriter out = res.getWriter();
		
		if(travelDate != null && !travelDate.isEmpty() && 
				source != null && !source.isEmpty()
				&& destination != null && !destination.isEmpty()
				&& totalCount != null && !totalCount.isEmpty()){
			
			FlightSearch flightSearch = new FlightSearch(travelDate,source,
				destination, Integer.parseInt(totalCount));
			
			HttpSession session = req.getSession();
			List<Passenger> passengers = new ArrayList<Passenger>();
			session.setAttribute("flightSearch", flightSearch);
			session.setAttribute("count", 1);
			session.setAttribute("passengers", passengers);
			req.getRequestDispatcher("flightDetails.jsp").forward(req, res);
		}
		else{
			out.println("<h4 style='color:red;'>Fields's can't be empty!</h4>");
			req.getRequestDispatcher("flightSearch.jsp").include(req, res);
			
		}
		
		
	}
	
}
