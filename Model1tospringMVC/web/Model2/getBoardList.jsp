<%--
  Created by IntelliJ IDEA.
  User: sinsuung
  Date: 31/07/2019
  Time: 8:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="board.BoardVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
    List<BoardVO> boardVOList = (List<BoardVO>) session.getAttribute("boardList");
%>

<html>
    <head>
        <title>글 목록</title>
    </head>
    <body>
        <div style="text-align: center;">
            <h1>글 목록</h1>
            <h3>테스트님 환영합니다...<a href="logout.do">로그아웃</a></h3>
        </div>
        <form action="getBoardList.jsp" method="post">
            <table border="1" cellpadding="0" cellspacing="0" width="700">
                <tr>
                    <td align="right">
                        <select name="searchCondition">
                            <option value="TITLE">제목</option>
                            <option value="CONTENT">내용</option>
                        </select>
                        <input type="text" name="searchKeyword"/>
                        <input type="submit" value="검색"/>
                    </td>
                </tr>
            </table>
        </form>

        <table border="1" cellpadding="0" cellspacing="0" width="700">
            <tr>
                <th bgcolor="orange" width="100">번호</th>
                <th bgcolor="orange" width="200">제목</th>
                <th bgcolor="orange" width="150">작성자</th>
                <th bgcolor="orange" width="150">등록일</th>
                <th bgcolor="orange" width="100">조회수</th>
            </tr>

            <c:forEach items="${boardList}" var="board">
                <tr>
                    <td>${board.seq}</td>
                    <td align="left"><a href="getBoard.do?seq=${board.seq}"></a>${board.title}</td>
                    <td>${board.writer}</td>
                    <td>${board.regDate}</td>
                    <td>${board.cnt}</td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <a href="insertBoard.jsp">새글 등록</a>
    </body>
</html>
