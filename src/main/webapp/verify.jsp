<!doctype html>
<html>
<head>
  <style>
  .card {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    max-width: 600px;
    margin: auto;
    text-align: center;
    font-family: arial;
  }

  .title {
    color: grey;
    font-size: 18px;
  }

  button {
    border: none;
    outline: 0;
    display: inline-block;
    padding: 8px;
    color: white;
    background-color: #000;
    text-align: center;
    cursor: pointer;
    width: 100%;
    font-size: 18px;
  }

  a{
    text-decoration: none;
    font-size: 22px;
    color: black;
  }

  button:hover, a:hover {
    opacity: 0.7;
  }
  </style>
</head>
<body>

 <main>
   <div class="card">
    <form id="regg-form" action="verify" method="post">
      <div class="form-group">
        <label > we already send a verication  code to your email</label>

          <input type="otp" class="form" id="otp" aria-describedby="" placeholder="Enter otp" name="authCode">

          <small id="" class="form">you'll never share your otp with anyone else.</small>
       </div>
       <div class="container text-center" id="lloader" style="display: none;">
            <span class="fa fa-refresh fa-spin fa-4x"></span>
            <h4>Please wait..</h4>
        </div>

       <button  id="submitt-btn" type="submit" class="btn btn-primary">Submit</button>
    </form>
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
                $('#regg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#submitt-btn").hide();
                    $("#lloader").show();
                    //send register servlet:
                    $.ajax({
                        url: "verify",
                        type: 'post',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#submitt-btn").show();
                            $("#lloader").hide();
                            if (data.trim() === 'done')
                            {
                              swal("Successfully....","VERIFY","success")
                                       .then((value) => {

                                         window.location = "Login.jsp"
                                            });


                            } else
                            {
                                swal({
                                title: "INCORRECT OPT !!!!",

                                 icon: "error",
                                  button: "Check again",
                                   });

                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submitt-btn").show();
                            $("#lloader").hide();
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

