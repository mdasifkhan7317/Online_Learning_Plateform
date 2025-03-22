<%-- 
    Document   : contentprovider
    Created on : May 7, 2023, 2:12:00 PM
    Author     : hussain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jsp Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="WEB-INF/Style/project.css" type="text/css"/>
        <script src="../jspage/validator.js" type="text/javascript"></script>
        <script src="../jspage/postcontent.js" type="text/javascript"></script>
        <style>
            body {
                background: rgb(2,0,36);
                background: -moz-linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(122,122,193,0.6138830532212884) 35%, rgba(0,212,255,1) 100%);
background: -webkit-linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(122,122,193,0.6138830532212884) 35%, rgba(0,212,255,1) 100%);
background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(122,122,193,0.6138830532212884) 35%, rgba(0,212,255,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#020024",endColorstr="#00d4ff",GradientType=1);
            }
        </style>
    </head>
    <body >
        <%
                HttpSession sess=request.getSession(false);
                if(sess==null){
                    response.sendRedirect("http://localhost:8080/olp/fc?action=view&page=login");
                    }else{
                    if(Integer.parseInt(sess.getAttribute("user_type").toString())==2){
                        response.sendRedirect("http://localhost:8080/olp/fc/?action=view&page=contentseeker");
                    }
                }
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">OLP</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/about.html">About Us</a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link active" href="/contact.html">Contact Us</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                </form>
                <div class="mx-2">
                    <a class="btn btn-primary" href="http://localhost:8080/olp/fc?action=model&page=LogoutModel" role="button">Logout</a>
                </div>
            </div>
        </nav>

        <div class="container-fluid mt-2">
            <div class="row">
                <div class="col-lg-3 col-sm-4 col-md-4">
                    <div class="card-header">
                    <h5 class="text-center text-white">New Articles</h5>
                </div>
                    <div class="card">
                        <div class="card-body" style="background-image: linear-gradient(to right, #d3cce3, #e9e4f0);">
                            <form action="http://localhost:8080/olp/fc/?action=model&page=NewArticle" method="POST">
                                <div class="form-group my-3">
                                    <select name="category" id="cat" class="form-control" onclick="catSelector();">
                                        <option value="">select category:</option>

                                    </select>
                                </div>
                                <div class="form-group my-3">
                                    <select name="subcategory" id="subcat" onclick="getSubCategory('cat');"
                                            class="form-control">
                                        <option value="">select subcategory:</option>

                                    </select>
                                </div>
                                <div class="form-group my-3">
                                    <select name="topic" id="top" onclick="getTopic('subcat');" class="form-control">
                                        <option value="">select Topic:</option>
                                    </select>
                                </div>
                                <div class="form-group my-3">
                                    <input type="text" class="form-control" name="title" placeholder="Title:" id="titl" />
                                </div>
                                <div class="form-group my-3">
                                    <textarea id="tarea" class="form-control" name="article" rows="3" cols="41"
                                              placeholder="Enter Text"></textarea>
                                </div>
                                <div class="form-group my-3">
                                    <input type="file" id="formfile" name="image" />
                                </div>

                                <div class="d-grid  gap-2 my-3">
                                    <input type="submit" value="Post Article" class="btn btn-primary" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-sm-6 col-md-7">
                    <div class="card-header">
                    <h5 class="text-center text-white">Contents Form</h5>
                </div>
                    <div class="card">
                        <div class="card-body" style="background-image: linear-gradient(to right, #ffefba, #ffffff); ">
                            <div  id="trendingData" onload="getPostedContent()">

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="contentModal" tabindex="-1" aria-labelledby="contentModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-info">
                        <h5 class="modal-title" id="contentModalLabel">Content Detail</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body bg-secondary">
                        <div id="contentDetail" class="text-white"></div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
