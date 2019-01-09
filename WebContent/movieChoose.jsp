<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.database.PlaysAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0048)http://v3.bootcss.com/examples/starter-template/ -->
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MovieAction"%>

<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="http://v3.bootcss.com/favicon.ico">

		<title>Main Function</title>

		<!-- Bootstrap core CSS -->
		<!--
	  <link href="./use/bootstrap.min.css" rel="stylesheet">
	  Not good to use  -->
	  <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

	  <!-- Custom styles for this template -->

	  <link href="./new/carousel.css" rel="stylesheet">

	  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">

	  <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	  <script src="./use/ie-emulation-modes-warning.js"></script>
	  <script src="./use/jquery.min.js"></script>


	  <script src="./use/bootstrap.min.js"></script>
	  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	  <script src="./use/ie10-viewport-bug-workaround.js"></script>
	  <script type="text/javascript" src="./new/main.js"></script>
	<script type="text/javascript" charset="utf-8">
	
	var choosed=0;
	var choosedTime = "";
	var choosedDate = "";
	var firstDate = "";
	var movieName = new Array();
	var movieDirector= new Array();
	var movieProtagonist= new Array();
	var movieType= new Array();
	var movieOrigins= new Array();
	var movieLanguage= new Array();
	var movieIamgePath = new Array();
	var movieTime= new Array();
	var movieIntroduction = new Array();
	var firstDayMovie = new Array();
	var ind = new Array();
	var fourDate = new Array();
	
	function chooseFun()
	{
		var choosedMovieTitle = document.getElementById("choosedMovieTitle");
		choosedMovieTitle.innerText=movieName[choosed];	
		var choosedMovieTitle2 = document.getElementById("col-md-4-id");
		choosedMovieTitle2.innerText=movieName[choosed];	

		var movieImage3= document.getElementById("movieImage-3");
		var largeurl = "./images/large/img-"+movieIamgePath[choosed]+".jpg";
		movieImage3.setAttribute("src",largeurl);
		image3background = document.getElementById("image3-background");
		//console.log(movieIamgePath[choosed]);
		image3background.style.backgroundImage="url("+largeurl+")";

		document.getElementById("c-movie-director").innerText = "导演："+movieDirector[choosed];
		document.getElementById("c-movie-protagonist").innerText = "主演："+movieProtagonist[choosed];
		document.getElementById("c-movie-type").innerText = "类型："+movieType[choosed];
		document.getElementById("c-movie-language").innerText = "语言："+movieLanguage[choosed];
		document.getElementById("c-movie-time").innerText = "片长："+movieTime[choosed];
		document.getElementById("c-movie-introduction").innerText = movieIntroduction[choosed];
	}
	function testfun()
	{
		//$("#testid").css("background-color","red");
	}
	function showMovieInf(){
		var name=document.getElementById("figcaption-movie-name");
		var director=document.getElementById("figcaption-movie-director");
		var protagonist=document.getElementById("figcaption-movie-protagonist");
		var type=document.getElementById("figcaption-movie-type");
		var origins=document.getElementById("figcaption-movie-origins");
		var language=document.getElementById("figcaption-movie-language");
		var i=0;
		for(i=0;i<16;i=(i+1))
		{
			var slideImg = document.getElementById("slide-img-"+i);
			var isActive = slideImg.getAttribute("class");
			if(isActive == "item active" || isActive=="active item" )
			{
				choosed=i;
				name.innerText=movieName[i];					
				director.innerText=movieDirector[i];					
				protagonist.innerText=movieProtagonist[i];					
				type.innerText=movieType[i];					
				origins.innerText=movieOrigins[i];					
				language.innerText=movieLanguage[i];					
				//console.log(i+"change success");
				break;
			}
			else{
			}
		}
		$("#testid").css("background-color","blue");
	}
	
	function loadLittleImg()
	{
		var titile_img_id1 =parseInt(Math.floor(Math.random() * 16));
		var titile_img_id2 = titile_img_id1; 
		var titile_img_id3 = titile_img_id1; 
		while(titile_img_id2 == titile_img_id1)
			titile_img_id2 = parseInt(Math.floor(Math.random() * 16));
		while(titile_img_id3==titile_img_id1 || titile_img_id3==titile_img_id2)
			titile_img_id3 = parseInt(Math.floor(Math.random() * 16));
		var title_img_path = "./images/samll/img-"+movieIamgePath[titile_img_id1]+".jpg";
		//document.getElementById("title-slide-1").setAttribute("src",title_img_path);
		//title_img_path = "./images/samll/img-"+movieIamgePath[titile_img_id2]+".jpg";
		//document.getElementById("title-slide-2").setAttribute("src",title_img_path);
		//title_img_path = "./images/samll/img-"+movieIamgePath[titile_img_id3]+".jpg";
		//document.getElementById("title-slide-3").setAttribute("src",title_img_path);
		for(var i=0;i<16;i++)
		{
			var littleimg=document.getElementById("littleimage"+i);
			var sliderDiv = document.getElementById("slid-img-"+i);
			//console.log(littleimg.getAttribute("src"));
			var littleurl = "./images/samll/img-"+movieIamgePath[i]+".jpg";
			var largeurl = "./images/large/img-"+movieIamgePath[i]+".jpg";
			littleimg.setAttribute("src",littleurl);
			sliderDiv.setAttribute("src",largeurl);
		}
		var choosedMovieTitle = document.getElementById("choosedMovieTitle");
		choosedMovieTitle.innerText=movieName[0];	
		var choosedMovieTitle2 = document.getElementById("col-md-4-id");
		choosedMovieTitle2.innerText=movieName[0];	
		var movieImage3= document.getElementById("movieImage-3");
		var largeurl = "./images/large/img-"+movieIamgePath[0]+".jpg";
		movieImage3.setAttribute("src",largeurl);
		image3background = document.getElementById("image3-background");
		image3background.style.backgroundImage="url("+largeurl+")";
		document.getElementById("c-movie-director").innerText = "导演："+movieDirector[0];
		document.getElementById("c-movie-protagonist").innerText = "主演："+movieProtagonist[0];
		document.getElementById("c-movie-type").innerText = "类型："+movieType[0];
		document.getElementById("c-movie-language").innerText = "语言："+movieLanguage[0];
		document.getElementById("c-movie-time").innerText = "片长："+movieTime[0];
		document.getElementById("c-movie-introduction").innerText = movieIntroduction[0];
	}
	function myAutoRun()
	{
		setTimeout("loadLittleImg();",1000);
	}
	
	for(var i=0;i<16;i++)
	{
		ind[i]=0;
		firstDayMovie[i] = new Array();
	}
	window.onload=myAutoRun();
	<%
	MovieAction movieAction=new MovieAction();
	ResultSet resultSet=movieAction.getMovieInformation();
	PlaysAction playsAction = new PlaysAction();
	ResultSet resultSetplay = playsAction.getPlayInformation();
	int i=0;
	if(resultSet!=null)
	{
		while(resultSet.next())
		{
			%>
				movieName [<%=i%>]='<%=resultSet.getString(1)%>';
				movieDirector[<%=i%>]='<%=resultSet.getString(2)%>';
				movieProtagonist[<%=i%>]='<%=resultSet.getString(3)%>';
				movieType[<%=i%>]='<%=resultSet.getString(4)%>';
				movieOrigins[<%=i%>]='<%=resultSet.getString(5)%>';
				movieLanguage[<%=i%>]='<%=resultSet.getString(6)%>';
				movieIamgePath[<%=i%>]='<%=resultSet.getString(7)%>';
				movieTime[<%=i%>]='<%=resultSet.getString(8)%>';
				movieIntroduction[<%=i%>]='<%=resultSet.getString(9)%>';
			<%
				i++;
		}
	}
	if(resultSetplay != null)
	{
		int movie_id;
		String start_time;
		String date;
		String time;
		while(resultSetplay.next())
		{
			movie_id= resultSetplay.getInt(1);
			start_time= resultSetplay.getString(2);
			date = start_time.substring(0, 10);
			time= start_time.substring(11, 16);
			%>
			var temp = <%=movie_id%> -1;
			var temp1 = ind[temp];
			firstDayMovie[temp][temp1] = '<%=time%>' ;
			ind[temp]++;
			<%
		}
	}
	%>
	</script>

  <link rel="stylesheet" type="text/css" href="./new/seats.css" />


  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
	  <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>

