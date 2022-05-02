<%@page import="Model.Message"%>
<%@page import="Model.JavaBeanRegistration"%>


<!doctype html>
 <html>
  <head>
    <title>jsp page</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
               integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
         <!-- <link rel="stylesheet" href="home.css">
           <link rel="stylesheet" href="register.css">
           <link rel="stylesheet" href="style.css"> -->
           <link rel="stylesheet" href="Profile.css">
  </head>
  <body>
     <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
          <a class="navbar-brand" href="#">Navbar</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
               <a class="nav-link disabled" href="logout">LOGOUT</a>
            </li>
               <li class="nav-item">
                <a class="nav-link disabled" href="delete">DELETE PROFILE</a>
            </li>
          </ul>
          <form class="form-inline my-2 my-lg-0" action="search" method="post">
            <input class="form-control mr-sm-2" type="search" placeholder="First Name" aria-label="Search" name="firstName" required="">
            <input class="form-control mr-sm-2" type="search" placeholder="Last Name" aria-label="Search" name="lastName" required="">
            <button class="btn btn-outline-success my-2 my-sm-0"   type="submit">Search</button>
          </form>
           <ul>
             <li class="nav-item"><a class="nav-link disabled" data-toggle="modal" data-target="#profile-modal" href="#">USER</a>
             </li>
             <li class="nav-item"><a class="nav-link disabled" href="logout">LOGOUT</a>
            </li>
          </ul>
        </div>
     </nav>
     <br>
     </br>
     <!-- Button trigger modal -->
     <!-- Modal -->
     <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
       <div class="modal-dialog" role="document">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
           </div>
           <div class="modal-body">
                <h5 class="modal-title" id="exampleModalLabel">user</h5>
              <div id="profile-details">
                 <table class="table">
                    <tbody>
                      <tr>
                        <th scope="row">ID</th>
                        <td><% int id=(int)session.getAttribute("partyId"); out.print(id); %>
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">EMAIL-ADDRESS</th>
                        <td><% String email=(String)session.getAttribute("userLogin"); out.print(email); %>
                        </td>
                      </tr>
                      <tr>
                         <th scope="row">FIRST NAME:</th>
                         <td> <% String firstName=(String)request.getAttribute("firstName"); out.print(firstName); %>
                        </td>
                      </tr>
                      <tr>
                         <th scope="row">LAST NAME:</th>
                         <td><% String lastName=(String)request.getAttribute("lastName"); out.print(lastName); %>
                         </td>
                      </tr>
                      <tr>
                         <th scope="row">ADDRESS:</th>
                         <td><%  String address=(String)request.getAttribute("address"); out.print(address); %>
                         </td>
                      </tr>
                      <tr>
                         <th scope="row">CITY:</th>
                         <td><% String city=(String)request.getAttribute("city"); out.print(city); %>
                         </td>
                      </tr>
                      <tr>
                         <th scope="row">ZIP:</th>
                         <td><% String zip=(String)request.getAttribute("zip"); out.print(zip); %>
                         </td>
                      </tr>
                      <tr>
                         <th scope="row">STATE:</th>
                         <td><% String state=(String)request.getAttribute("state"); out.print(state); %>
                         </td>
                      </tr>
                      <tr>
                          <th scope="row">COUNTRY:</th>
                          <td><% String country=(String)request.getAttribute("country");out.print(country); %>
                          </td>
                      </tr>
                      <tr>
                          <th scope="row">MOBILE-NO:</th>
                          <td><%  String phone=(String)request.getAttribute("phone"); out.print(phone); %>
                          </td>
                      </tr>
                    </tbody>
                 </table>
              </div>
              <div id="profile-edit" style="display: none;">
                 <h2>Please Edit Carefully</h2>
                    <form action="EditServlet" method="post">
                       <table class="table">
                           <tr>
                              <td>PartyId</td>
                              <td>"<% out.print(id); %>"</td>
                           </tr>
                           <tr>
                              <td>EMAIL-ADDRESS</td>
                              <td><input type="email"  class="form-control" name="userMail" value="<% out.print(email);%>"></td>
                           </tr>
                               <tr>
                               <td>FIRST-NAME</td>
                               <td><input type="text"  class="form-control" name="userFirstName" value="<% out.print(firstName); %>"></td>
                           </tr>
                           <tr>
                              <td>LAST-NAME</td>
                              <td><input type="text"  class="form-control" name="userLastName" value="<% out.print(lastName); %>"></td>
                           </tr>
                           <tr>
                                <td>ADDRESS</td>
                                <td><input type="text"  class="form-control" name="userAddress" value="<% out.print(address); %>"></td>
                           </tr>
                           <tr>
                               <td>CITY</td>
                               <td><input type="text"  class="form-control" name="userCity" value="<% out.print(address); %>"></td>
                           </tr>
                           <tr>
                               <td>ZIP</td>
                               <td><input type="text" class="form-control" name="userZip" value="<% out.print(zip); %>"></td>
                           </tr>
                           <tr>
                              <td>STATE</td>
                              <td><input type="text"  class="form-control" name="userState" value="<% out.print(state); %>"></td>
                           </tr>
                           <tr>
                               <td>COUNTRY</td>
                               <td><input type="text"  class="form-control" name="userCountry" value="<% out.print(country); %>"></td>
                               </tr>
                           <tr>
                                <td>MOBILE-NO</td>
                                <td><input type="text"  class="form-control" name="userPhone" value="<% out.print(phone); %>"></td>
                           </tr>
                       </table>
                       <div class="container">
                       <button type="submit" class="btn btn-outline-primary">SAVE</button>
                       </div>
                    </form>
                 </div>
              </div>
              <div class="modal-footer">
                 <button id="edit-profile-button"type="button" class="btn btn-primary">Edit</button>
                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
           </div>
         </div>
       </div>
     </div>
     <section >
        <div class="container">
           <div class="cardContainer">
              <div class="card">
                 <div class="card__content">
                    <h3 class="card__header">Card 1</h3>
                    <p class="card__info">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                    <button class="card__button">Read now</button>
                 </div>
              </div>
           </div>
        </div>
     </section>
     <!-- Button trigger modal -->
        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
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