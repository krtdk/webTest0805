<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Process</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String name = request.getParameter("username"); // Assuming name is the same as username for this example
    String password = request.getParameter("password");
    int ssn = Integer.parseInt(request.getParameter("ssn")); // Ensure ssn is passed as a parameter
    String email = request.getParameter("email");

    UserDAO userDAO = new UserDAO();
    UserDTO newUser = new UserDTO(id, name, password, ssn, email);

    try {
        userDAO.insertUser(newUser);
        out.println("<h2>회원 가입 성공! Welcome, " + name + ".</h2>");
        out.println("<script type='text/javascript'>");
        out.println("alert('회원 가입을 환영합니다, " + name + "!');");
        out.println("window.location.href = 'login.jsp';");
        out.println("</script>");
    } catch (Exception e) {
        out.println("<script type='text/javascript'>");
        out.println("alert('회원 가입 실패! 이미 존재하는 사용자명입니다.');");
        out.println("window.location.href = 'register.jsp';");
        out.println("</script>");
    }
%>
</body>
</html>
