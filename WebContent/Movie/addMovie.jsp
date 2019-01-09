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

    <title>电影加入数据库</title>

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


      /*判断是否为数字*/
  function isNumber(str) {
    var Letters = "1234567890";
    for (var i = 0; i < str.length; i = i + 1) {
      var CheckChar = str.charAt(i);
      if (Letters.indexOf(CheckChar) == -1) {
        return false;
      }
    }
    return true;
  }
  function isDtype(str) {
    var Letters = "23";
    for (var i = 0; i < str.length; i = i + 1) {
      var CheckChar = str.charAt(i);
      if (Letters.indexOf(CheckChar) == -1) {
        return false;
      }
    }
    return true;
  }

    /*判断是否为空*/
      function isEmpty(value) {

    return /^\s*$/.test(value);
      }


      function check(){
        if(isEmpty(document.useform.id.value)){
        alert("影片id不能为空！");
        document.useform.id.focus();

        return false;
        }
        if(!isEmpty(document.useform.id.value)&&!isNumber(document.useform.id.value)){
        alert("影片id格式不正确！");
        document.useform.id.focus();

        return false;
        }
        if(isEmpty(document.useform.movname.value)){
        alert("影片名不能为空！");
        document.useform.movname.focus();
        return false;
        }



        if(!isDouble(document.useform.score.value)){
        alert("评分格式不正确！");
        document.useform.score.focus();
        return false;
        }
        if(!isDtype(document.useform.Dstyle.value)){
        alert("电影放映类型不正确！");
        document.useform.Dstyle.focus();
        return false;
        }
        if(!isDouble(document.useform.money.value)){
        alert("票房格式不正确！");
        document.useform.money.focus();
        return false;
        }






      }
    </script>


  </head>

  

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
            
          </div>
              
            
              
            <hr class="prettyline">
            <div class="tablepos">
              <!-- Start Table  -->
              <form action="AddMoreMovServlet" method="post" name="useform" >
                <div class="panel panel-default">
                  <div class="panel-heading fix">
                    <div class="col-md-7"><h4 class="pull-left">电影库：信息管理</h4></div>
                                   
                  </div>
                  <div id="collapseone">
                    <div class="panel-body">
                      <table class="table-responsive">
                        <table class="table table-bordered table-hover table-striped">
                          <thead>
                            <tr>
                              <th align="center" scope="col" colspan="12" class="title_tbody">
                                <span class="">信息表</span>
                              </th>
                            </tr>                                                                                                 
                          </thead>

                          <tbody>
                            <td colspan="2" width="100%">
                             <table width="100%" class="table table-striped" >                            
                                <tbody>
                                  <tr>
                                    <td align="right">
                                      名称
                                    </td>
                                    <td>
                                      详细信息
                                    </td>
                                  </tr>

                                  <tr>
                                    <td align="right">
                                      影片id
                                    </td>
                                    
                                    <td>
                                      
                                      <input name="id" id="id" >
                                      </input>
                                
                                    </td>
                                                                                                                                
                                    </td>
                                  </tr>
                                  
                                  
                                  <tr>
                                    <td align="right">
                                        电影名称
                                    </td>
                                    
                                    <td>
                                      <input name="movname" id="movname" >
                                      </input>
                                
                                    </td>
                                  </tr>

                                  <tr>
                                    <td align="right">
                                      导演
                                    </td>
                                    
                                    <td>
                                      <input name="director" id="director">
                                      </input>
                                
                                    </td>
                                  </tr>

                                  <tr>
                                    <td align="right">
                                      产地
                                    </td>
                                    
                                    <td>
                                      <input name="origins" id="">
                                      </input>
                                
                                    </td>
                                  </tr>

                                  <tr>
                                    <td align="right">
                                      主演
                                    </td>
                                    
                                    <td>
                                      <input name="actorset" id="actorset" class="form-control">
                                      </input>
                                
                                    </td>
                                  </tr>

                                  <tr>
                                    <td align="right">
                                      2D/3D
                                    </td>
                                    <td>
                                    <input class="form-control" name="Dstyle" 
                                    placeholder="可选择的值：2或3">
                                                                      
                                    </input> 
                                    </td>
                                  </tr>

                                  <tr>
                                    <td align="right">
                                      评分
                                    </td>
                                   
                                    <td>
                                      <input name="score">
                                      </input>
                                
                                    </td>
                                  </tr>
                                  <tr>
                                    <td align="">
                                      上映日期
                                    </td>
                                   
                                    <td>
                                      <input name="date">
                                      </input>
                                
                                    </td>
                                  </tr>
                                  <tr>
                                    <td align="right">
                                      时间长度
                                    </td>
                                   
                                    <td>
                                      <input name="time">
                                      </input>
                                
                                    </td>
                                  </tr>
                                  <tr>
                                    <td align="right">
                                      语言
                                    </td>
                                   
                                    <td>
                                      <input name="language">
                                      </input>
                                
                                    </td>
                                  </tr>
                                  <tr>
                                    <td align="right">
                                      票房
                                    </td>
                                   
                                    <td>
                                      <input name="money">
                                      </input>
                                
                                    </td>
                                  </tr>
                                  
                                </tbody>


                              </table>                            
                            </td>
                           
                          </tbody>
                        <tbody>
                        <tr>
                        
                           

                         </td>                          
                        </tr>
        
                        </tbody>
                        </table>

                        <tbody>
                          <div class="form-group">
                            <label for="name" class="pull-left">影片描述</label>
                            <textarea class="form-control" rows="3" name="introduction"></textarea>
                            
                          </div>

                        </tbody>


                        <tbody>
                                <tr>
                                  <td>
                                    <input type="submit" name="" value="确认提交" class="btn btn-primary pull-right" onclick="return check();" />
                                    
                                  </td>
                                </tr>
                        </tbody>
                        
                      </table>
                      
                    </div>
                    
                  </div>

                </div>               
                </form>
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