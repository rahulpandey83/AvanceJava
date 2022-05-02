<! html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>register page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="register.css">
    <link rel="stylesheet" href="style.css">

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.html">DHOLAKPUR</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<br>
<main>
    <div class="container">
        <div class="col-md-6 offset-md-3 ">
            <div class="card">
                <div class="card-header text-center">
                    <span class="fa fa-3x fa-user-circle"></span>
                    <br>
                    Register here
                </div>
                <div class="card-body">

                    <form id="reg-form" action="RegistrationServlet" method="post">
                        <div class="from-row py-2">
                            <div class="col-lg-12">
                                <input type="text" class="from-control" placeholder="FIRST NAME" name="firstName"
                                       value="" >
                            </div>
                        </div>
                        <div class="from-row py-2">
                            <div class="col-lg-12 ">
                                <input type="text" class="from-control" placeholder="LAST NAME" name="lastName"
                                       value="">
                            </div>
                        </div>
                        <div class="from-row py-2">
                            <div class="col-lg-12">
                                <input type="text" class="from-control" placeholder="ADDRESS" name="address" value="">
                            </div>
                        </div>
                        <div class="from-row py-2">
                            <div class="col-lg-12">
                                <input type="text" class="from-control" placeholder="CITY" name="city" value="">
                            </div>
                        </div>
                        <div class="from-row py-2">
                            <div class="col-lg-12">
                                <input type="text" class="from-control" placeholder="STATE" name="state" value="">
                            </div>
                        </div>
                        <div class="from-row py-2">
                            <div class="col-lg-12">
                                <input type="text" class="from-control" placeholder="COUNTRY" name="country" value="">
                            </div>
                        </div>
                        <div class="from-row py-2">
                            <div class="col-lg-12">
                                <input type="text" class="from-control" placeholder="ZIP" name="zip" value="">
                            </div>
                        </div>
                        <div class="from-row py-2">
                            <div class="col-lg-12">
                                <input type="text" class="from-control" placeholder="PHONE" name="phone" value="">
                            </div>
                        </div>
                        <div class="from-row py-2">
                            <div class="col-lg-12">
                                <input type="text" class="from-control" placeholder="EMAIL" name="userName" value="">
                            </div>
                        </div>
                        <div class="from-row py-2">
                            <div class="col-lg-12">
                                <input type="password" class="from-control" placeholder="PASSWORD" name="password"
                                       value="">
                            </div>
                        </div>
                        <br>
                        <div class="container text-center" id="loader" style="display: none;">
                            <span class="fa fa-refresh fa-spin fa-4x"></span>
                            <h4>Please wait..</h4>
                        </div>
                         <button  id="sumbimt-btn" type="submit" class="btn btn-primary">Submit</button> <br>
                                           <small>ALREADY HAVE AN ACCOUNT?<span><a href="Login.jsp">LOGIN NOW</a></span></small>

                      <div class="form-check">
                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Agree terms and conditions?</label>
                      </div>
                    </form>

                </div>
                <div class="card-footer">

                </div>


            </div>

        </div>


    </div>
</main>


        <script
                src="https://code.jquery.com/jquery-3.4.1.min.js"
                integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="my.js" type="text/javascript"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


<script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#sumbimt-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RegistrationServlet",
                        type: 'post',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            if (data.trim() === 'done')
                            {
                                swal("Successfully....","Send OTP To Your Gmail Please Verify","success")
                                        .then((value) => {

                                            window.location = "verify.jsp"
                                        });
                            } else
                            {


                                swal({
                                  title: "Important!!!!",
                                  text: "Box not checked!",
                                  icon: "error",
                                  button: "Check again",
                                });
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
</body>
</html>