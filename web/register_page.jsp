
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Register Page</title>
        
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        
    </head>
    <body>
         <!--navbar-->
  <!--     Header
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
          
          <li><a href="register_page.jsp"><span class="fa fa-user-plus fa-spin"></span>Register</a></li>
          <li><a href="login_page.jsp"><span class="fa fa-user"></span>Login</a></li>
        </ul>
      </nav><!-- .main-nav -->
      
    </div>
  </header><!-- #header -->
        <br><br>
        <main class="d-flex align-items-center bg-primary" style="height:100vh">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            
                        </div>
                        <div class="card-body">
                            <div class="login-form">
                                        <form id="reg-form" action="RegisterServlet" method="post">
                                            <h2 class="text-center bg-primary text-white">Register</h2>       
                                            <div class="form-group">
                                                <input name="user_name" type="text" class="form-control" id="username" placeholder="Username" required="required">
                                            </div>
                                             <div class="form-group">
                                                <input name="user_email" type="email" class="form-control" id="email" placeholder="Email" required="required">
                                            </div>
                                            <div class="form-group">
                                                <input name="user_pass" type="password" class="form-control" id="password" placeholder="Password" required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="gender">Select Gender</label>
                                                <br>
                                                <input type="radio"  id="gender" required="required" name="gender" value="male">Male
                                                <input type="radio"  id="gender" required="required" name="gender" value="female">Female
                                            </div>
                                            <div class="form-group">
                                                <textarea name="about" class="form-control" id="" rows="5" placeholder="Enter Something about yourself"></textarea>
                                            </div>
                                              <div class="clearfix">
                                                <label class="float-left form-check-label"><input name="check" type="checkbox">Agree Terms And Conditions</label>
                                            </div>
                                            <div class="container text-center" id="loader" style="display: none">
                                                <span class="fa fa-refresh fa-spin fa-2x"></span>
                                                <h4>Please Wait..</h4>
                                            </div>
                                            <div class="form-group">
                                                <button id="submit-btn" type="submit" class="btn btn-primary btn-block">Register</button>
                                            </div>
                                          
                                        </form><br>
                                        <p class="text-center"><a href="login_page.jsp">Login</a></p>
                                    </div>    
                        </div>
                       
                    </div>
                    
                </div>
                
            </div>
            
        </main>
        
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
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
  
  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>      
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
    $(document).ready(function(){
        console.log("loaded...");
        
        $('#reg-form').on('submit',function(event){
            event.preventDefault();
            
            let form=new FormData(this);
            
            $("#submit-btn").hide();
            $("#loader").show();
            //send register servlet
            $.ajax({
               url:"RegisterServlet",
               type: 'Post',
               data: form,
               success: function(data,textStatus,jqXHR)
               {
                   console.log(data);
                   $("#submit-btn").show();
                   $("#loader").hide();
                   
                   if(data.trim()==='done')
                   {
                    swal("Registered Successful..We are redirect to login page")
                    .then((value) => {
                     window.location="login_page.jsp";
                    });
                   }else
                   {
                    swal(data);
                   }
               },
               error: function(jqXHR,textStatus,errorThrown)
               {
                   console.log(jqXHR);
                    $("#submit-btn").show();
                   $("#loader").hide();
                     swal("Something went wrong..try again");
                    
               },
               processData: false,
               contentType: false
            });
        });
    });
    
    
    
</script>
    </body>
</html>
