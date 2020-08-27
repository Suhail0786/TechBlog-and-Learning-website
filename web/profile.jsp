
<%@page import="com.cod.techy.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cod.techy.dao.PostDao"%>
<%@page import="com.cod.techy.helper.ConnectionProvider"%>
<%@page import="com.cod.techy.entities.Message"%>
<%@page import="com.cod.techy.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%

User user=(User) session.getAttribute("currentUser");
if(user==null){
    response.sendRedirect("login_page.jsp");
}

%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Favicons -->
        <link href="img/favicon.png" rel="icon">
        <link href="img/apple-touch-icon.png" rel="apple-touch-icon"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

 
  <!--W3 Icons-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">


<!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">
  <style>
       body{
          background-color: #0056b3;
          background-size: cover;
          background-attachment: fixed;
      }
  </style>
        <title>Profile Page</title>
    </head>
    <body>
        <!--==========================
  Header
  ============================-->
  <header id="header" class="fixed-top">
    <div class="container">

      <div class="logo float-left">
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <h1 class="text-light"><a href="#header"><span>NewBiz</span></a></h1> -->
        <a href="#intro" class="scrollto"><img src="img/logo.png" alt="" class="img-fluid"></a>
      </div>

      <nav class="main-nav float-right d-none d-lg-block">
        <ul>
            <li class="active"><a  href="index.jsp"><span class="fa fa-home"></span>Home</a></li>
            
          <li><a href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-plus-circle"></span>Post</a></li>
          
          <li class="drop-down"><a href="#courses"><span class="fa fa-pencil"></span>Courses</a>
            <ul>
              <li><a href="#core java">Core Java</a></li>
              <li><a href="#manual">Manual Testing</a></li>
              <li><a href="#selenium">Selenium</a></li>
              <li><a href="#ad java">Advance Java</a></li>
              <li><a href="#database">Database</a></li>
              <li><a href="#web">Web Development</a></li>
              <li><a href="#app">App Development</a></li>
              <li><a href="#tools">Tools And IDE</a></li>
            </ul>
          </li>
          
         
          <li><a href="LogoutServlet"><span class="fa fa-user-o"></span>Logout</a></li>
          <li><a href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%=user.getName()%></a></li>
          
        </ul>
      </nav><!-- .main-nav -->
      
      <br><br><br>
       <%
                            Message m =(Message) session.getAttribute("msg");
                            if(m!=null)
                            {
                                %>
                                <div class="alert <%= m.getCssClass()%>" role="alert">
                                    <%= m.getContent()%>
                                </div>
                                
                                <%
                                    session.removeAttribute("msg");
                            }
                            %>
    </div>
           
  </header><!-- #header -->
  
  <br><br><br>   
  <!--main body of the page-->
  <main>
      <div class="container">
          <div class="row mt-4">
              
              <div class="col-md-4">
                  <!--categories-->
                  <div class="list-group">
                      <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                      All Posts
                    </a>
                      <!--categories-->
                      <%
                          PostDao dao = new PostDao(ConnectionProvider.getConnection());
                          ArrayList<Category> list1= dao.getAllCategories();
                          for(Category cc:list1)
                          {
                              %>
                                 <a href="#" onclick="getPosts(<%= cc.getCid()%>,this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
                              <%
                          }
                      %>
                   
                    
                  </div>
              </div>
              
                      <div class="col-md-8">
                  <!--Post-->
                  <div class="container text-center" id="loader">
                      <i class="fa fa-refresh fa-4x fa-spin"></i>
                      <h3 class="mt-2">Loading...</h3>
                  </div>
                  
                  <div class="container-fluid" id="post-container">
                      
                  </div>
              </div>
          </div>
      </div>
  </main>
  
  <!--end of main body-->
  
  <!--Profile Modal--!>

