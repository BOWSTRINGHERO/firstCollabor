<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!-- 
      2023/04/28  
      Coding by Button (SJ,SY,EJ,HJ,JY)
-->

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hello!</title>
  <link rel="stylesheet" href="button.css">
</head>

<body>
  <div class="li-wrap">
    <div class="li-container">
      <div class="li-intro">
        <h2> �Ѥѷα��� �ϼ���</h2>
        <b>�α����Ͽ� ��̻�Ȱ�� ��ܺ�����!</b>
      </div>
      <form action="loginCheck.jsp" method="post">
        <table class="li-input">
          <tr>
            <td><input class="li-id" name="custid" type="text" placeholder="���̵�"></td>
          </tr>
          <tr>
            <td><input class="li-pw" name="custpw" type="password" placeholder="��й�ȣ"></td>
          </tr>
          <tr>
            <td><input class="li-login" type="submit" value="�α���"></td>
          </tr>
        </table>
        <div class="li-j">
          <span>@@@�� ó���̽Ű���?</span>
          <input class="li-join" type="button" value="�����ϱ�" onclick="location.href='join.jsp'">
        </div>
      </form>
    </div>
  </div>


</body>

</html>