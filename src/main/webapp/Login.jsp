
<!html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" href="style.css">
    <title>login!</title>
</head>
<body class="body">
<main>
    <div class="container py-5 text-center">
        <div class="row no-gutters">

            <div class="col-lg-4">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100"  src="./bheem/bheem1.png" alt="First slide" width="360" height="527" >
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="./bheem/bheem2.png" alt="Second slide" width="360" height="527">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="./bheem/bheem3.png" alt="Third slide" width="360" height="527">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>

                    <div class="col-lg-7 mx-auto">
                        <h1> <span> BHEEM FANS</span> LOGIN </h1>
                                 <%
                                     Message m = (Message) session.getAttribute("msg");
                                            if (m != null) {
                                 %>
                                   <div class="alert <%= m.getCssClass() %>" role="alert">
                                      <%= m.getContent() %>
                                          </div>
                                      <%
                                          session.removeAttribute("msg");
                                                        }
                                      %>
                        <p>SIGN IN TO YOUR ACCOUNT!</p>

                        <form id="reg-from" action="LoginServlet" method="post">
                            <div class="from-row py-2">
                                <div class="col-lg-12">
                                    <input type ="text" class ="from-control" placeholder="EMAIL" name="userName" value="">
                                </div>
                            </div>
                            <div class="from-row pt-4">
                                <div class="col-lg-12">
                                    <input type="password" class="from-control" placeholder="PASSWORD" name="password" value="">
                                </div>
                            </div>
                              <div class="container text-center" id="lloader" style="display: none;">
                                                            <span class="fa fa-refresh fa-spin fa-4x"></span>
                                                            <h4>Please wait..</h4>
                                                        </div>
                                                        <br>
                            <button id="submitt-btn" type="submit" class="btn1 mb-3 mt-4">LOGIN</button> <br>
                            <a href="#">FORGOT PASSWORD ? </a> <br>
                            <small>DON'T HAVE AN ACCOUNT ?<span><a href="Register.jsp">REGISTER NOW</a></span></small>
                        </form>
                    </div>
                </div>

        </div>
    </div>
</main>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

 <script
                src="https://code.jquery.com/jquery-3.4.1.min.js"
                integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="my.js" type="text/javascript"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


</body>
</html>