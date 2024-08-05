<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
BoardDAO dao = new BoardDAO();
dao.increaseHits(Integer.parseInt(num)); // 조회수 증가
BoardDTO dto = dao.getOne(Integer.parseInt(num));
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
<header>
            <h1> <a href="../index.jsp">MY WEB </a> </h1>
</header>
<body>

<table>
    <tr>
        <th>제목</th>
        <td><%=dto.getTitle() %></td>
    </tr>
    <tr>
        <th>작성자</th>
        <td><%=dto.getWriter() %></td>
    </tr>
    <tr>
        <th>작성일시</th>
        <td><%=dto.getRegtime() %></td>
    </tr>
    <tr>
        <th>조회수</th>
        <td><%=dto.getHits() %></td>
    </tr>
    <tr>
        <th>내용</th>
        <td><%=dto.getContent() %></td>
    </tr>
</table>

<br>
<div class = "button-container">
<input type="button" value="목록보기" onclick="location.href='list.jsp'">
<% if (name != null) { %>
        <% if (dto.getWriter().equals(name)) { %> <!-- 작성자와 로그인된 사용자 확인 -->
            <input type="button" value="수정" onclick="location.href='edit.jsp?num=<%=dto.getNum()%>'">
            <input type="button" value="삭제" onclick="location.href='delete.jsp?num=<%=dto.getNum()%>'">
        <% } else { %>
            <input type="button" value="수정" onclick="alert('본인의 게시물만 수정할 수 있습니다.');">
            <input type="button" value="삭제" onclick="alert('본인의 게시물만 삭제할 수 있습니다.');">
        <% } %>
    <% } else { %>
        <input type="button" value="수정" onclick="alert('로그인이 필요합니다.'); location.href='../login.jsp'">
        <input type="button" value="삭제" onclick="alert('로그인이 필요합니다.'); location.href='../login.jsp'">
    <% } %>
</div>
</body>
</html>