<%@page import="com.entity.User"%>
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

    

    <title>人员界面</title>

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
  
    /*判断是否为空*/
      function isEmpty(value) {
    return /^\s*$/.test(value);
      }


    function isEmail(str) {
    var myReg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;
    if (myReg.test(str)) {
      return true;
    }
    return false;
  }

  function isGrade(str) {
    var Letters = "ABCD";
    for (var i = 0; i < str.length; i = i + 1) {
      var CheckChar = str.charAt(i);
      if (Letters.indexOf(CheckChar) == -1) {
        return false;
      }
    }
    return true;
  }

      function check(){

        //userGrade

        if(isEmpty(document.useform.user_id.value)){
        alert("id不为空！");
        document.useform.user_id.focus();
        return false;
        }

        if(isEmpty(document.useform.userGrade.value)){
          alert("grade不为空！");
          document.useform.userGrade.focus();
        return false;
        }

        if(!isEmpty(document.useform.userGrade.value)&&!isGrade(document.useform.userGrade.value)){
          alert("grade不正确！");
          document.useform.user_id.focus();
        return false;
        }
        if(!isEmpty(document.useform.user_id.value)&&!isNumber(document.useform.user_id.value)){
          alert("id格式不正确！");
          document.useform.user_id.focus();
        return false;
        }
        if(isEmpty(document.useform.userEmail.value)){
        alert("邮箱不能为空！");
        document.useform.userEmail.focus();
        return false;
        }
        if(!isEmpty(document.useform.userEmail.value)&&!isEmail(document.useform.userEmail.value)){
        alert("邮箱格式不正确！");
        document.useform.userEmail.focus();
        return false;
        }


        if(!isEmpty(document.useform.userMoney.value)&&!isDouble(document.useform.userMoney.value)){
        alert("资金格式不正确！");
        document.useform.userMoney.focus();
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
              <form action="UpdateUser" method="post" name="useform">
                <div class="panel panel-default">
                  <div class="panel-heading fix">
                    <div class="col-md-7"><h4 class="pull-left">注册人员：信息管理</h4></div>
                                  
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
                          
                            
                              
                          </tr>
                          </thead>
                          <tbody>
                          	<td colspan="2" width="100%">
                          		<table width="100%" class="table table-striped">
                          			<%
                          				User user = (User)request.getAttribute("user");
                          				if(user!=null){

                          			%>
                          			<tbody>
                          				<tr>
                          					<td align="right">
                          						人员信息
                          					</td>
                          					<td>
                          						值
                          					</td>
                          				</tr>

                          				<tr>
                          					<td align="right">
                          						user_id
                          					</td>
                          					<%
                          						
                          					%>
                          					<td>
                          						<input readonly = "readonly" name="user_id" value="<%=Integer.toString(user.getID()) %>">
                          						</input>
                          			
                          					</td>
                          				</tr>
                          				
                          				<tr>
                          					<td align="right">
                          						user_name
                          					</td>
                          					<%
                          						if(user.getUserName()==null)
                          							user.setUserName("");
                          					%>
                          					<td>
                          						<input name="user_name" value="<%=user.getUserName() %>">
                          						</input>
                          			
                          					</td>
                          				</tr>

                                  <tr>
                                    <td align="right">
                                    		  user_pwd
                                    </td>
                                    <%
                                      if(user.getPassword()==null)
                                        user.setPassword("");
                                    %>
                                    <td>
                                      <input name="user_pwd" value="<%=user.getPassword() %>">
                                      </input>
                                
                                    </td>
                                  </tr>

                                  <tr>
                                    <td align="right">
                                  	userGrade
                                    </td>
                                   
                                    <td>
                                      <input name="userGrade" value="<%=user.getGrade() %>">
                                      </input>
                                
                                    </td>
                                  </tr>

                                  <tr>
                                    <td align="right">
                                      Email
                                    </td>
                                    <%
                                      if(user.getEmail()==null)
                                        user.setEmail("Unknown");
                                    %>
                                    <td>
                                      <input name="userEmail" value="<%=user.getEmail() %>">
                                      </input>
                                
                                    </td>
                                  </tr>
                                  
                                  <tr>
                                    <td align="right">
                                      money
                                    </td>
                                   
                                    <td>
                                      <input name="userMoney" value="<%=user.getMoney() %>">
                                      </input>
                                
                                    </td>
                                  </tr>

                                  <tr>
                                    <td align="right">
                                    UserType
                                    </td>
                                    <%
                                      
                                    %>
                                    <td>
                                      <input name ="isAdmin" value="<%=user.getUserAdmin() %>">
                                      </input>
                                
                                    </td>
                                  </tr>

                          			</tbody>

                          			<%
                          				}
                          			%>

                          		</table>                         		
                          	</td>
                           
                          </tbody>
                        <tbody>
                      <tr>
					<td align="center" colspan="12">
					
	
				    </td>
				</tr>
                        </tbody>
                        </table>
                        <tbody>
                                <tr>
                                  <td>
                                    <input type="submit" name="" value="确认修改" class="btn btn-primary pull-right"  onclick="return check();" />
                                    
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