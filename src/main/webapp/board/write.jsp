<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
         table { width:680px; text-align:center;
                margin: auto;    		
        		 }
        th    { background-color: #f2f2f2; 
        	}
        input[type=text], textarea { width:100%; }
       
      .button-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }
	 header {
            text-align: center;
            margin-bottom: 20px;    
            text-decoration: none;        
        }
                <link rel="stylesheet" href="css/style.css">
        
    </style>
</head>
<header>
            <h1> <a href="../index.jsp" color = "black">MY WEB </a> </h1>

</header>
<body>

<%
    HttpSession sessionLogin = request.getSession(false); // 세션이 없으면 null 반환
    if (sessionLogin == null || session.getAttribute("name") == null) {
        out.println("<script type='text/javascript'>");
        out.println("alert('로그인이 필요합니다.');");
        out.println("window.location.href = 'login.jsp';");
        out.println("</script>");
    } else {
        String name = (String) session.getAttribute("name");
%>
<form method="post" action="insert.jsp">
    <table>
        <tr>
            <th>제목</th>
            <td><input type="text" name="title" maxlength="80" value=""></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><input type="text" name="writer" maxlength="20" value="<%= name %>" readonly></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" rows="10"></textarea></td>
        </tr>
    </table>
    <br>
    <div class= "button-container">
    <input type="submit" value="저장">
    <input type="button" value="취소" onclick="history.back()">
    </div>
</form>
<%
    }
%>
</body>
</html>
