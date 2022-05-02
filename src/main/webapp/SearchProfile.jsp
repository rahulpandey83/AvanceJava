<!html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="register.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
 <% String email1=(String)request.getAttribute("userName1"); %>
 <% String firstName1=(String)request.getAttribute("firstName1"); %>
 <% String lastName1=(String)request.getAttribute("lastName1"); %>
 <% String address1=(String)request.getAttribute("address1"); %>
 <% String city1=(String)request.getAttribute("city1"); %>
 <% String zip1=(String)request.getAttribute("zip1"); %>
 <% String state1=(String)request.getAttribute("state1"); %>
 <% String country1=(String)request.getAttribute("country1"); %>
 <% String phone1=(String)request.getAttribute("phone1"); %>

<nav class="navbar navbar-light bg-light justify-content-between">
    <a href="">BACK</a>

</nav>

<br>
<div class="card">
     <h2> Searched profile </h2>

    <h1><% out.print(firstName1); %>  <% out.print(lastName1); %></h1>


    <div style="margin: 24px 0;">
        <a href="#"><i class="fa fa-dribbble"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-facebook"></i></a>
        <button class="btn"><a  data-toggle="modal" data-target="#search-modal" href="#">VIEW PROFILE</button></a>

    </div>
    <p><button>Contact</button></p>
</div>
<div class="modal fade" id="search-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <h3 class="modal-title text-center" id="exampleModalLabel">USER</h3>

                <div id="profile-details">
                    <table class="table">

                        <tbody>
                        <tr>
                            <th scope="row">ID:</th>
                            <td>
                             ID
                            </td>

                        </tr>

                        <tr>
                            <th scope="row">FIRST NAME:</th>
                            <td>
                                <%
                                out.print(firstName1);
                                %>
                            </td>

                        </tr>
                        <tr>
                            <th scope="row">LAST NAME:</th>
                            <td>
                                <%
                                out.print(lastName1);
                                %>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">ADDRESS:</th>
                            <td>
                                <%
                                out.print(address1);
                                %>

                            </td>
                        </tr>
                        <tr>
                            <th scope="row">CITY:</th>
                            <td>
                                <%
                                out.print(city1);
                                %>

                            </td>
                        </tr>
                        <tr>
                            <th scope="row">ZIP:</th>
                            <td>
                                <%
                                out.print(zip1);
                                %>
                            </td>

                        </tr>
                        <tr>
                            <th scope="row">STATE:</th>
                            <td>
                                <%
                                out.print(state1);
                                %>
                            </td>

                        </tr>
                        <tr>
                            <th scope="row">COUNTRY:</th>
                            <td >
                                <%
                                out.print(country1);
                                %>
                            </td>

                        </tr>
                        <tr>
                            <th scope="row">MOBILE-NO:</th>
                            <td>
                                <%
                                out.print(phone1);
                                %>
                            </td>

                        </tr>

                        </tbody>

                    </table>
                </div>

                <div id="profile-edit" style="display: none;">
                    <h2>Please Edit Carefully</h2>
                    <form action="SearchEdit" method="post">
                        <table class="table">
                            <tr>
                                <td>PartyId</td>

                            </tr>

                            <tr>
                                <td>FIRST-NAME</td>
                                <td><input type="text"  class="form-control" name="userFirstName" value="<% out.print(firstName1); %>"></td>
                            </tr>
                            <tr>
                                <td>LAST-NAME</td>
                                <td><input type="text"  class="form-control" name="userLastName" value="<% out.print(lastName1); %>"></td>
                            </tr>
                            <tr>
                                <td>ADDRESS</td>
                                <td><input type="text"  class="form-control" name="userAddress" value="<% out.print(address1); %>"></td>
                            </tr>
                            <tr>
                                <td>CITY</td>
                                <td><input type="text"  class="form-control" name="userCity" value="<% out.print(address1); %>"></td>
                            </tr>
                            <tr>
                                <td>ZIP</td>
                                <td><input type="text" class="form-control" name="userZip" value="<% out.print(zip1); %>"></td>
                            </tr>
                            <tr>
                                <td>STATE</td>
                                <td><input type="text"  class="form-control" name="userState" value="<% out.print(state1); %>"></td>
                            </tr>
                            <tr>
                                <td>COUNTRY</td>
                                <td><input type="text"  class="form-control" name="userCountry" value="<% out.print(country1); %>"></td>
                            </tr>
                            <tr>
                                <td>MOBILE-NO</td>
                                <td><input type="text"  class="form-control" name="userPhone" value="<% out.print(phone1); %>"></td>
                            </tr>
                        </table>
                        <div class="container">
                            <button type="submit" class="btn btn-outline-primary">SAVE</button>
                        </div>
                    </form>
                </div>
            </div>


            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="edit-profile-button"type="button" class="btn btn-primary">Edit</button>
            </div>
        </div>
    </div>
</div>
<!--javascripts-->
<script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="my.js" type="text/javascript"></script>
<script>
        $(document).ready(function(){
               let editStatus =false;
            $('#edit-profile-button').click(function()
            {
              if(editStatus == false)
              {
               $("#profile-details").hide()


               $("#profile-edit").show()
               editStatus = true;
               $(this).text("Back")
               }else
               {
                 $("#profile-details").show()


                               $("#profile-edit").hide()
                               editStatus = false;
                                $(this).text("Edit")

               }

          })

        });


        </script>
</body>
</html>