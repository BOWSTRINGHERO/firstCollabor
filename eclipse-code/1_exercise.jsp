
  <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>서울의 운동시설</title>

      <link rel="stylesheet" href="button.css">

      <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
      <!-- 헤더 푸터 연결 -->
      <script>
        $(document).ready(function () {
          $(".header").load("header.jsp");
        });
        $(document).ready(function () {
          $(".footer").load("footer.jsp");
        });
      </script>

    </head>

    <body class="main-body">
      <div class="header"></div>
      <div class="m-wrap">
        <form action="1_search_exercise.jsp" method="get">
          <div class="m-search-wr">
            <table class="m-search-t">
              <tr>
                <td><input class="m-search-bar" type="text" name="query"></td>
                <td><input class="m-search-bt" type="submit" value="검색"></td>
              </tr>
            </table>
            </div>
            </form>
            <div class="m-sub">
              <table class="m-sub-t">
                <tr>
                  <td><a href=""><img src="img/exercise.png" alt="운동"></a></td>
                  <td><a href="performance.jsp"><img src="img/painting.png" alt="공연"></a></td>
                  <td><a href=""><img src="img/movie.png" alt="영화"></a></td>
                </tr>
                <tr>
                  <td><a href=""><img src="img/game.png" alt="게임"></a></td>
                  <td><a href=""><img src="img/book.png" alt="책"></a></td>
                  <td><a href=""><img src="img/ball.png" alt="운동장"></a></td>
                </tr>
              </table>

            </div>

          </div>



      <div class=" footer">
      </div>
      
     

    </body>


    </html>