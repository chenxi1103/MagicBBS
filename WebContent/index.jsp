<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
<title>MagicBBS: Home</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/font-awesome.min.css" />

<!--fonts-->
<link href='#css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
<link href='#css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!--//fonts-->	
<!-- js -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- js -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.js"></script>
<script>
  $(document).ready(function () {
    var mySelect = $('#first-disabled2');

    $('#special').on('click', function () {
      mySelect.find('option:selected').prop('disabled', true);
      mySelect.selectpicker('refresh');
    });

    $('#special2').on('click', function () {
      mySelect.find('option:disabled').prop('disabled', false);
      mySelect.selectpicker('refresh');
    });

    $('#basic2').selectpicker({
      liveSearch: true,
      maxOptions: 1
    });
  });
</script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link href="css/jquery.uls.css" rel="stylesheet"/>
<link href="css/jquery.uls.grid.css" rel="stylesheet"/>
<link href="css/jquery.uls.lcd.css" rel="stylesheet"/>
<!-- Source -->
<script src="js/jquery.uls.data.js"></script>
<script src="js/jquery.uls.data.utils.js"></script>
<script src="js/jquery.uls.lcd.js"></script>
<script src="js/jquery.uls.languagefilter.js"></script>
<script src="js/jquery.uls.regionfilter.js"></script>
<script src="js/jquery.uls.core.js"></script>
<script>
			$( document ).ready( function() {
				$( '.uls-trigger' ).uls( {
					onSelect : function( language ) {
						var languageName = $.uls.data.getAutonym( language );
						$( '.uls-trigger' ).text( languageName );
					},
					quickList: ['en', 'hi', 'he', 'ml', 'ta', 'fr'] //FIXME
				} );
			} );
		</script>
