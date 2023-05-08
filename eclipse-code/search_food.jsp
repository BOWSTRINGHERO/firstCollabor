

<%-- main.jsp에서 입력받은 검색어를 통해 performance 테이블에 있는 데이터를 가져와서 화면에 보여줍니다. --%>


<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %> 
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   String query = request.getParameter("query");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점 리스트</title>
</head>
<body>
<center><h2>음식점 리스트</h2></center>
<table style="width:800px;">
<tr>
<th st>키</th>
<th>분류1</th>
<th>분류2</th>
<th>분류3</th>
<th>검색어</th>
<th>명칭</th>
<th>행정시</th>
<th>행정구</th>
<th>행정동</th>
</tr>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "button", "1234"); //username, password는 개인 Oracle 계정의 것으로 하면 됨

  
   // 모든 컬럼에서 데이터를 가져오도록 or로 연결함.
   String sql = "SELECT * FROM food WHERE 키 LIKE ? OR 분류1 LIKE ? OR 분류2 LIKE ? OR 분류3 LIKE ? OR 검색어 LIKE ? OR 명칭 LIKE ? OR 행정시 LIKE ? OR 행정구 LIKE ? OR 행정동 LIKE ?";
   pstmt = conn.prepareStatement(sql);
   
   for (int i = 1; i <= 9; i++) {
       pstmt.setString(i, "%" + query + "%");
   }

   rs = pstmt.executeQuery();

   
   while(rs.next()){ //조회되는 로우(행) 반복
	   out.print("<tr>");
	      out.print("<td>" + rs.getString("키") + "</td>"); 
	      out.print("<td>" + rs.getString("분류1") + "</td>");
	      out.print("<td>" + rs.getString("분류2") + "</td>");
	      out.print("<td>" + rs.getString("분류3") + "</td>");
	      out.print("<td>" + rs.getString("검색어") + "</td>");
	      out.print("<td>" + rs.getString("명칭") + "</td>");
	      out.print("<td>" + rs.getString("행정시") + "</td>");
	      out.print("<td>" + rs.getString("행정구") + "</td>");
	      out.print("<td>" + rs.getString("행정동") + "</td>");
	      out.print("</tr>");
   }
   
   rs.close();
   pstmt.close();
   conn.close();
}catch(Exception e){
   e.printStackTrace();
}finally{
   try{
      if(rs!=null) rs.close();
      if(pstmt!=null) pstmt.close();
      if(conn!=null) conn.close();
   }catch(Exception e){
      e.printStackTrace();
   }
}
%>
</table>
</body>
</html>