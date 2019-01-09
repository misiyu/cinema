<%@page import="com.entity.Movie"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- saved from url=(0048)http://v3.bootcss.com/examples/starter-template/ -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">

    <title>电影信息展示</title>

    <!-- Bootstrap core CSS -->
    

    <!-- Custom styles for this template -->
    <!--
    <link href="./use/starter-template.css" rel="stylesheet">
    -->
     
     <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
     <!--~icon~-->
     <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous"> 
     
     <link rel="stylesheet" type="text/css" href="../funcss/listshow.css">
    

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../use/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
      /*判断是否为空*/
      function isEmpty(value) {
    return /^\s*$/.test(value);
      }

      function isDouble(str) {
    var Letters = "1234567890.";
    for (var i = 0; i < str.length; i = i + 1) {
      var CheckChar = str.charAt(i);
      if (Letters.indexOf(CheckChar) == -1) {
        return false;
      }
    }
    return true;
  }

    function isZero(str) {
    var Letters = "0";
    for (var i = 0; i < str.length; i = i + 1) {
      var CheckChar = str.charAt(i);
      if (Letters.indexOf(CheckChar) == -1) {
        return false;
      }
    }
    return true;
  }

    function checkse(){
      console.log("---: selectDtype"+document.myform.type.value)

      if(isEmpty(document.myform.area.value)  
        &&isEmpty(document.myform.moviename.value)  
        &&isZero(document.myform.type.value)
        &&isEmpty(document.myform.score1.value)
        &&isEmpty(document.myform.score2.value)
        &&isEmpty(document.myform.contentype.value)
        ){
        alert("搜索条件不能为空！");
        document.myform.area.focus();
        return false;
        }
      if(!isEmpty(document.myform.score1.value)&&!isDouble(document.myform.score1.value)){
        alert("下界不正确！");
        document.myform.score1.focus();
        return false;
      }
      if(!isEmpty(document.myform.score2.value)&&!isDouble(document.myform.score2.value)){
        alert("下界不正确！");
        document.myform.score2.focus();
        return false;
      }
      /*
       if(!isEmpty(document.myform.type.value)&&isZero(document.myform.type.value)){
        alert("类型未选择！");
        document.myform.type.focus();
        return false;
      }
      */





    }


    </script>

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

  <body bcloud="bcloud_1.2">

   
    <header class="dash-header">
      <div class="container">
        <div class="col-md-12">
          
            <a class="logo" href="index.htm">MovieInMagic</a>
            <a href="#" class="exp">中文解释</a>
          
          <div class="dropdown account-dropdown pull-right">
            <a href="button" class="btn acc-btn">Sign Up</a>
            <a href="button" class="btn acc-btn">Login</a>       
          </div>


        </div>

      </div>
    </header>
   


    <div class="container">
      <div class="col-md-12 colored">
      <div class="concustom ">


         <div class="well">

              <div class="col-md-4">                
                <form method="post" action="../usermain.jsp">
                      <input type="submit" value="影音主页" class="btn btn-primary btnPosition" />
                </form>
              </div>

              <div class="col-md-4">
                <form method="post" action="../Admin/listAlluserServlet">

                      <input type="submit" value="基础数据管理" class="btn btn-danger btnPosition" />
                </form>
             </div>

              <div class="col-md-4">  
                  <form method="post" action="../User/movieChoose.jsp">                       
                        <input type="submit" value="我的魔方影音" class="btn btn-success btnPosition" >
                  </form>               
              </div> 

            </div>
        
           
        <div class="concustom1">
          <div class="nav-list">
            <div class="navbar-collapse collapse in" id="order_navbar" >
              <ul class="nav nav-justified nav-pills hovercssa">
                <!--  Admin_Control User_Control Emplyee_Con  Mv_Data-->
                
                <li class="">               
                <form method="post" action="#">                       
                        <input type="submit" value="管理员" class="btn btn-default btnPosition" >
                </form>
                </li>

                <li class="active">               
                <form method="post" action="../Admin/listAlluserServlet">                       
                        <input type="submit" value="用户信息" class="btn btn-success btnPosition" >
                </form>  
                </li>


                <li class="">               
                <form method="post" action="#">                       
                        <input type="submit" value="员工信息" class="btn btn-info btnPosition" >
                </form>
                </li>

                <li class="">                
                <form method="post" action="../Movie/ListAllmovieServlet">                       
                        <input type="submit" value="电影库信息" class="btn btn-success btnPosition" >
                </form>  
                </li>

                <li class="">               
                <form method="post" action="#">                       
                        <input type="submit" value="排片信息" class="btn btn-warning btnPosition" >
                </form>
                </li>

                <li class="">               
                <form method="post" action="#">                       
                        <input type="submit" value="订单信息" class="btn btn-danger btnPosition" >
                </form>
                </li>
                          
              </ul>
              
            </div>
          </div>
              
            
              
            <hr class="prettyline">
            <div class="tablepos">
              <!-- Start Table  -->
              
                <div class="panel panel-default">
                  <div class="panel-heading fix">
                    <div class="col-md-7"><h4 class="pull-left">Information Management</h4></div>
                    <div class="col-md-5"><a class="pull-right btn btn-default" href="addMovie.jsp">
                      
                      <i class="fa fa-plus">Add</i>
                    </a></div>               
                  </div>
                  <div id="collapseone">
                    <div class="panel-body">
                    <form method="post" action="SearchMovServlet" name="myform">
                      <table class="table-responsive">
                        <table class="table table-bordered table-hover table-striped">
                          <thead>
                            <tr>
                              <th align="center" scope="col" colspan="16" class="title_tbody">
                                <span class="">Input the data</span>
                              </th>
                            </tr>
                          
                            <tr>
                            <th scope="col" colspan="2">
                                <b>地区</b>
                                
                            </th>
                            <th scope="col" colspan="1">
                                
                                <input type="" name="area" value="" class="spinput">
                            </th>
                            <th scope="col" colspan="1">

                                <span>电影名</span>
                            </th>
                            <th scope="col" colspan="4">

                                <input type="" name="moviename" value="" class="spinput" display="width:100%">
                            </th>
                            <th scope="col" colspan="4">

                                <span>放映类型</span>
                            </th>
                            <th scope="col" colspan="4">

                                <!--<input type="" name="signtype" value="">-->
                               <select class="form-control" name="type">
                                  <option value="0" selected>选择你的电影类型</option>
                                  <option value="2">2D</option>
                                  <option value="3">3D</option>                              
                              </select> 
                            </th>
                          </tr>
                          <tr>
                            <th scope="col" colspan="2">

                                <span>豆瓣评分</span>
                            </th>
                            <th scope="col" colspan="1">

                                <input type="" name="score1" value="" class="spinput">
                            </th>
                            <th scope="col" colspan="1">

                                <b>到</b>
                            </th>
                            <th scope="col" colspan="1">

                                <input type="" name="score2" value="" class="spinput">
                            </th>

                            <th scope="col" colspan="3" >

                                <span>电影类型</span>
                            </th>
                            <th scope="col" colspan="3">

                                <input type="" name="contentype" value="" class="spinput">
                            </th>
                           



                            <th scope="col" colspan="4">

                                
                                <input type="submit" name="search" class="btn btn-primary btnsearch" onclick="return checkse();">
                            </th>

                          </tr>

                          <tr>
                            <th width="10%" scope="col" colspan="2">
                              <b>movieid</b>
                            </th>
                            <th width="15%" scope="col" colspan="2">
                              <b>moviename</b>
                            </th>
                            <th width="10%" scope="col" colspan="2">
                              <b>director</b>
                            </th>
                            <th width="10%" scope="col" colspan="2">
                              <b>area</b>
                            </th>
                            <th width="5%" scope="col" colspan="2">
                              <b>Dtype</b>
                              
                            </th>
                            <th width="5%" scope="col" colspan="2">
                              <b>score</b>
                              
                            </th>
                            <th width="5%" scope="col" colspan="2">
                              <b>time</b>
                              
                            </th>
                            
                            <th width="15%" scope="col" colspan="2">
                              <b>operation</b>
                            </th>
                            
                            
                              
                          </tr>
                          </thead>
                          <tbody>
                           
                           
                          <%
                            LinkedList<Movie> list=(LinkedList<Movie>)request.getAttribute("list");
                            if(list!=null){
                              int i =1;
                              for(int j=0;j<list.size();j++){
                            	  Movie mov = (Movie)list.get(j);
                              
                              
                              
                            
                          %>
                          <tr>
                            <td width="10%" scope="col" colspan="2">
                              <%=mov.getiD() %>
                              <a></a>
                            
                            </td>
                            <td width="15%" scope="col" colspan="2">
                              <%=mov.getMovieName()%>
                              <a></a>
                            
                            </td>
                            <td width="10%" scope="col" colspan="2">
                              <%=mov.getDirector() %>
                              <% %>
                              <a></a>
                            
                            </td>
                            <td width="10%" scope="col" colspan="2">
                               <%=mov.getOrigins() %>
                              <a></a>
                            
                            </td>
                            <td width="5%" scope="col" colspan="2">
                          <%=mov.getD_type() %>
                         
                                                                                  
                            </td >

                            <td width="5%" scope="col" colspan="2">
                              <%=mov.getScore() %>
                            </td >

                            <td width="5%" scope="col" colspan="2">
                              <%=mov.getTime() %>
                            </td  >
                               
                            <td width="15%" scope="col" colspan="2" >
                              <a class="btn btn-primary btn-sm" href="DelMovieServlet?userId=<%=mov.getiD()%>">Delete</a>
                              <a class="btn btn-primary btn-sm" href="ShowMovServlet?userId=<%=mov.getiD()%>">Change</a>
                            </td>
                           </tr>
                          
                          <%
                              }                             
                                }
                          %>
                          
                          </tbody>
                        <tbody>
          <tr>            
          
          <%
            Integer pageCount=(Integer)request.getAttribute("pageCount");//sum_pages
            Integer CurPage=(Integer)request.getAttribute("CurPage");//current_page
            
            
            if(pageCount!=null&&CurPage!=null){
              if(pageCount!=0&&CurPage!=1){

          %>
               
                <form>                  
                </form>
                <td width="" scope="col" colspan="5" >
                <div class="">
                <form method="post" action="../Movie/ListAllmovieServlet?CurPage=<%=CurPage-1 %>">                       
                        <input type="submit" value="前一页" class="btn btn-default btn-sm fullblank" >
                </form>  
                </div>
                </td>
                

          <%
              }
          %>
          <%
              if(pageCount==0||CurPage==1){
          %>
              <td width="" scope="col" colspan="5" >
              <div class="">
              <input type="" value="前一页" class="btn btn-default btn-sm" >
              </div>
              </td>
                   
          <%
              }
          %>
          <%
              if(pageCount!=0&&CurPage!=pageCount){
                
          %>

               

                <form>
                  
                </form>
                <td width="" scope="col" colspan="5" >
                <div  class="">
                <form method="post" action="../Movie/ListAllmovieServlet?CurPage=<%=CurPage+1 %>">                       
                        <input type="submit" value="下一页" class="btn btn-default btn-sm fullblank"  >
                </form> 
                </div>
                </td>

                

                

                 
               
          <%
              }
          %>
          <%
              if(pageCount==0||CurPage==pageCount){
          %>
                <td width="" scope="col" colspan="5" >
                <div  class="">
                  <input type="" value="下一页" class="btn btn-default btn-sm" >
                </div>
                </td>
               
          <%
              }
          %>  
              &nbsp;
              
              &nbsp;
          <%                  
              }
            else{
              
            }
          %>

            
           
           </tr>
                        </tbody>
                        </table>
                        
                      </table>
                       </form>
                      
                    </div>
                    
                  </div>

                </div>  
                          

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
    <script src="../use/jquery.min.js"></script>
    <script src="../use/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../use/ie10-viewport-bug-workaround.js"></script>
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

  

</body></html>