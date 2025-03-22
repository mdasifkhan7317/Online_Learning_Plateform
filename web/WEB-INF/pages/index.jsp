<%-- 
    Document   : index
    Created on : Apr 27, 2023, 10:21:40 AM
    Author     : hussain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<html>
    <head>
        <title>Online Learning Plateform</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Welcome to iCoder. A blog for coding enthusiasts">
       
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="WEB-INF/Style/project.css" type="text/css"/>
        <script src="jspage/validator.js" type="text/javascript"></script>

    </head>
    <body>
        <style>
            body {
            background-image: linear-gradient(to right, #d3cce3, #e9e4f0);
           /* background: rgb(2,0,36);
            background: -moz-linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(122,122,193,0.6138830532212884) 35%, rgba(0,212,255,1) 100%);
            background: -webkit-linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(122,122,193,0.6138830532212884) 35%, rgba(0,212,255,1) 100%);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(122,122,193,0.6138830532212884) 35%, rgba(0,212,255,1) 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#020024",endColorstr="#00d4ff",GradientType=1);*/
            }
        </style>
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
                    <button class="btn btn-primary" data-toggle="modal" data-target="#loginModal">Log In</button>
                    <button class="btn btn-danger" data-toggle="modal" data-target="#signupModal">Sign Up</button>
                </div>
            </div>
        </nav>



        <!-- Login Modal -->
        
        
        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title" id="exampleModalLabel">Login to OLP</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body" style="background-image: linear-gradient(to right, #d3cce3, #e9e4f0); ">
                        <form action="http://localhost:8080/olp/fc/?action=model&page=LoginModel2" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" name="email" id="em" aria-describedby="emailHelp" onblur="fieldValidator('em', 'sp')">
                                <h6><span id="sp" class="text-danger"></span></h6>
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" name="password" id="ps" onblur="fieldValidator('ps', 'sp2')">
                            </div><span id="sp2"></span>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Check me out</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Login</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> 
                    </div>
                </div>
            </div>
        </div>


        <!-- Sign Up Modal -->
        
        
        <div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title" id="exampleModalLabel">Get an OLP Account</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body" style="background-image: linear-gradient(to right, #d3cce3, #e9e4f0); ">
                        <form action="http://localhost:8080/olp/fc/?action=model&page=LoginModel" method="POST" class="needs-validation">
                            <div class="form-group">
                                <input type="text" class="form-control" name="fname" placeholder="First name:" id="fname" required/>
                            </div>
                            <div class="form-group">
                                <!--<label for="lname">Lastname</label>-->
                                <input type="text" class="form-control" name="lname" placeholder="Lastname" id="lname" required/>
                            </div>
                            <div class="form-group">
                                <!--<label for="dob">D.O.B</label>-->
                                <input type="date" class="form-control" name="dob" placeholder="D.O.B" id="dob" required/>
                            </div>
                            <div class="form-group">
                                <select name="qualification" id="hq" class="form-control">
                                    <option value="">Highest Qualification</option>
                                    <option value="1">P.H.D</option>
                                    <option value="2">Master</option>
                                    <option value="3">Bachelor</option>
                                </select> 
                            </div>
                            <div class="form-group"><!-- comment -->
                                <input type="email" class="form-control" name="email" placeholder="Email:" id="email" required/>
                                <div class="valid-feedback">valid</div><!-- comment -->
                                <div class="invalid-feedback">Please provide email</div>
                            </div><!-- comment -->
                            <div class="form-group"><!-- comment -->
                                <input type="password" class="form-control" name="password" placeholder="Enter Password:" id="pass"/>
                            </div><!-- comment -->
                            <div class="form-group">
                                <label class="radio-inline" for="checkbox">Gender:</label><br>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" value="Male">Male
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" value="Female">Female
                                </label>
                            </div>
                            <div class="form-group">
                                <select name="user" id="type" onclick="contentprovider();" class="form-control" >
                                    <option value="">Select Type:</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <!--<select name="city" id="state" class="form-control">
                                    <option value="">Select City:</option>
                                    <option value="1">Lucknow</option>
                                    <option value="2">Delhi</option>
                                    <option value="3">Mumbai</option>
                                    <option value="4">Nagpur</option>
                                    <option value="4">Kanpur</option>
                                    <option value="4">Kolkata</option>
                                    <option value="4">Chandigarh</option>
                                    <option value="4">Srinagar</option>
                                    <option value="4">Aligarh</option>
                                    <option value="4">Balia</option>
                                </select>-->
                                <select class="form-control" name="countries" onclick="getcountries();" id="con">
                                    <option value=""> Select Countries </option>
                                </select> 
                            </div>

                            <div class="d-grid gap-2">
                                <!-- <button type="button" class="btn btn-primary">Create Account</button><!-- comment -->
                                <input type="submit" value="Create Account" class="btn btn-primary"/>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> 
                    </div>
                </div>
            </div>
        </div>

        <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleCaptions" data-slide-to="0" class=""></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="1" class="active"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="2" class=""></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item">
                    <img width="900" height="350" src="https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80" class="d-block w-100" alt="My">
                    <div class="carousel-caption d-none d-md-block">
                        <h2>Welcome to OLP</h2>
                        <p>Technology News, Development and Trends</p>
                        <button class="btn btn-danger">Technology</button>
                        <button class="btn btn-primary">Web Development</button>
                        <button class="btn btn-success">Officially Updates</button>
                    </div>
                </div>
                <div class="carousel-item active">
                    <img width="900" height="400" src="https://media.istockphoto.com/id/1452604857/photo/businessman-touching-the-brain-working-of-artificial-intelligence-automation-predictive.webp?s=1024x1024&w=is&k=20&c=Mz2G15YAcE09_ywaRc43p9jmG2urk69uqyopTbaG4cI=" class="d-block w-100" alt="me">
                    <div class="carousel-caption d-none d-md-block">
                        <h2>The Best Learning Plateform</h2>
                        <p>Technology News, Development and Trends</p>
                        <button class="btn btn-danger">Technology</button>
                        <button class="btn btn-primary">Web Development</button>
                        <button class="btn btn-success">Officially tech Updates</button>
                    </div>
                </div>
                <div class="carousel-item">
                    <img width="900" height="350" src="https://media.istockphoto.com/id/1132845014/photo/chalkboard-light-bulb.jpg?b=1&s=170667a&w=0&k=20&c=4ccsu-j3WUznWaL0WPmYeDRRcKb4QvDzx1EObMcL1as=" class="d-block w-100" alt="m">
                    <div class="carousel-caption d-none d-md-block">
                        <h2>Read & Write Plateform</h2>
                        <p>Technology News, Development and Trends</p>
                        <button class="btn btn-danger">Technology</button>
                        <button class="btn btn-primary">Web Development</button>
                        <button class="btn btn-success">Officially Updates</button>
                    </div>
                </div>
            </div>

            <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        
        
        <div class="container mt-3 bt-3">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6 mb-4">
                <div class="card" style="width: 18rem;">
                    <img src="./backgroung-img.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                  </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-6 mb-4">
                <div class="card" style="width: 18rem;">
                    <img src="./backgroung-img.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <!--<a href="#">Read More</a>-->
                    </div>
                  </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-6 mb-2">
                <div class="card" style="width: 18rem;">
                    <img src="./backgroung-img.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                  </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-6 mb-4">
                <div class="card" style="width: 18rem;">
                    <img src="./backgroung-img.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                  </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-6 mb-2">
                <div class="card" style="width: 18rem;">
                    <img src="./backgroung-img.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                  </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-6 mb-2">
                <div class="card" style="width: 18rem;">
                    <img src="./backgroung-img.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                  </div>
            </div>
        </div>
    </div>
<!-- Footer-->
        <footer class="bg-dark text-light mt-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h5>About Us</h5>
                        <p>An online learning platform is a web space or portal for educational content and resources that offers a student everything they need in one place: lectures, resources, opportunities to meet and chat with other students, and more. It is also an excellent way for the student and the teacher to monitor student progress.</p>
                    </div>
                    <div class="col-md-4">
                        <h5>Links</h5>
                        <ul class="list-unstyled">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5>Contact Us</h5>
                        <address>
                            sector H.<br>
                            integral university<br>
                            Lucknow, India 226026<br>
                            <abbr title="Phone">P:</abbr> +916394123775
                        </address>
                    </div>
                </div>
                <hr>
                <div class="row justify-content-center align-items-center">
                    <p class="float-right"><a href="#">Back to top</a></p>
                    <div class="col-auto">
                        <p class="mb-0">&copy; Md Asif Khan 2023 All rights reserved.</p>
                        <p>© 2020-2021 Online Learning Plateform, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
                    </div>
                </div>
            </div>
        </footer>





        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
</html>