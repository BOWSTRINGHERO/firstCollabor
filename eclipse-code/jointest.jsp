<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
  <%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang", "madang"); //username, password�� ���� Oracle ������ ������ �ϸ� ��
	String sql = "select * from buttontest_member"; //DB�� ��ȸ�� select��
	pstmt = conn.prepareStatement(sql); //sql������ conn
	rs = pstmt.executeQuery(); //pstmt ���� �� ����� rs�� �Ҵ�
	
	while(rs.next()){ //��ȸ�Ǵ� �ο�(��) �ݺ�
		out.print("<tr>");
		out.print("<td>" + rs.getString("custid") + "</td>"); //DB���� sabun �÷��� �ش��ϴ� ���ڵ� ���� �ҷ���
		out.print("<td>" + rs.getString("custpw") + "</td>");
		out.print("<td>" + rs.getInt("phone") + "</td>");
		out.print("<td>" + rs.getInt("address") + "</td>");
		out.print("<td>" + rs.getInt("custjoindate") + "</td>");
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
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="button.css">

  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <!-- ��� Ǫ�� ���� -->
  <script>
    $(document).ready(function () {
      $(".header").load("header.html");
    });
    $(document).ready(function () {
      $(".footer").load("footer.html");
    });
  </script>
</head>

<body class="join-body">
  <div class="header"></div>
  <div class="jo-wrap">
    <div class="jo-content">
      <form>
        <table class="jo-table">
          <tr>
            <td>ȸ����ȣ</td>
            <td><input class="custno" type="number"></td>
          </tr>
          <tr>
            <td>���̵�</td>
            <td><input class="custid" type="text"></td>
          </tr>
          <tr>
            <td>��й�ȣ</td>
            <td><input class="custpw" type="password"></td>
          </tr>
          <tr>
            <td>�̸�</td>
            <td><input class="custname" type="text"></td>
          </tr>
          <tr>
            <td>��ȭ��ȣ</td>
            <td><input class="phone" type="number"></td>
          </tr>
          <tr>
            <td>�ּ�</td>
            <td><input class="address" type="text"></td>
          </tr>
          <tr>
            <td><input class="join" type="button" value="ȸ������"></td>
          </tr>
        </table>
      </form>
    </div>
  </div>

  <div class="footer"></div>
</body>

</html>