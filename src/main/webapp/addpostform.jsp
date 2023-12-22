<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.BoardDAO, com.crud.bean.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">

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
        input[type=text] {
            border:none;

        }
        textarea {
            border:none;
            border-top: 1px solid rgb(128, 128, 128);

        }
    </style>

    <!-- Custom styles for this template -->
    <link href="album.css" rel="stylesheet">

    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='deletepost.jsp?id=' + id;
        }
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
        <a href="album.jsp" class="navbar-brand d-flex align-items-center">
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

    <section class="jumbotron jumbotron-fluid">
        <div class="container">
            <div >
                <h1 class = "d-flex justify-content-center">A D D</h1>
                <h5 class = "d-flex justify-content-center">R E C O R D</h5>
            </div>

            <br>
            <hr>
            <form action="addpost.jsp" method="post">
                <table>
                    <div style="display:flex;flex-direction:row">
                        <input type="text" name="title" placeholder="Title" style="flex:1; font-size:35px"/> <br>
                    </div>
                    <div style="display:flex;flex-direction:row">
                        <input type="text" name="writer" placeholder="writer" value = "writer" style="flex:1; font-size:10px"/><br>
                    </div>
                    <div style="display:flex;flex-direction:row">
                        <textarea cols="50" rows="5" name="content" placeholder="Content" style="flex:1"></textarea> <br>
                    </div>
                    <tr><td>Privacy:</td>
                        <td>
                            <input type="radio" id="public" name="privacy" value="1"/><label for="public">Public</label>
                            <input type="radio" id="private" name="privacy" value="0"/><label for="private">Private</label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="subject">Choose a subject:</label>
                        </td>
                        <td>
                            <select id="subject" name="subject">
                                <option value="book report">Book Report</option>
                                <option value="photography">Photography</option>
                                <option value="recipy">Recipy</option>
                                <option value="daily journal">Daily Journal</option>
                                <option value="none">None of the Above</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="color">Choose background color:</label>
                        </td>
                        <td>
                            <select id="color" name="color">
                                <option value="#ffffff">White</option>
                                <option value="#fce4e1">Red</option>
                                <option value="#fcf9e1">Yellow</option>
                                <option value="#e2fce1">Green</option>
                                <option value="#e1f7fc">Blue</option>
                                <option value="#efe1fc">Purple</option>
                                <option value="#fce1f6">Pink</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="color">Choose font:</label>
                        </td>
                        <td>
                            <select id="font" name="font">
                                <option value="Verdana" style="font-family: 'Verdana',serif">Verdana</option>
                                <option value="Times New Roman" style="font-family: 'Times New Roman',serif">Times New Roman</option>
                                <option value="Courier New" style="font-family: 'Courier New',serif">Courier New</option>
                                <option value="Lucida Handwriting" style="font-family: 'Lucida Grande',serif">Lucida Grande</option>
                                <option value="Copperplate" style="font-family: Copperplate,serif">Copperplate</option>
                                <option value="Papyrus" style="font-family: Papyrus,serif">Papyrus</option>
                            </select>
                        </td>
                    </tr>
                    <%--style="font-family:verdana--%>
                    <tr>
                        <td>
                            <%--<input type="file" name="image" accept="image/*"/>
                            --%>
                        </td>
                    </tr>

                    <tr><td></td><td align="right"><input type="submit" value="Add Post"/></td>
                        <td><input type="button" value="Cancel" onclick="history.back()"/></td>
                    </tr>

                </table>
            </form>
        </div>
    </section>
    <header>

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