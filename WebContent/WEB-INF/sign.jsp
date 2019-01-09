<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0048)http://v3.bootcss.com/examples/starter-template/ -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">

    <title>登录</title>

    <!-- Bootstrap core CSS -->
    

    <!-- Custom styles for this template -->
    <!--
    <link href="./use/starter-template.css" rel="stylesheet">
    -->
     
     <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
     <!--~icon~-->
     <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous"> 
     
     <link rel="stylesheet" type="text/css" href="./use/login.css">
    

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./use/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body bcloud="bcloud_1.2">
    <!--
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="http://v3.bootcss.com/examples/starter-template/#">Project name</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="http://v3.bootcss.com/examples/starter-template/#">Home</a></li>
            <li><a href="http://v3.bootcss.com/examples/starter-template/#about">About</a></li>
            <li><a href="http://v3.bootcss.com/examples/starter-template/#contact">Contact</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container">

      <div class="starter-template">
        <h1>Bootstrap starter template</h1>
        <p class="lead">Use this document as a way to quickly start any new project.<br> All you get is this text and a mostly barebones HTML document.</p>
      </div>

    </div>
    -->
    <header class="dash-header">
      <div class="container">
        <div class="col-md-12">
          
            <a class="logo" href="index.htm">MovieInMagic</a>
            <a href="#" class="exp">hh</a>
          
          <div class="dropdown account-dropdown pull-right">
            <a href="button" class="btn acc-btn">Sign Up</a>
            <a href="button" class="btn acc-btn">Login</a>       
          </div>


        </div>

      </div>
    </header>


    <div class="container">
      <div class="col-md-12 colored">
  <div class="concustom">
	<section class="main-col">
	  <span class="fa fa-paper-plane-o bigicon"></span>
	  <div class="panel">
		<div class="row page-heading ">
		  <div class="col-xs-6" >
			<a href="#" class="h2 active" id="login-form-link">Login</a>
			
		  </div>
		  <div class="col-xs-6" >              
			<a href="#" class="h2 " id="register-form-link">Create Account</a>
		  </div>
		</div>

		<hr class="prettyline" />

		<form class="login-form" accept-charset="UTF-8" action="login" method="post" style="display:block">
            	<font color="blue">${error}</font>
            	<div class="row">
            		<div class="form-group col-sm-12">
                  
                  <div class="input-group">
                    <span class="input-group-addon" > <i class="glyphicon glyphicon-user"></i></span>
                    <input type="email" name="user[email]" class="form-control" placeholder="Email" autofocus="autofocus">
                  </div>

            			<!--
                  <div class="input-group">
                    <span class="input-group-addon" > <i class="fa fa-"></i></span>
                  </div>
                  -->


            		</div>           		
            	</div>
            	<div class="row">
            		<div class="form-group col-sm-12">
                  <div class="input-group">
                    <span class="input-group-addon" > <i class="fa fa-lock"></i></span>
                    <input type="password" name="user[password]" placeholder="Password" class="form-control" >
                  </div>
            						
            		</div>
            	</div>
            	<div class="">
            		<input type="submit" name="commit" value="Log in" class="button huge">
            		<div class="forget1">
            			<a href="#">Forgot password</a>
            		</div>
            	</div>
            </form> 

            <form class="register-form" accept-charset="UTF-8" action="register"  method="post" style="display:none">
				<font color="blue">${registererror}</font>
				<font color="blue" id="passwordDistError"></font>
              <div class="row">
                <div class="form-group col-sm-12">
                  <div class="input-group">
                    <span class="input-group-addon" > <i class="fa fa-user"></i></span>

                    <input class="form-control" 
                    type="text" name="user[firstname]" id="user_...." placeholder="Full Name" autofocus="autofocus">
                  </div>


                </div>
                <!---
                <div class="form-group col-sm-6">                 
                    <input class="form-control" 
                    type="text" name="user[lastname]" id="user_...." placeholder="Last Name" autofocus="autofocus">                 
                </div> 
                -->              
              </div>

              <div class="row">
                <div class="form-group col-sm-12">
                  <div class="input-group">
                    <span class="input-group-addon" > <i class="fa fa-envelope"></i></span>
                    <input type="email" name="user[email]" class="form-control" placeholder="Email" autofocus="autofocus">
                  </div>
                  
                </div>
              </div>

              <div class="row">
                <div class="form-group col-sm-12">
                  <div class="input-group">
                    <span class="input-group-addon" > <i class="fa fa-suitcase"></i></span>
                    <input type="password" name="user[password]" placeholder="Password" class="form-control" id="registerPassword1" >
                  </div>
                  
                </div>
              </div>

              <div class="row">
                <div class="form-group col-sm-12">
                  <div class="input-group">
                    <span class="input-group-addon" > <i class="fa fa-suitcase"></i></span>
                    <input type="password" name="user[password]" placeholder="Confirm Password" class="form-control" id="registerPassword2">
                  </div>
                  
                </div>
              </div>

              <div>
                <div class="checkbox">
                  <label>
                    <input type="hidden" name="user[opt]" value="0">
                    <input type="checkbox" name="user...." value="1" checked="unchecked"> <span class="p1">åæä¸è¿°æ¡æ¬¾ï¼æä¸ºæä»¬çä¸å</span> 
                  </label>
                </div>
                
              </div>

              <div class="">
                <input type="submit" name="commit" value="Get Started" class="button huge" onmouseover="checkPassword();">
              </div>
              
            </form>





          </div>         
        </section> 
        </div>

      </div>    
    </div>

    <footer class="site-footer">

  	<p>Silence's Work @çä½³æ´</p>

    	
    </footer>





    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./use/jquery.min.js"></script>
    <script src="./use/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./use/ie10-viewport-bug-workaround.js"></script>
    <script type="text/javascript">
      $('#login-form-link').click(function(e){
        $('.login-form').delay(100).fadeIn(100);
        $('.register-form').fadeOut(100);
        $('#register-form-link').removeClass('active');
        $(this).addClass('active');
        e.preventDefault();
        console.log('Login Happen');

      });
      $('#register-form-link').click(function(e){
        $('.register-form').delay(100).fadeIn(100);
        $('.login-form').fadeOut(100);
        $('#login-form-link').removeClass('active');
        $(this).addClass('active');
        e.preventDefault();
        console.log('Register Happen');
      });

	
    </script>
	<script type="text/javascript" charset="utf-8">
		function checkPassword()
		{
			var password1 = document.getElementById("registerPassword1").value;
			var password2 = document.getElementById("registerPassword2").value;
			if(password1 != password2)
				document.getElementById("passwordDistError").innerText="密码不一致，请重新输入。";
			else
				document.getElementById("passwordDistError").innerText="";
		}
</script>
  

</body></html>
