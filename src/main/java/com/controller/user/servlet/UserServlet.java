package com.controller.user.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.user.model.User;
import com.google.gson.Gson;
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String action = request.getServletPath();
		switch (action) {

		case "/": {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

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

		case "/forgot": {
			System.out.println("page forgot : " + action);
			this.forgotPassword(request, response);
			break;
		}

		default:
			break;
		}
	}

	protected void write(HttpServletResponse res, Map<String, Object> map) throws ServletException, IOException {
		res.setContentType("json");
		res.setCharacterEncoding("UTF-8");
		res.getWriter().write(new Gson().toJson(map));
	}

	private void register(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// input
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println(name + email + phone + username + password);
		User userInfo = new User(name, email, phone, username, password);

		// check db
		String message = UserDAO.registerUser(userInfo);

		// main

		// res
		System.out.println(message);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", message);
		write(res, map);
	}

	private void login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// input
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User userInfo = new User(username, password);

		// check db
		String message = UserDAO.loginUser(userInfo);

		// main

		// jwt

		// res
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", message);
		write(res, map);
	}

	private void forgotPassword(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// input
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User userInfo = new User(name, email, phone, username, password);

		// check db
		String message = UserDAO.forgotUser(userInfo);

		// main

		// res
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", message);
		write(res, map);
	}
}