<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title bg-primary text-white" id="exampleModalLabel">CodTechy</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <img src="pics/<%=user.getProfile()%>">
              <br>
              <h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
              
              <!--details-->
              <div id="profile-details">
              <table class="table">
                <tbody>
                  <tr>
                    <th scope="row">ID :</th>
                    <td><%=user.getId()%></td>
                   
                  </tr>
                  <tr>
                    <th scope="row">Email :</th>
                    <td><%=user.getEmail()%></td>
                    
                  </tr>
                  <tr>
                    <th scope="row">Gender :</th>
                    <td><%=user.getGender()%></td>
                   
                  </tr>
                   <tr>
                    <th scope="row">Status :</th>
                    <td><%=user.getAbout()%></td>
                   
                  </tr>
                  <tr>
                    <th scope="row">Joined On :</th>
                    <td><%=user.getDateTime().toString()%></td>
                   
                  </tr>
                </tbody>
              </table>
              </div>
              
                    
             <!--Profile Edit-->
             <div id="profile-edit" style="display: none">
                 <h3 class="mt-2">Please Edit Carefully</h3>
                 <form action="EditServlet" method="post" enctype="multipart/form-data">
                     <table class="table">
                         <tr>
                             <td>ID :</td>
                             <td><%=user.getId()%></td>
                         </tr>
                         <tr>
                             <td>Email :</td>
                             <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                         </tr>
                         <tr>
                             <td>Name :</td>
                             <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                         </tr>
                         <tr>
                             <td>Password :</td>
                             <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                         </tr>
                         <tr>
                             <td>About :</td>
                             <td><textarea type="about" rows="2" class="form-control" name="user_about" value="<%= user.getAbout()%>"></textarea></td>
                         </tr>
                         <tr>
                             <td>Profile Pic :</td>
                             <td><input type="file" class="form-control" name="image" ></td>
                         </tr>
                     </table>
                         
                         <div class="container">
                             <button type="submit" class="btn btn-outline-primary">Save</button>
                         </div> 
                 </form>
             </div>
                    
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
      </div>
    </div>
  </div>
</div>
         <!--end of profile modal                
                         
        <!--add post modal-->
        
      

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Post Something..</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form id="add-post-form" action="AddPostServlet" method="post">
              <div class="form-group">
                  <select class="form-control" name="cid">
                      <option selected disabled>--Select Category--</option>
                      
                      <%
                          PostDao pdao = new PostDao(ConnectionProvider.getConnection());
                          ArrayList<Category> list = pdao.getAllCategories();
                          for(Category c:list)
                            {
                      %>
                 
                      <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                    <%
                            }
                    %>
              </select>
              </div>
              <div class="form-group">
                  <input name="pTitle" type="text" placeholder="Title" class="form-control"/>
              </div>
              <div class="form-group">
                  <textarea name="pContent" class="form-control" placeholder="Content"></textarea>
              </div>
               <div class="form-group">
                   <textarea name="pCode" class="form-control" style="height:150px" placeholder="Codes (if any)"></textarea>
              </div>
              <div class="form-group"
                   <label>Select Pic to upload</label>
                  <br>
                  <input type="file" name="pic">
              </div>
              <div class="form-group"
                   <link class="form-control" />
              </div>
              <div class="container text-center">
                  <button type="submit" class="btn btn-outline-primary">Post</button>
              </div>
              
          </form>
      </div>
      
    </div>
  </div>
</div>
        
  
   <!-- JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/jquery/jquery-migrate.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/mobile-nav/mobile-nav.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/waypoints/waypoints.min.js"></script>
  <script src="lib/counterup/counterup.min.js"></script>
  <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="lib/isotope/isotope.pkgd.min.js"></script>
  <script src="lib/lightbox/js/lightbox.min.js"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
   <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>
  
  <script>
      $(document).ready(function(){
          let editStatus=false;
          
          $('#edit-profile-button').click(function()
          {
             if(editStatus === false)
             {
                 $('#profile-details').hide();
             
                 $('#profile-edit').show();
                 editStatus=true;
                 $(this).text("BACK");
             }
             else
             {
                   $('#profile-details').show();
             
                   $('#profile-edit').hide();
                   editStatus=false;
                    $(this).text("EDIT");
             }
          });
      });
  </script>
  
  <!--now add post js-->
  <script>
      $(document).ready(function(e){
          $("#add-post-form").on("submit",function(event){
              //this code gets called when form is submitted...
              event.preventDefault();
              console.log("you have clicked on submit..");
              let form = new FormData(this);
              
              //now requesting to server
              $.ajax({
                  url: "AddPostServlet",
                  type: 'Post',
                  data: form,
                  success: function(data,textStatus,jqXHR){
                      //success..
                      if(data.trim() === 'done')
                      {
                          swal("Good job!", "Posted Successfully", "success");
                      }
                      else
                      {
                          swal("Error!", "Something went wrong try again..", "error");
                      }
                  },
                  error: function(jqXHR,textStatus,errorThrown){
                      //error...
                       swal("Error!", "Something went wrong try again..", "error");
                  },
                  processData: false,
                  contentType: false
              });
          });
      });
  </script>
  
  <!--loading post using ajax-->
  <script>
      
      function getPosts(catid,temp){
          $("#loader").show();
          $("#post-container").hide();
          $(".c-link").removeClass('active');
          $.ajax({
                url: "load_post.jsp",
                data: {cid:catid},
               success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                    } 
            });
      }
      $(document).ready(function (e){
          let allPostRef=$('.c-link')[0];
            getPosts(0,allPostRef);
    });
  </script>
     
    </body>
</html>
