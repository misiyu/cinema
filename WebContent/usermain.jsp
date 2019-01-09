<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">

    <title>欢迎来到影音魔方</title>

    <!-- Bootstrap core CSS -->
    

    <!-- Custom styles for this template -->
    <!--
    <link href="./use/starter-template.css" rel="stylesheet">
    -->
     
     <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
     <!--~icon~-->
     <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous"> 
     
     <link rel="stylesheet" type="text/css" href="./use/user_main.css">
    

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./use/ie-emulation-modes-warning.js"></script>

</head>
 <%
  String message=(String)session.getAttribute("message");
  if(message!=null){
%>
    <script type="text/javascript">
      alert("<%=message%>");
    </script>
<%
    session.removeAttribute("message");
  }
%>
<body>
	
	<header class="dash-header">
      <div class="container">
        <div class="col-md-12">
          
            <a class="logo" href="index.htm">MovieInMagic</a>
            <a href="#" class="exp">hh</a>
          
          <div class="dropdown account-dropdown pull-right">
            <a href="#" class="btn acc-btn" href="login">Sign Up</a>
            <a  class="btn acc-btn" href="signouter">Login</a>
            
                 
          </div>


        </div>

      </div>
    </header>


    <div class="container">
      <div class="col-md-12 colored">
      <div class="concustom ">
        <h2>主界面</h2>
        <span class="fa fa-university bigicon"></span>

        <div class="row inner1">
          
          <div class=" concustom">
          
            <div class="well">

              <div class="col-md-4">                
                <form method="post" action="usermain.jsp">
                      <input type="submit" value="影音主页" class="btn btn-primary btnPosition" />
                </form>
              </div>

              <div class="col-md-4">
                <form method="post" action="Admin/listAlluserServlet">

                      <input type="submit" value="基础数据管理" class="btn btn-danger btnPosition" />
                </form>
             </div>

              <div class="col-md-4">  
                  <form method="post" action="movieChoose.jsp">                       
                        <input type="submit" value="我的魔方影音" class="btn btn-success btnPosition" >
                  </form>               
              </div> 

            </div>              
            <hr>
            
              <p>欢迎您登陆我们的系统 ~</p>
                <hr class="prettyline">

              <!-- Start Table  -->
                <div class="page-header text-center">
                    <h1 id="timeline">Function Table</h1>
                </div>
                <ul class="timeline">
                    <li>
                      <div class="timeline-badge primary">
                      <a><i class="fa fa-envira" rel="tooltip" title="" id="">
                      </i></a></div>
                      <div class="timeline-panel">
                        <div class="timeline-heading">
                          <img class="icon-pg" src="./images/user.png" alt="pic1" />
                          
                        </div>
                        <div class="timeline-body">
                          <h1>魔方影音</h1>
                          <p>用户登陆后</p>                  
                        </div>

                        <div class="timeline-footer">
                            
                            <a class="pull-right btn btn-default" href="signouter" >Click me</a>
                        </div>
                      </div>
                    </li>
                    
                    <li  class="timeline-inverted">
                      <div class="timeline-badge primary">
                      <a><i class="fa fa-envira invert" rel="tooltip" title="" id=""></i></a></div>
                      <div class="timeline-panel">
                        <div class="timeline-heading">
                          <img class="icon-pg" src="./images/then.png" alt="pic2"/>
                          
                        </div>
                        <div class="timeline-body">
                          
                         <h1>人员信息管理</h1>
                        </div>
                        
                        <div class="timeline-footer">
                            
                             <form method="post" action="Admin/listAlluserServlet">
                              <input type="submit" value=" Click me" class="pull-right btn btn-primary" />
                            </form>
                        </div>
                      </div>
                    </li>

                    <li>
                      <div class="timeline-badge primary">
                      <a><i class="fa fa-envira" rel="tooltip" title="" id="">
                      </i></a></div>
                      <div class="timeline-panel">
                        <div class="timeline-heading">
                          <img class="icon-pg" src="./images/mv.png" alt="pic1" />
                          
                        </div>
                        <div class="timeline-body">                          
                          <h1>电影数据库</h1>                 
                        </div>

                        <div class="timeline-footer">
                            <form method="post" action="Movie/ListAllmovieServlet">
                              <input type="submit" value=" Click me" class="pull-right btn btn-warning" />
                            </form>
                            
                        </div>
                      </div>
                    </li>

                    <li  class="timeline-inverted">
                      <div class="timeline-badge primary">
                      <a><i class="fa fa-envira invert" rel="tooltip" title="" id=""></i></a></div>
                      <div class="timeline-panel">
                        <div class="timeline-heading">
                          <img class="icon-pg" src="./images/list.png" alt="pic2"/>
                          
                        </div>
                        <div class="timeline-body">                         
                          <h1>订单信息查看</h1>
                        </div>
                        
                        <div class="timeline-footer">
                            
                            <form method="post" action="Admin/ListAllordersServlet">
                              <input type="submit" value="Click me" class="pull-right btn btn-success" />
                            </form>
                        </div>
                      </div>
                    </li>

                    
                    
                    
                    <li class="clearfix" style="float: none;"></li>
                </ul>


              <!-- End Table  -->


          </div>
          
        </div>

          
      </div>

      </div>    
    </div>

    <footer class="site-footer">

    <p>Silence's Work @甘佳洛</p>

      
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

</body>
</html>