package krushimart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update")
public class EditProfile extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String firstName = req.getParameter("firstname");
		String lastName= req.getParameter("lastname");
	    String email = req.getParameter("email");
		long phone = Long.parseLong(req.getParameter("phone_no"));
		String address = req.getParameter("address");
		
		HttpSession session = req.getSession();
		String dbEmail =(String) session.getAttribute("email");
		
        User user = new User() ;
		
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddress(address);
		
		UserCrud crud = new UserCrud();
		
		try {
			int count = crud.updateUser(user,dbEmail);
			if(count!=0)
			{
				session.setAttribute("email",email);
				
				PrintWriter writer =resp.getWriter();
				writer.println("<h1>Profile Updatetd Successfull</h1>");
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("Profile.jsp");
				dispatcher.include(req, resp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	

}
