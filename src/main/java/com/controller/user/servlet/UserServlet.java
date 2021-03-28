package com.controller.user.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.user.model.User;
import com.controller.user.dao.UserDAO;

@WebServlet("/")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserDAO UserDAO;

	public UserServlet() {
		UserDAO = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		switch (action) {

		case "/register": {
			System.out.println("page register : " + action);
			this.register(request, response);
			break;
		}

		case "/login": {
			System.out.println("page login : " + action);
			this.login(request, response);
			break;
		}

		case "/loginFB": {
			System.out.println("page loginFB : " + action);
			this.loginFB(request, response);
			break;
		}

		case "/loginGG": {
			System.out.println("page loginGG : " + action);
			this.loginGG(request, response);
			break;
		}

		case "/forgot": {
			System.out.println("page forgot : " + action);
			this.forgotPassword(request, response);
			break;
		}

		default:
			break;
		}
	}

	private void register(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// input
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		int phone = Integer.parseInt(req.getParameter("phone"));
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		// System.out.println(username + password + phone + username + password);
		User userInfo = new User(name, email, phone, username, password);

		// check db
		String message = UserDAO.insertUser(userInfo);
<<<<<<< HEAD
		System.out.println("* : main" + message);
=======
		System.out.println("* : In final" + message);
>>>>>>> 353dede662b1f8ae664c4d47555aede3925599f5
		// main

		// res
		// req.getAttribute(message);
		// req.getRequestDispatcher("index.jsp").forward(req, res);
	}

	private void login(HttpServletRequest req, HttpServletResponse res) {
		// input
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		// check db

		// main

		// res
	}

	private void loginFB(HttpServletRequest req, HttpServletResponse res) {
		// input

		// check db

		// main

		// res
	}

	private void loginGG(HttpServletRequest req, HttpServletResponse res) {
		// input

		// check db

		// main

		// res

	}

	private void forgotPassword(HttpServletRequest req, HttpServletResponse res) {
		// input

		// check db

		// main

		// res
	}

}
