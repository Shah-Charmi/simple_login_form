 package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.User;
import com.util.Dbconnection;

public class UserDao {
	public static void insertData(User u) {
		try {
			Connection conn = Dbconnection.createConnection();
			String sql="insert into data(image,fname,lname,contact,email,password,hobbies,country,gender) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, u.getImage());
			pst.setString(2, u.getFname());
			pst.setString(3, u.getLname());
			pst.setString(4, u.getContact());
			pst.setString(5, u.getEmail());
			pst.setString(6, u.getPassword());
			pst.setString(7, u.getHobbies());
			pst.setString(8, u.getCountry());
			pst.setString(9, u.getGender());
			
			pst.executeUpdate();
			System.out.println("data inserted");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public static User checkLogin(User u)
	{
		User u1=null;
		try {
			Connection conn=Dbconnection.createConnection();
			String sql="select * from data where email=? and password=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, u.getEmail());
			pst.setString(2, u.getPassword());
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				u1=new User();
				u1.setId(rs.getInt("id"));
				u1.setImage(rs.getString("image"));
				u1.setFname(rs.getString("fname"));
				u1.setLname(rs.getString("lname"));
				u1.setContact(rs.getString("contact"));
				u1.setEmail(rs.getString("email"));
				u1.setPassword(rs.getString("password"));
				
				
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return u1;
	}
	public static List<User> getallUsers()
	{
		ArrayList<User> list=new ArrayList<User>();
		try {
			Connection conn = Dbconnection.createConnection();
			String sql="select * from data";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				User u=new User();
				u.setId(rs.getInt("id"));
				u.setImage(rs.getString("image"));
				u.setFname(rs.getString("fname"));
				u.setLname(rs.getString("lname"));
				u.setContact(rs.getString("contact"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setHobbies(rs.getString("hobbies"));
				u.setCountry(rs.getString("country"));
				u.setGender(rs.getString("gender"));
				
				
				list.add(u);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	public static User getUser(int id)
	{
		User u=null;
		try {
			Connection conn = Dbconnection.createConnection();
			String sql="select * from data where id=?";
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
			 u=new User();
			 u.setId(rs.getInt("id"));
			 u.setFname(rs.getString("fname"));
				u.setLname(rs.getString("lname"));
				u.setContact(rs.getString("contact"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setHobbies(rs.getString("hobbies"));
				u.setCountry(rs.getString("country"));
				u.setGender(rs.getString("gender"));
				
				
			 
				
			}
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return u;
	}
	public static void updateUser(User u) {
		try {
			Connection conn = Dbconnection.createConnection();
			String sql="update data set fname=?,lname=?,contact=?,email=?,password=?,hobbies=?,country=?,gender=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, u.getFname());
			pst.setString(2, u.getLname());
			pst.setString(3, u.getContact());
			pst.setString(4, u.getEmail());
			pst.setString(5, u.getPassword());
			pst.setString(7, u.getHobbies());
			pst.setString(8, u.getCountry());
			pst.setString(9, u.getGender());
			
			
			pst.setInt(10, u.getId());
			pst.executeUpdate();
			System.out.println("data updated");
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}
		public static void deleteUser(int id) {
			try {
				Connection conn = Dbconnection.createConnection();
				String sql="delete from data where id=?";
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setInt(1, id);
				pst.executeUpdate();
				System.out.println("data deleted");
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	}


