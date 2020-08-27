

<%@page import="com.cod.techy.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
    <head>
     
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta content="" name="keywords">
  <meta content="" name="description">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
       <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
  
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

<!--css-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <title>Login Page</title>
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
        
        <main class="d-flex align-items-center bg-primary" style="height:100vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-3">
                        <div class="card">
                            <div class="card-header">
                            </div>
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
                            <div class="card-body">
                                <div class="login-form">
                                        <form action="LoginServlet" method="post">
                                            <h2 class="text-center">Log in</h2>       
                                            <div class="form-group">
                                                <input name="email" type="email" class="form-control" placeholder="Email" required="required">
                                            </div>
                                            <div class="form-group">
                                                <input name="password" type="password" class="form-control" placeholder="Password" required="required">
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary btn-block">Log in</button>
                                            </div>
                                            <div class="clearfix">
                                                <a href="#" class="text-center">Forgot Password?</a>
                                            </div>        
                                        </form><br>
                                        <p class="text-center"><a href="register_page.jsp">Create an Account</a></p>
                                    </div>
                            </div>
                            
                        </div>
                    
                </div>
                
            </div>
        </main>
     
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
  
    </body>
</html>