</head>
<body>
	<jsp:include page="common/NavigationBar.jsp"></jsp:include>
	<c:if test="${ not empty postRefuse }">
				<div class="alert alert-danger" role="alert">${postRefuse }</div>
		</c:if>
				<script>
				$('#myModal').modal('');
				</script>

	<div class="banner text-center">
	  <div class="container">    
	         <h3>&nbsp;</h3>
			<h1 style = "color: black; font-family: 'Comic Sans MS">Share Your   <span  style = "color: black ; font-family: 'Comic Sans MS" class="segment-heading"> Fantasies </span> with MagicBBS</h1><br>
			<a href="${pageContext.request.contextPath }/indexSelect?m=allPost" style="font-family: 'Comic Sans MS">Check All the Posts</a>
	  </div>
	</div>
		<!-- content-starts-here -->
		<div class="content">
			<div class="categories">
				<div class="container">
				
					<div class="col-md-2 focus-grid">
						<a href="${ pageContext.request.contextPath}/	indexSelect?category=General&m=index">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-comments"></i></div>
									<h4 class="clrchg"  style = "font-family: 'Comic Sans MS">General</h4>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-2 focus-grid">
						<a href="${ pageContext.request.contextPath}/	indexSelect?category=Programmer&m=index">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-code"></i></div>
									<h4 class="clrchg" style = "font-family: 'Comic Sans MS">Programmer Zone</h4>
								</div>
							</div>
						</a>
					</div>
					
					
					<div class="col-md-2 focus-grid">
						<a href="${ pageContext.request.contextPath}/	indexSelect?category=Gamer&m=index">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-gamepad"></i></div>
									<h4 class="clrchg" style = "font-family: 'Comic Sans MS">Gamer</h4>
								</div>
							</div>
						</a>
					</div>	
					
					
					<div class="col-md-2 focus-grid">
						<a href="${ pageContext.request.contextPath}/	indexSelect?category=Delicacy&m=index">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-cutlery"></i></div>
									<h4 class="clrchg" style = "font-family: 'Comic Sans MS">Delicacy</h4>
								</div>
							</div>
						</a>
					</div>	
					
					<div class="col-md-2 focus-grid">
						<a href="${ pageContext.request.contextPath}/	indexSelect?category=Music&m=index">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-music"></i></div>
									<h4 class="clrchg" style = "font-family: 'Comic Sans MS">Music</h4>
								</div>
							</div>
						</a>
					</div>
					
					<div class="col-md-2 focus-grid">
						<a href="${ pageContext.request.contextPath}/	indexSelect?category=Pets&m=index">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-paw"></i></div>
									<h4 class="clrchg" style = "font-family: 'Comic Sans MS">Pets</h4>
								</div>
							</div>
						</a>
					</div>	
					
					<div class="col-md-2 focus-grid">
						<a href="${ pageContext.request.contextPath}/	indexSelect?category=Books&m=index">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-book"></i></div>
									<h4 class="clrchg" style = "font-family: 'Comic Sans MS">Books</h4>
								</div>
							</div>
						</a>
					</div>	
					
					<div class="col-md-2 focus-grid">
						<a href="${ pageContext.request.contextPath}/	indexSelect?category=Movies&m=index">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-film"></i></div>
									<h4 class="clrchg" style = "font-family: 'Comic Sans MS">Movies</h4>
								</div>
							</div>
						</a>
					</div>	
					
					<div class="col-md-2 focus-grid">
						<a href="${ pageContext.request.contextPath}/	indexSelect?category=Fashion&m=index">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-fire"></i></div>
									<h4 class="clrchg" style = "font-family: 'Comic Sans MS">Fashion</h4>
								</div>
							</div>
						</a>
					</div>	
					
					<div class="col-md-2 focus-grid">
						<a href="${ pageContext.request.contextPath}/	indexSelect?category=Jokes&m=index">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-smile-o"></i></div>
									<h4 class="clrchg" style = "font-family: 'Comic Sans MS">Jokes</h4>
								</div>
							</div>
						</a>
					</div>
					
					<div class="col-md-2 focus-grid">
						<a href="${ pageContext.request.contextPath}/	indexSelect?category=Sports&m=index">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-tasks"></i></div>
									<h4 class="clrchg" style = "font-family: 'Comic Sans MS">Sports</h4>
								</div>
							</div>
						</a>
					</div>
					
					<div class="col-md-2 focus-grid">
						<a href="${ pageContext.request.contextPath}/	indexSelect?category=Friends&m=index">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-heartbeat"></i></div>
									<h4 class="clrchg" style = "font-family: 'Comic Sans MS">Making Friends</h4>
								</div>
							</div>
						</a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="trending-ads">
				<div class="container">

					<script type="text/javascript">
						 $(window).load(function() {
							$("#flexiselDemo3").flexisel({
								visibleItems:1,
								animationSpeed: 1000,
								autoPlay: true,
								autoPlaySpeed: 5000,    		
								pauseOnHover: true,
								enableResponsiveBreakpoints: true,
								responsiveBreakpoints: { 
									portrait: { 
										changePoint:480,
										visibleItems:1
									}, 
									landscape: { 
										changePoint:640,
										visibleItems:1
									},
									tablet: { 
										changePoint:768,
										visibleItems:1
									}
								}
							});
							
						});
					   </script>
					   <script type="text/javascript" src="js/jquery.flexisel.js"></script>
					</div>   
			</div>
			<!-- //slider -->				
			</div>
			<div class="mobile-app">
				<div class="container">
					<div class="col-md-5 app-left">
					</div>
					<div class="col-md-7 app-right">
						<h3>MagicBBS is the <span>Most Exciting</span> Bulletin Board System designed just for YOU!!! </h3>
						<p>Share your Fantasies, Emotions, Ideas with insteresting people around the world.</p>
						<div class="app-buttons">
							<div class="app-button">
							</div>
							<div class="app-button">
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
<jsp:include page="common/foot_index.jsp"></jsp:include>
</body>
</html>