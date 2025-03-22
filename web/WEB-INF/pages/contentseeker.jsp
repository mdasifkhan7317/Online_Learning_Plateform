<%-- 
    Document   : contentseeker
    Created on : May 7, 2023, 2:12:44 PM
    Author     : hussain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>content seeker</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="WEB-INF/Style/project.css" type="text/css"/>
        <script src="../jspage/validator.js" type="text/javascript"></script>
    </head>
    <body>
        <style>
            body {
                background: rgb(2,0,36);
                background: -moz-linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(122,122,193,0.6138830532212884) 35%, rgba(0,212,255,1) 100%);
                background: -webkit-linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(122,122,193,0.6138830532212884) 35%, rgba(0,212,255,1) 100%);
                background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(122,122,193,0.6138830532212884) 35%, rgba(0,212,255,1) 100%);
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#020024",endColorstr="#00d4ff",GradientType=1);
            }
        </style>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">OLP</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="container">
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
            </div>    
            <%
                HttpSession sess=request.getSession(false);
                if(sess==null){
                    response.sendRedirect("http://localhost:8080/olp/fc?action=view&page=login");
                }else{
                    if(Integer.parseInt(sess.getAttribute("user_type").toString())==1){
                        response.sendRedirect("http://localhost:8080/olp/fc/?action=view&page=contentprovider");
                    }
                }
            %>
        </nav>
        <div class="container mt-3">
            <div class="row d-flex">
                <div class="col-lg-8 col-8 col-md-8 mx-auto">
                    <div class="card">
                        <div class="card-header bg-warning">
                            <h3>Content Seeker</h3>
                        </div>
                        <div class="card-body" style="background-image: linear-gradient(to right, #d3cce3, #e9e4f0);">
                            <form action="http://localhost:8080/olp/fc/?action=model&page=NewArticle" method="POST">
                                <div class="form-group">
                                    <select name="category" id="cat" class="form-control" onclick="catSelector();">
                                        <option value="">select category:</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="subcategory" id="subcat" onclick="getSubCategory('cat');" class="form-control">
                                        <option value="">select subcategory:</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="topic" id="top" onclick="getTopic('subcat');" class="form-control">
                                        <option value="">select Topic:</option>
                                    </select>
                                </div>
                                <!--PROVIDER-->
                                <div class="form-group">
                                    <select class="form-control" name="provider" onclick="getProvider('top');" id="pro">
                                        <option value="">Select Provider</option>
                                    </select>
                                </div>
                                <div class="d-grid gap-2">
                                    <input type="submit" value="Show Posted Article" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
