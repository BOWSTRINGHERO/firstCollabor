
<%@page import="java.sql.*" %> 
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
<title>서울 공공 체육시설</title>
<title>공연 리스트</title>
</head>
<body>
<h2>서울 공공 체육시설</h2>
<table border="1">
<tr>
	<th>시군구</th>
	<th>시설명</th>
	<th>소유기관</th>
	<th>관리주체</th>
	<th>바닥재료</th>
	<th>좌석수</th>
	<th>수용인원</th>
	<th>준공연도</th>
</tr>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Button", "1234"); //username, password는 개인 Oracle 계정의 것으로 하면 됨

  
   // 모든 컬럼에서 데이터를 가져오도록 or로 연결함.

   String sql = "SELECT * FROM exercise WHERE 시군구 LIKE ? OR 시설명 LIKE ? OR 소유기관 LIKE ? OR 관리주체 LIKE ? OR 바닥재료 LIKE ? OR 좌석수 LIKE ? OR 수용인원 LIKE ? OR 준공연도 LIKE ?";
   pstmt = conn.prepareStatement(sql);
   
   for (int i = 1; i <= 8; i++) {
       pstmt.setString(i, "%" + query + "%");
   }

   rs = pstmt.executeQuery();

   
   while(rs.next()){ //조회되는 로우(행) 반복
	   out.print("<tr>");
	    out.print("<td>" + (rs.getString("시군구") == null ? "" : rs.getString("시군구")) + "</td>");
	    out.print("<td>" + (rs.getString("시설명") == null ? "" : rs.getString("시설명")) + "</td>");
	    out.print("<td>" + (rs.getString("소유기관") == null ? "" : rs.getString("소유기관")) + "</td>");
	    out.print("<td>" + (rs.getString("관리주체") == null ? "" : rs.getString("관리주체")) + "</td>");
	    out.print("<td>" + (rs.getString("바닥재료") == null ? "" : rs.getString("바닥재료")) + "</td>");
	    out.print("<td>" + (rs.getString("좌석수") == null ? "" : rs.getString("좌석수")) + "</td>");
	    out.print("<td>" + (rs.getString("수용인원") == null ? "" : rs.getString("수용인원")) + "</td>");
	    out.print("<td>" + (rs.getString("준공연도") == null ? "" : rs.getString("준공연도")) + "</td>");
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