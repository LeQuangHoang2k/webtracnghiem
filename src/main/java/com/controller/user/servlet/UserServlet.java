package com.controller.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sr.Message;

import com.controller.user.model.User;
import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.ConnectListener;
import com.corundumstudio.socketio.listener.DataListener;
import com.corundumstudio.socketio.listener.DisconnectListener;
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

		case "/quiz": {
			socketio(request, response);
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

//		case "/loginFB": {
//			System.out.println("page loginFB : " + action);
//			this.loginFB(request, response);
//			break;
//		}
//
//		case "/loginGG": {
//			System.out.println("page loginGG : " + action);
//			this.loginGG(request, response);
//			break;
//		}

		case "/forgot": {
			System.out.println("page forgot : " + action);
			this.forgotPassword(request, response);
			break;
		}

		case "/quiz": {
			System.out.println("page quiz : " + action);
			this.loginGG(request, response);
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
		if (req.getParameter("phone").equals("")) {
			req.setAttribute("message", "Error : Phone doesn't match");
			req.getRequestDispatcher("index.jsp").forward(req, res);
			return;
		}
		int phone = Integer.parseInt(req.getParameter("phone"));
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println(username + password + phone + username + password);
		User userInfo = new User(name, email, phone, username, password);

		// check db
		String message = UserDAO.registerUser(userInfo);

		// main

		// res
		req.setAttribute("message", message);
		req.getRequestDispatcher("index.jsp").forward(req, res);
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
		req.setAttribute("message", message);
		if (!message.equals("success")) {
			req.getRequestDispatcher("index.jsp").forward(req, res);
			return;
		}

		res.sendRedirect(req.getContextPath() + "/quiz");
//		req.getRequestDispatcher("quiz.jsp").forward(req, res);
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

		// res xxx

	}

	private void forgotPassword(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// input
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		int phone = Integer.parseInt(req.getParameter("phone"));
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User userInfo = new User(name, email, phone, username, password);

		// check db
		String message = UserDAO.forgotUser(userInfo);

		// main

		// res
		req.setAttribute("message", message);
		req.getRequestDispatcher("index.jsp").forward(req, res);

	}

	private void socketio(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("socketio connecting...");
		// input

//		Configuration config = new Configuration();
//		config.setHostname("localhost");
//		config.setPort(8000);
//		final SocketIOServer server = new SocketIOServer(config);
//		server.addConnectListener(new ConnectListener() {
//            @Override
//            public void onConnect(SocketIOClient client) {
//                System.out.println("onConnected");
//                client.sendEvent("message", new Message("", "Welcome to the chat!"));
//            }
//        });
//		
//        server.addDisconnectListener(new DisconnectListener() {
//            @Override
//            public void onDisconnect(SocketIOClient client) {
//                System.out.println("onDisconnected");
//            }
//        });
//		server.addEventListener("hello", Message.class, new DataListener<Message>() {
//			@Override
//			public void onData(SocketIOClient arg0, Message arg1, AckRequest arg2) throws Exception {
//				System.out.println("ChatServer");
//				server.getBroadcastOperations().sendEvent("chat", arg1);
//			}
//
//		});
//		server.start();

		// db

		// main

		// res
		System.out.println("aaaa");
		req.getRequestDispatcher("quiz.jsp").forward(req, res);
	}
}
