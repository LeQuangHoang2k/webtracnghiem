package com.controller.user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;

import com.controller.user.model.User;

public class UserDAO {
	private final String jdbcURL = "jdbc:mysql://localhost:3306/webtracnghiem?useSSL=false";
	private final String jdbcUsername = "root";
	private final String jdbcPassword = "admin";

	private final String INSERT_USER_SQL = "INSERT INTO user (name,email,phone,username,password_hash,total_score,level) VALUES (?,?,?,?,?,?,?)";
	private final String SELECT_USER_BY_EMAIL = "SELECT * FROM user WHERE email=?";
	private final String SELECT_USER_BY_PHONE = "SELECT * FROM user WHERE phone=?";
	private final String SELECT_USER_BY_USERNAME = "SELECT * FROM user WHERE username=?";
	private final String UPDATE_PASSWORD_BY_USERNAME = "UPDATE user SET password_hash = ? WHERE username=?";
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

	public String registerUser(User user) {
		if (checkEmpty(user.getName())) {
			return "Error : Name is empty or length < 5";
		}
		
		if (checkEmpty(user.getEmail())) {
			return "Error : Email is empty or length < 5";
		}
		
		if (checkEmpty(user.getPhone())) {
			return "Error : Phone is empty or length < 11";
		}

		if (checkEmpty(user.getUsername())) {
			return "Error : Username is empty or length < 5";
		}

		if (checkEmpty(user.getPassword())) {
			return "Error : Password is empty or length < 5";
		}
		
		try (Connection conn = getConnection(); PreparedStatement stm = conn.prepareStatement(INSERT_USER_SQL)) {

			if (checkExistUserByEmail(user.getEmail())) {
				return "Error : Email existed ";
			}

			if (checkExistUserByPhone(user.getPhone())) {
				return "Error : Phone existed";
			}

			if (checkExistUserByUsername(user.getUsername())) {
				return "Error : Username existed";
			}

			String hashPassword = hashData(user.getPassword());

			stm.setString(1, user.getName());
			stm.setString(2, user.getEmail());
			stm.setString(3, user.getPhone());
			stm.setString(4, user.getUsername());
			stm.setString(5, hashPassword);
			stm.setInt(6, 0);
			stm.setString(7, "Iron");
			stm.executeUpdate();
			System.out.println("da insert thanh cong ");
		} catch (Exception e) {
			System.out.println(e);
		}

		return "success";
	}

	public String loginUser(User user) {
		String usernameSQL = "";
		String passwordSQL = "";

		if (checkEmpty(user.getUsername())) {
			return "Error : Username is empty or length < 5";
		}

		if (checkEmpty(user.getPassword())) {
			return "Error : Password is empty or length < 5";
		}

		try (Connection conn = getConnection();
				PreparedStatement stm = conn.prepareStatement(SELECT_USER_BY_USERNAME)) {

			System.out.println("Login checking.... : " + user.getUsername());
			stm.setString(1, user.getUsername());
			ResultSet rs = stm.executeQuery();

			while (rs.next()) {
				usernameSQL = rs.getString("username");
				passwordSQL = rs.getString("password_hash");
			}

//			System.out.println(usernameSQL + " " + passwordSQL);

			if (!checkValidUsername(user.getUsername(), usernameSQL)) {
				return "Error : Username doesn't match";
			}

			if (!checkHashPassword(user.getPassword(), passwordSQL)) {
				return "Error : Password doesn't match";
			}
			
			System.out.println("Login success!");
		} catch (Exception e) {
			System.out.println(e);
		}
		return "success";
	}

	public String forgotUser(User user) {
		String hashPassword = "";

		if (checkEmpty(user.getEmail())) {
			return "Error : Email is empty or length < 5";
		}

		if (checkEmpty(user.getPhone())) {
			return "Error : Phone is empty or length < 11";
		}

		if (checkEmpty(user.getUsername())) {
			return "Error : Username is empty or length < 5";
		}

		if (checkEmpty(user.getPassword())) {
			return "Error : Password is empty or length < 5";
		}

		try (Connection conn = getConnection();
				PreparedStatement stm = conn.prepareStatement(UPDATE_PASSWORD_BY_USERNAME)) {
			
			System.out.println("Forgot checking.... : ");
			
			if (!checkExistUserByEmail(user.getEmail())) {
				return "Error : Email not valid";
			}

			if (!checkExistUserByPhone(user.getPhone())) {
				return "Error : Phone not valid";
			}

			if (!checkExistUserByUsername(user.getUsername())) {
				return "Error : Username not valid";
			}

			hashPassword = hashData(user.getPassword());
			stm.setString(1, hashPassword);
			stm.setString(2, user.getUsername());
			stm.executeUpdate();
			
			System.out.println("Forgot success!");
		} catch (Exception e) {
			System.out.println(e);
		}
		return "success";
	}

	// hash
	private String hashData(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt(12));
	}

	private boolean checkHashPassword(String password, String passwordSQL) {
		return BCrypt.checkpw(password, passwordSQL);
	}

	private boolean checkValidUsername(String username, String usernameSQL) {
		if (username.equals(usernameSQL)) {
			return true;
		}
		return false;
	}

	// checkEmpty
	public boolean checkEmpty(String data) {
		if (data == null || data.length() < 5) {
			return true;
		}
		return false;
	}

	// check exist
	public boolean checkExistUserByEmail(String email) {
		try (Connection conn = getConnection(); PreparedStatement stm = conn.prepareStatement(SELECT_USER_BY_EMAIL)) {
			stm.setString(1, email);
			ResultSet rs = stm.executeQuery();
			if (!rs.next())
				return false;
		} catch (Exception e) {
			System.out.println(e);
		}

		return true;
	}

	public boolean checkExistUserByPhone(String phone) {
		try (Connection conn = getConnection(); PreparedStatement stm = conn.prepareStatement(SELECT_USER_BY_PHONE)) {
			stm.setString(1, phone);
			ResultSet rs = stm.executeQuery();
			if (!rs.next())
				return false;
		} catch (Exception e) {
			System.out.println(e);
		}

		return true;
	}

	public boolean checkExistUserByUsername(String username) {
		try (Connection conn = getConnection();
				PreparedStatement stm = conn.prepareStatement(SELECT_USER_BY_USERNAME)) {
			stm.setString(1, username);
			ResultSet rs = stm.executeQuery();
			if (!rs.next())
				return false;
		} catch (Exception e) {
			System.out.println(e);
		}

		return true;
	}
}