<body bcloud="bcloud_1.2">

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
					<li class="active"><a href="./movieChoose.jsp">Home</a></li>
					<li><a href="http://v3.bootcss.com/examples/starter-template/#about">About</a></li>
					<li><a href="http://v3.bootcss.com/examples/starter-template/#contact">Contact</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</nav>
	<!-- Carousel
		 ================================================== -->
		 <div id="myCarousel" class="carousel slide" data-ride="carousel">
			 <!-- Indicators -->
			 <ol class="carousel-indicators">
				 <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				 <li data-target="#myCarousel" data-slide-to="1" class=""></li>
				 <li data-target="#myCarousel" data-slide-to="2" class=""></li>
			 </ol>
			 <div class="carousel-inner" role="listbox">
				 <div class="item active">
					 <img src="./images/head2.jpg" alt="First slide" id="">
					 <div class="container">
						 <div class="carousel-caption">
							 <h1>魔方影音在线选座</h1>
							 <p>在繁忙的都市中选部电影来犒劳自己~</p>
								 
							 </div>
						 </div>
					 </div>
					 <div class="item">
						 <img src="./images/head1.jpg" alt="Second slide" id="">
						 <div class="container">
							 <div class="carousel-caption">
								 <h1>魔方影音——热映电影</h1>
								 <p>在繁忙的都市中选部电影来犒劳自己~</p>
								
							 </div>
						 </div>
					 </div>
					 <div class="item">
						 <img src="./images/head3.jpg" alt="Third slide" id="">
						 <div class="container">
							 <div class="carousel-caption">
								 <h1>魔方影音——在线猜电影</h1>
								 <p>来，猜一猜 </p>
								
							 </div>
						 </div>
					 </div>
				 </div>
				 <a class="left carousel-control" href="http://v3.bootcss.com/examples/carousel/#myCarousel" role="button" data-slide="prev">
					 <span class="fa fa-chevron-left icon-header"></span>
					 <span class="sr-only">Previous</span>
				 </a>
				 <a class="right carousel-control" href="http://v3.bootcss.com/examples/carousel/#myCarousel" role="button" data-slide="next">
					 <span class="fa fa-chevron-right icon-header"></span>
					 <span class="sr-only">Next</span>
				 </a>
			 </div><!-- /.carousel -->




			 <div class="container">
				 <div class="gallery col-md-12">
					 <div class="plate ">
						 <h1 ></h1>

						 <div class="gallery-title" id="" onmouseover="testfun()">
							 <h1>选电影，选心情</h1>

						 </div>
						 <!--gallery-img Start -->
						 <div class="gallery-img">

							 <div id="main_area">
								 <!-- Slider -->
								 <div class="row">
									 <div class="col-sm-6" id="slider-thumbs">
										 <!-- Bottom switcher of slider -->
										 <ul class="hide-bullets">
											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-0" >
													 <img src="http://placehold.it/150x150&text=zero"  id="littleimage0">
												 </a>
											 </li>

											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-1">
													 <img src="http://placehold.it/150x150&text=1" id="littleimage1"></a>
											 </li>

											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-2">
													 <img src="http://placehold.it/150x150&text=2" id="littleimage2"></a>
											 </li>

											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-3">
													 <img src="http://placehold.it/150x150&text=3" id="littleimage3"></a>
											 </li>

											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-4">
													 <img src="http://placehold.it/150x150&text=4" id="littleimage4"></a>
											 </li>

											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-5">
													 <img src="http://placehold.it/150x150&text=5" id="littleimage5"></a>
											 </li>
											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-6">
													 <img src="http://placehold.it/150x150&text=6" id="littleimage6"></a>
											 </li>

											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-7">
													 <img src="http://placehold.it/150x150&text=7" id="littleimage7"></a>
											 </li>

											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-8">
													 <img src="http://placehold.it/150x150&text=8" id="littleimage8"></a>
											 </li>

											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-9">
													 <img src="http://placehold.it/150x150&text=9" id="littleimage9"></a>
											 </li>
											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-10">
													 <img src="http://placehold.it/150x150&text=10" id="littleimage10"></a>
											 </li>

											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-11">
													 <img src="http://placehold.it/150x150&text=11" id="littleimage11"></a>
											 </li>

											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-12">
													 <img src="http://placehold.it/150x150&text=12" id="littleimage12"></a>
											 </li>

											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-13">
													 <img src="http://placehold.it/150x150&text=13" id="littleimage13"></a>
											 </li>
											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-14">
													 <img src="http://placehold.it/150x150&text=14" id="littleimage14"></a>
											 </li>

											 <li class="col-sm-3">
												 <a class="thumbnail" id="carousel-selector-15">
													 <img src="http://placehold.it/150x150&text=15" id="littleimage15"></a>
											 </li>
										 </ul>
									 </div>
									 <div class="col-sm-6" onmouseover="showMovieInf();">
										 <div class="col-xs-12" id="slider" onmouseover="showMovieInf();">
											 <!-- Top part of the slider -->
											 <div class="row" >
												 <div class="col-sm-12" id="carousel-bounding-box" >
													 <div class="carousel slide" id="uCarousel" >
														 <!-- Carousel items -->
														 <div class="carousel-inner">
															 <div class="active item" data-slide-number="0" id="slide-img-0">
																 <img src="http://placehold.it/470x480&text=zero" id="slid-img-0"></div>

															 <div class="item" data-slide-number="1" id="slide-img-1">
																 <img src="http://placehold.it/470x480&text=1" id="slid-img-1" ></div>

															 <div class="item" data-slide-number="2" id="slide-img-2">
																 <img src="http://placehold.it/470x480&text=2" id="slid-img-2" ></div>

															 <div class="item" data-slide-number="3" id="slide-img-3">
																 <img src="http://placehold.it/470x480&text=3" id="slid-img-3" ></div>

															 <div class="item" data-slide-number="4" id="slide-img-4">
																 <img src="http://placehold.it/470x480&text=4" id="slid-img-4" ></div>

															 <div class="item" data-slide-number="5" id="slide-img-5">
																 <img src="http://placehold.it/470x480&text=5" id="slid-img-5"></div>

															 <div class="item" data-slide-number="6" id="slide-img-6">
																 <img src="http://placehold.it/470x480&text=6" id="slid-img-6"></div>

															 <div class="item" data-slide-number="7" id="slide-img-7">
																 <img src="http://placehold.it/470x480&text=7" id="slid-img-7"></div>

															 <div class="item" data-slide-number="8" id="slide-img-8">
																 <img src="http://placehold.it/470x480&text=8" id="slid-img-8"></div>

															 <div class="item" data-slide-number="9" id="slide-img-9">
																 <img src="http://placehold.it/470x480&text=9" id="slid-img-9"></div>

															 <div class="item" data-slide-number="10" id="slide-img-10">
																 <img src="http://placehold.it/470x480&text=10" id="slid-img-10"></div>

															 <div class="item" data-slide-number="11" id="slide-img-11">
																 <img src="http://placehold.it/470x480&text=11" id="slid-img-11"></div>

															 <div class="item" data-slide-number="12" id="slide-img-12">
																 <img src="http://placehold.it/470x480&text=12" id="slid-img-12"></div>

															 <div class="item" data-slide-number="13" id="slide-img-13">
																 <img src="http://placehold.it/470x480&text=13" id="slid-img-13"></div>

															 <div class="item" data-slide-number="14" id="slide-img-14">
																 <img src="http://placehold.it/470x480&text=14" id="slid-img-14"></div>

															 <div class="item" data-slide-number="15" id="slide-img-15">
																 <img src="http://placehold.it/470x480&text=15" id="slid-img-15"></div>
														 </div>
														 <!-- Carousel nav -->
														 <a class=" carousel-control left" href="#uCarousel" role="button" data-slide="prev">
															 <span class="fa fa-chevron-left icon-header"></span>
														 </a>
														 <a class=" carousel-control right" href="#uCarousel" role="button" data-slide="next">
															 <span class="fa fa-chevron-right icon-header"></span>
														 </a>
													 </div>
													 <figcaption>
													 <div class="container"></div>
													 <div class="row cardlist-mv">

														 <span class="name-mv" id="figcaption-movie-name">电影名</span>
														 <span class="director-mv" id="figcaption-movie-director">导演：JJ</span>
														 <span class="main-actor-mv" id="figcaption-movie-protagonist">主演：JJ JJ JJ JJ v JJ</span>
														 <span class="type-mv" id="figcaption-movie-type">类型：JJJJJJ</span>
														 <span class="area-mv" id="figcaption-movie-origins">地区：JJJJJJ</span>
														 <span class="lang-mv" id="figcaption-movie-language">语言：JJJJJJ</span>
														 <a class="btn btn-primary btn-lg" id="target" onclick="chooseFun();">选座购票</a>
													 </div>
													 </figcaption>






												 </div>
											 </div>
										 </div>
									 </div>
									 <!--/Slider-->
								 </div>

							 </div>
							 <!--  main area end-->
						 </div>
						 <!--Gallery img End -->
					 </div>
				 </div>
			 </div><!-- /.container -->


			 <!--Movie Box Start-->
			 <div class="container targetmove">
				 <div class="movie-box col-md-12 ">
					 <div class="movie-box plate ">

						 <div class="row moviebox-title">
							 <h1>在线选座~</h1>
						 </div>

						 <div class="row choose-toolip">
							 <section>
								 <div class="wizard col-md-12">
									 <div class="wizard-inner">
										 <div class="connecting-line"></div>
										 <ul class="nav nav-tabs" role="tablist">

											 <li role="presentation" class="active">
												 <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step Choosing~">
													 <span class="round-tab">
														 <i class="fa fa-file-movie-o"></i>
													 </span>
												 </a>
											 </li>

											 <li role="presentation" class="disabled">
												 <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
													 <span class="round-tab">
														 <i class="fa fa-server"></i>
													 </span>
												 </a>
											 </li>
											 <li role="presentation" class="disabled">
												 <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
													 <span class="round-tab">
														 <i class="fa fa-users"></i>
													 </span>
												 </a>
											 </li>

											 <li role="presentation" class="disabled">
												 <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
													 <span class="round-tab">
														 <i class="fa fa-rmb"></i>
													 </span>
												 </a>
											 </li>
										 </ul>
									 </div>

									 <form role="form" class="form-bac col-md-12">
										 <div class="tab-content col-md-12" >
											 <div class="tab-pane active" role="tabpanel" id="step1">

												 <div class="detail-wrap">

													 <h1 id="choosedMovieTitle"></h1>

													 <div class="background_box">

														 <div class="background_img" id="image3-background" >
														 </div>
														 <div class="detail-cont">

															 <div class="cont-title">

																 <span class="col-md-4" id="col-md-4-id">
																	 é¾ç«
																 </span>
																 <em class="score-mv col-md-3">8.9</em>

															 </div>
															 <div class="">
																 <div class="col-md-12">
																	 <div class=" col-md-5">
																		 <img src="./new/bac2.jpg"  alt="img_show" class="img-thumb" id="movieImage-3">
																	 </div>
																	 <div class=" col-md-7 hidden-xs hidden-sm">
																		 <br>
																		 <span class="title-info"><strong></strong></span>
																		 <table class="table table-user-information">
																			 <tbody>
																				 <tr>
																					 <td class="director" id="c-movie-director">导演：</td>
																					 <%--<td>11/12/2013</td>--%>
																				 </tr>
																				 <tr>
																					 <td class="main-actor" id="c-movie-protagonist">主演:</td>
																					 <%--<td>15</td>--%>
																				 </tr>
																				 <tr>
																					 <td class="type" id="c-movie-type">类型：</td>
																					 <%--<td>0</td>--%>
																				 </tr>
																				 <tr>
																					 <td class="language" id="c-movie-language">语言：</td>
																					 <%--<td>0</td>--%>
																				 </tr>
																				 <tr>
																					 <td class="time-show" id="c-movie-time">片长：</td>
																					 <%--<td>0</td>--%>
																				 </tr>
																			 </tbody>
																		 </table>
																	 </div>       
																 </div>
															 </div>
														 </div>
													 </div>

													 <div class="box-score">

														 <div class="col-xs-12 col-md-6">
															 <div class="well well-sm">
																 <div class="row">
																	 <div class="col-xs-12 col-md-6 text-center">
																		 <h1 class="rating-num">
																			 8.0</h1>
																		 <div class="rating">
																			 <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
																			 </span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
																			 </span><span class="glyphicon glyphicon-star-empty"></span>
																		 </div>
																		 <div>
																			 <span class="glyphicon glyphicon-user"></span>1,050,008 total
																		 </div>
																	 </div>
																	 
																 </div>
															 </div>
															 

														 </div>
														 <div class="col-xs-12 col-md-6">

															 <p><div class="details">
																 <h3 class="details-text">简介</h3>
															 </div>
															 <div class="contents" id="movie-resume">
																 <p id="c-movie-introduction">11111111111</p>
																 <p>11111111111</p>
															 </div>
															 </p>
															 <li class="btn btn-danger btn-back">回到顶部</li>
														 </div>
													 </div>





													 <ul class="list-inline pull-right">
														 <li><button type="button" id="save_conButton" onclick="loadFirstPlays();" class="btn btn-primary next-step">Save and continue</button></li>
													 </ul>
												 </div>
											 </div>

											 <!--   div class Step 1 end -->

											 <div class="tab-pane" role="tabpanel" id="step2">
												 <div class="detail-wrap col-md-12">
													 <ul class="filter-select">
														 <li>
															 <label>日期</label>
															 <div class="select-tags">
																 <a href="javascript:void(0);" onclick="chooseDate(this.id)" id = "date1" class="current">今天</a>
																 <a href="javascript:void(0);" onclick="chooseDate(this.id)" id = "date2">明天</a>
																 <a href="javascript:void(0);" onclick="chooseDate(this.id)" id = "date3">后天</a>
																 <a href="javascript:void(0);" onclick="chooseDate(this.id)" id = "date4">大后天</a>
															 </div>
														 </li>
														 <li>
															 <label>场次</label>
															 <div class="select-tags">
																 <a href="javascript:void(0);" onclick="chooseTime(this.id)" id="showtime1" class="current"></a>
																 <a href="javascript:void(0);" onclick="chooseTime(this.id)" id="showtime2" ></a>
																 <a href="javascript:void(0);" onclick="chooseTime(this.id)" id="showtime3" ></a>
																 <a href="javascript:void(0);" onclick="chooseTime(this.id)" id="showtime4" ></a>
																 <a href="javascript:void(0);" onclick="chooseTime(this.id)" id="showtime5" ></a>
																 <a href="javascript:void(0);" onclick="chooseTime(this.id)" id="showtime6" ></a>
																 <a href="javascript:void(0);" onclick="chooseTime(this.id)" id="showtime7" ></a>
																 <a href="javascript:void(0);" onclick="chooseTime(this.id)" id="showtime8" ></a>
															 </div>

														 </li>
														<!--  
														 <li>
															 <label>ddd</label>
															 <div class="select-tags">
																 <a class="current" href="">eee</a>

																 <a href="">fff</a>
																 <a href="">ggg</a>
															 </div>
														 </li>
														 --!>
													 </ul>




													 <ul class="list-inline pull-right">
														 <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
														 <li><button type="button" class="btn btn-primary next-step" onclick="gochooseSeat();">Save and continue</button></li>
													 </ul>
												 </div>
											 </div>

											 <!--   div class Step 2 end -->

											 <div class="tab-pane" role="tabpanel" id="step3">
												 <div class="detail-wrap col-md-12">
													 <div class="plate">

														 <div class="tcontainer">
															 <div class="row">
																 <div class="col-md-8">

																	 <div id="seat-map">
																		 <div class="front">座位</div>

																	 </div>
																	 <div id="legend" class="col-md-8"></div>


																 </div>
																 <div class="col-md-4">

																	 <div class="booking-details ">
																		 <div class="col-md-12">
																			 <p>影片<span id ="seatPmnane">222</span></p>
																			 <p>时间<span id ="seatPstarttime">333</span></p>
																			 <p>座位</p>
																			 <ul id="selected-seats"></ul>
																			 <p>票数<span id="counter">0</span></p>
																			 <p>总计<b><span id="total">0</span></b></p>
																		 </div>
																	 </div>
																 </div>
															 </div>
														 </div>
													 </div>

													 <ul class="list-inline pull-right">
														 <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
														 <li><button type="button" class="btn btn-default next-step">Skip</button></li>
														 <li><button type="button" onclick="getSelectID();" class="btn btn-danger btn-info-full next-step">comfirm and pay</button></li>
													 </ul>
												 </div>
											 </div>

											 <!--   div class Step 3 end -->
											 <div class="tab-pane" role="tabpanel" id="complete">
												 <div class="detail-wrap col-md-12">

													 <div class="row">
														 <div class="col-md-12">
															 <h3>Complete</h3>
															 <p></p>
															 <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12">
																 <div class="box">
																	 <div class="icon">
																		 <div class="image"><i class="fa fa-credit-card"></i></div>
																		 <div class="info">
																			 <h3 class="title">aaa</h3>
																			 <h1 class="money">下单成功</h1>
																			 <p>
																			 ccc
																			 </p>
																			 <div>
																				 <div class="db-pricing-seven">
																					 <ul>
																						 <li class="price">
																							 <i class="glyphicon glyphicon-qrcode"></i>
																							 BASIC - 29 $
																						 </li>
																						 <li>Web</li>
																					 </ul>
																				 </div>
																			 </div>
																			 <div class="more">
																				 <a href="./movieChoose.jsp" title="Title Link">
																					回到主界面<i class="fa fa-angle-double-right"></i>
																				 </a>
																			 </div>
																		 </div>
																	 </div>
																	 <div class="space"></div>
																 </div>
															 </div>
														 </div>

													 </div>
												 </div>
											 </div>
											 <!--   div class Step 4 end -->
										 </div>
									 </form>
								 </div>
							 </section>
						 </div>
					 </div>
				 </div>

			 </div>
			 <!--Movie Box End-->
			 <!-- Bootstrap core JavaScript
					   ================================================== -->
					   <!-- Placed at the end of the document so the pages load faster -->
					   <script type="text/javascript" src="./new/jquery.seat-charts.min.js"></script>
					   <script type="text/javascript" src="./new/select_seat.js"></script>
					   <script type="text/javascript" src="./new/myadd.js"></script>


	</body>

</html>
