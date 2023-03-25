package com.controller;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.UserDao;
import com.model.User;
@WebServlet("/ActionControl")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512, maxRequestSize = 1024 * 1024 * 512)
public class ActionControl extends HttpServlet {
	private String extractfilename(Part file) {
	    String cd = file.getHeader("content-disposition");
	    System.out.println(cd);
	    String[] items = cd.split(";");
	    for (String string : items) {
	        if (string.trim().startsWith("filename")) {
	            return string.substring(string.indexOf("=") + 2, string.length()-1);
	        }
	    }
	    return "";
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("register"))
		{
			String savePath = "C:\\Users\\Charmi Shah\\eclipse-workspace\\Advance_demo\\src\\main\\webapp\\image";   
			File fileSaveDir=new File(savePath);
	        if(!fileSaveDir.exists()){
	            fileSaveDir.mkdir();
	        }
	        Part file1 = request.getPart("image");
		 	String fileName=extractfilename(file1);
		    file1.write(savePath + File.separator + fileName);
		    String filePath= savePath + File.separator + fileName ;
		    
		    String savePath2 = "C:\\Users\\Charmi Shah\\eclipse-workspace\\Advance_demo\\src\\main\\webapp\\image";
	        File imgSaveDir=new File(savePath2);
	        if(!imgSaveDir.exists()){
	            imgSaveDir.mkdir();
	        }
	        
			User u=new User();
			u.setImage(fileName);
			u.setFname(request.getParameter("fname"));
			u.setLname(request.getParameter("lname"));
			u.setContact(request.getParameter("contact"));
			u.setEmail(request.getParameter("email"));
			u.setPassword(request.getParameter("password"));
			String Hobbies="";
			String[] val=request.getParameterValues("hobbies");
	        if(val!=null) {
	        	for(int i=0;i<val.length;i++) {
	        		Hobbies+=val[i]+",";
	        		u.setHobbies(Hobbies);
	        	}
	        	System.out.println(" ");
	        }
	        else {
	        	System.out.println("error");
	        }
	        String country="";
			String[] con=request.getParameterValues("countries");
	        if(con!=null) {
	        	for(int i=0;i<con.length;i++) {
	        		country+=con[i];
	        	   u.setCountry(country);
	        	}
	        	System.out.println(" ");
	        }
	        else {
	        	System.out.println("error");
	        }
	        String Gender="";
	        String[] gen=request.getParameterValues("gender");
	        if(gen!=null) {
	        	for(int i=0;i<gen.length;i++) {
	        		Gender+=gen[i];
	        		u.setGender(Gender);
	        	}
	        	System.out.println(" ");
	        }
	        else {
	        	System.out.println("error");
	        }
	       
	        
			System.out.println(request.getParameter("image"));
			System.out.println(request.getParameter("fname"));
			System.out.println(request.getParameter("lname"));
			System.out.println(request.getParameter("contact"));
			System.out.println(request.getParameter("email"));
			System.out.println(request.getParameter("password"));
			
			
			
			
		
			UserDao.insertData(u);
			response.sendRedirect("login.jsp");
			
		}
		if(action.equalsIgnoreCase("login"))
		{
			User u=new User();
			u.setEmail(request.getParameter("email"));
			u.setPassword(request.getParameter("password"));
			String email=request.getParameter("email");
			String pass=request.getParameter("password");
			User u1=UserDao.checkLogin(u);
			if(email.equals(null) || pass.equals(null))
			{
				request.setAttribute("msg", "all feilds are mandatory");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			else if(u1==null) {
				request.setAttribute("msg", "email or password incorrect");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			// u is the key and u1 is value given.
			else
			{
				HttpSession session=request.getSession();
				session.setAttribute("u", u1);
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}
		}
		if(action.equalsIgnoreCase("edit")) {
			int id = Integer.parseInt(request.getParameter("id"));
			User u =  UserDao.getUser(id);
			request.setAttribute("data", u);
			request.getRequestDispatcher("edit.jsp").forward(request, response);
		}
		if(action.equalsIgnoreCase("update")) {
			User u = new User();
			int id = Integer.parseInt(request.getParameter("id"));
			u.setId(id);
			u.setFname(request.getParameter("fname"));
			u.setLname(request.getParameter("lname"));
			u.setContact(request.getParameter("contact"));
			u.setEmail(request.getParameter("email"));
			u.setPassword(request.getParameter("password"));
		
			UserDao.updateUser(u);
			response.sendRedirect("home.jsp");
		}
		if(action.equalsIgnoreCase("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			UserDao.deleteUser(id);
			response.sendRedirect("home.jsp");
		}
		if(action.equalsIgnoreCase("logout")) {
			HttpSession session=request.getSession();
			session.getAttribute("u");
			session.invalidate();
			response.sendRedirect("login.jsp");
		}
		
		
	}

}
