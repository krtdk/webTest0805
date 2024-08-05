<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO();
List<BoardDTO> list = dao.getBoardList();
HttpSession sessionLogin = request.getSession(false);
String name = null;
if (session != null) {
    name = (String) session.getAttribute("name");
}
%>
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
       
      .button-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }
        
        .num      { width: 80px; }
        .title    { width:230px; }
        .writer   { width:100px; }
        .regtime  { width:180px; }
                
        a:link    { text-decoration:none; color:blue; }
        a:visited { text-decoration:none; color:gray; }
        a:hover   { text-decoration:none; color:red; }
		 header {
            text-align: center;
            margin-bottom: 20px;    
            text-decoration: none;        
        }
   
        <link rel="stylesheet" href="css/style.css">
    </style>
</head>
<body>
<header>
            <h1> <a href="../index.jsp" color = "black">MY WEB </a> </h1>

</header>
<table>
    <tr>
        <th class="num">번호</th>
        <th class="title">제목</th>
        <th class="writer">작성자</th>
        <th class="regtime">작성일시</th>
        <th>조회수</th>
    </tr>
<%
for (BoardDTO dto : list) {
%>
    <tr>
        <td><%=dto.getNum() %></td>
        <td style="text-align:left;">
            <a href="view.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a>
        </td>
        <td><%=dto.getWriter() %></td>
        <td><%=dto.getRegtime() %></td>
        <td><%=dto.getHits() %></td>
    </tr>
<%
}
%>
</table>

<br>
<div class = "button-container">
<input type="button" value="글쓰기" onclick="<%= (name != null) ? "location.href='write.jsp'" : "alert('로그인이 필요합니다.'); location.href='../login.jsp'" %>">
</div>
</body>
</html>
