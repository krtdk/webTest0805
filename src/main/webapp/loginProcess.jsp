<%@ page import="user.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Process</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    UserDAO dao = new UserDAO();
    String name = dao.getUserName(id, password);

    if (dao.checkLogin(id, password)) {
        // 세션 설정
        HttpSession sessionLogin= request.getSession();
        sessionLogin.setAttribute("name", name);

        Cookie loginCookie = new Cookie("name", name);
        loginCookie.setMaxAge(60 * 60); // 1시간 동안 유효
        response.addCookie(loginCookie);
        out.println("<script type='text/javascript'>");
        out.println("alert('환영합니다, " + name + "!');");
        out.println("window.location.href = 'index.jsp';");
        out.println("</script>");
    } else {
        out.println("<script type='text/javascript'>");
        out.println("alert('로그인 실패!');");
        out.println("window.location.href = 'login.jsp';");
        out.println("</script>");
    }
%>
</body>
</html>
