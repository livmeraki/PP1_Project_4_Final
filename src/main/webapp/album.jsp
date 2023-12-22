<%--
  Created by IntelliJ IDEA.
  User: livrocky
  Date: 12/16/23
  Time: 8:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.crud.dao.BoardDAO, com.crud.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.101.0">
  <title>Blog Homepage</title>

  <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/album/">

  <!-- Bootstrap core CSS -->
  <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
    a:link    { color: inherit; text-decoration: none; }
    a:visited { color: inherit; text-decoration: none; }
    a:hover   { color: inherit; text-decoration: underline; }
    a:active  { color: inherit; text-decoration: none; }
  </style>

  <!-- Custom styles for this template -->
  <link href="album.css" rel="stylesheet">

  <script>
    function delete_ok(id){
      var a = confirm("정말로 삭제하겠습니까?");
      if(a) location.href='deletepost.jsp?id=' + id;
    }
    $(".myBox").click(function() {
      window.location = $(this).find("a").attr("href");
      return false;
    });
  </script>
</head>
<body>
  <div class="collapse bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4 class="text-white">About</h4>
          <p class="text-muted">Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4 class="text-white">Contact</h4>
          <ul class="list-unstyled">
            <li><a href="#" class="text-white">Follow on Twitter</a></li>
            <li><a href="#" class="text-white">Like on Facebook</a></li>
            <li><a href="#" class="text-white">Email me</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex justify-content-between">
      <a href="#" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>My Blog</strong>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>

<main role="main">

  <section class="jumbotron text-center">
    <div class="container">
      <h1>D A I L Y  R E C O R D</h1>
      <p class="lead text-muted">Write something everyday! "Either write something worth reading or do something worth writing." --Benjamin Franklin.</p>
      <p>
        <a href="addpostform.jsp" class="btn btn-primary my-2">Add Post</a>
        <a href="#" class="btn btn-secondary my-2">Useless Button</a>
      </p>
    </div>
  </section>
  <header>

  <div class="album py-5 bg-light">
    <%
      BoardDAO boardDAO = new BoardDAO();
      List<BoardVO> list = boardDAO.getBoardList();
      request.setAttribute("list",list);
    %>
    <table id="list" width="90%">

      <div class="container">

        <div class="row row-cols-3">
          <c:forEach items="${list}" var="u">
            <div class="p-3">
              <div class="card mb-4 shadow-sm">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="50" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: No Pic" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="${u.getColor()}"/><text x="50%" y="50%" fill="#555555" dy=".3em">...</text></svg>
                  <div class="myBox">
                <div class="card-body">
                    <a class="card-title" style = "padding: 2px" href="viewpost.jsp?id=${u.getId()}" >${u.getTitle()}</a><br>
                    <div class="d-flex justify-content-between align-items-center">
                      <div class="btn-group" style = "padding-top: 5px; color: black">
                        <a class="btn btn-sm btn-outline-secondary" href="editform.jsp?id=${u.getId()}">Edit</a>
                        <a class="btn btn-sm btn-outline-secondary" href="javascript:delete_ok('${u.getId()}')">Delete</a>
                      </div>
                      <div>
                        <div><small class="text-muted">${u.getDatetime()}</small></div>
                        <div><small class="text-muted">${u.getViews()} view(s)</small></div>
                      </div>


                    </div>
                  </div>
                  </div>
              </div>
            </div>
          </c:forEach>
        </div>

      </div>

    </table>

  </div>
  </header>
</main>

<footer class="text-muted">
  <div class="container">
    <p class="float-right">
      <a href="#">Back to top</a>
    </p>
  </div>
</footer>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="assets/dist/js/jquery.slim.min.js"><\/script>')</script><script src="assets/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>

