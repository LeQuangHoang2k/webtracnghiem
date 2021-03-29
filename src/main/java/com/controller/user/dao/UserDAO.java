package com.controller.user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.controller.user.model.User;

public class UserDAO {
	private final String jdbcURL = "jdbc:mysql://localhost:3306/webtracnghiem?useSSL=false";
	private final String jdbcUsername = "root";
	private final String jdbcPassword = "admin";

	private final String INSERT_USER_SQL = "INSERT INTO user (name,email,phone,username,password) VALUES (?,?,?,?,?)";
	private final String SELECT_USER_BY_EMAIL = "SELECT * FROM user WHERE email=?";
	private final String SELECT_USER_BY_PHONE = "SELECT * FROM user WHERE phone=?";
	private final String SELECT_USER_BY_USERNAME = "SELECT * FROM user WHERE username=?";
	private final String SELECT_USER_BY_PASSWORD = "SELECT * FROM user WHERE password=?";
//	private final String INSERT_USER_SQL="INSERT INTO user (name,password,phone VALUES (?,?,?)";
//	private final String INSERT_USER_SQL="INSERT INTO user (name,password,phone VALUES (?,?,?)";

	private Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (Exception e) {
			System.out.println(e);
		}
		return conn;
	}

	public String insertUser(User user) {
		String message = "success";
		try (Connection conn = getConnection(); PreparedStatement stm = conn.prepareStatement(INSERT_USER_SQL)) {
			message = this.checkExistUserByEmail(user.getEmail());
			if (!message.equals("success")) {
				return message;
			}
			
			message = this.checkExistUserByPhone(user.getPhone());
			if (!message.equals("success")) {
				return message;
			}
			
			message = this.checkExistUserByUsername(user.getUsername());
			if (!message.equals("success")) {
				return message;
			}
			
//			message = this.checkExistUserByPassword(user.getPassword());
//			if (!message.equals("")) {
//				return message;
//			}
			
			stm.setString(1, user.getName());
			stm.setString(2, user.getEmail());
			stm.setInt(3, user.getPhone());
			stm.setString(4, user.getUsername());
			stm.setString(5, user.getPassword());
			stm.executeUpdate();
			System.out.println("da insert thanh cong " + message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "success";
	}

	public String checkExistUserByEmail(String email) {
		String message = "success";
		try (Connection conn = getConnection(); PreparedStatement stm = conn.prepareStatement(SELECT_USER_BY_EMAIL)) {
			stm.setString(1, email);
			ResultSet rs = stm.executeQuery();
			if (rs.next() == true)
				message = "Lỗi : email này đã được sử dụng";
			System.out.println("đã tìm thấy" + rs.next());
		} catch (Exception e) {
			System.out.println(e);
		}

		return message;
	}
	
	public String checkExistUserByPhone(int phone) {
		String message = "success";
		try (Connection conn = getConnection(); PreparedStatement stm = conn.prepareStatement(SELECT_USER_BY_PHONE)) {
			stm.setInt(1, phone);
			ResultSet rs = stm.executeQuery();
			if (rs.next() == true)
				message = "Lỗi : sdt này đã được sử dụng";
			System.out.println("đã tìm thấy" + rs.next());
		} catch (Exception e) {
			System.out.println(e);
		}

		return message;
	}
	
	public String checkExistUserByUsername(String username) {
		String message = "success";
		try (Connection conn = getConnection(); PreparedStatement stm = conn.prepareStatement(SELECT_USER_BY_USERNAME)) {
			stm.setString(1, username);
			ResultSet rs = stm.executeQuery();
			if (rs.next() == true)
				message = "Lỗi : username này đã được sử dụng";
			System.out.println("đã tìm thấy" + rs.next());
		} catch (Exception e) {
			System.out.println(e);
		}

		return message;
	}
	
//	public String checkExistUserByPassword(String username) {
//		String message = "";
//		try (Connection conn = getConnection(); PreparedStatement stm = conn.prepareStatement(SELECT_USER_BY_USERNAME)) {
//			stm.setString(1, username);
//			ResultSet rs = stm.executeQuery();
//			if (rs.next() == true)
//				message = "Lỗi : sai mật khẩu";
//			System.out.println("đã tìm thấy" + rs.next());
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//
//		return message;
//	}
}
