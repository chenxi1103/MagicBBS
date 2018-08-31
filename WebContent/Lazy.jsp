<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<title>MagicBBS: Write A Post</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
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
		<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
    <script src="js/easyResponsiveTabs.js"></script>
</head>
<body>
<jsp:include page="common/NavigationBar.jsp"></jsp:include>
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

<div class="terms main-grid-border">
		<div class="container">
			<h2 class="head">Lazy Me</h2>
				<div class="panel-group" id="accordion">
				<!-- First Panel -->
					<div class="panel panel-default">
						<div class="panel-heading">
							 <h4 class="panel-title" data-toggle="collapse" data-target="#collapseOne">
								 <span>1.</span> Sorry
							 </h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<p>Sorry I am too lazy to develop this part
								<p>Sorry I don't know what to say...
							</div>
						</div>
					</div>
					
										<div class="panel panel-default">
						<div class="panel-heading">
							 <h4 class="panel-title" data-toggle="collapse" data-target="#collapseOne">
								 <span>2.</span> Sorry
							 </h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<p>Sorry I am too lazy to develop this part
								<p>Sorry I don't know what to say...
							</div>
						</div>
					</div>
					
										<div class="panel panel-default">
						<div class="panel-heading">
							 <h4 class="panel-title" data-toggle="collapse" data-target="#collapseOne">
								 <span>3.</span> Sorry
							 </h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<p>Sorry I am too lazy to develop this part
								<p>Sorry I don't know what to say...
							</div>
						</div>
					</div>
					
										<div class="panel panel-default">
						<div class="panel-heading">
							 <h4 class="panel-title" data-toggle="collapse" data-target="#collapseOne">
								 <span>4.</span> Sorry
							 </h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<p>Sorry I am too lazy to develop this part
								<p>Sorry I don't know what to say...
							</div>
						</div>
					</div>
					
										<div class="panel panel-default">
						<div class="panel-heading">
							 <h4 class="panel-title" data-toggle="collapse" data-target="#collapseOne">
								 <span>5.</span> Sorry
							 </h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<p>Sorry I am too lazy to develop this part
								<p>Sorry I don't know what to say...
							</div>
						</div>
					</div>
					
										<div class="panel panel-default">
						<div class="panel-heading">
							 <h4 class="panel-title" data-toggle="collapse" data-target="#collapseOne">
								 <span>6.</span> Sorry
							 </h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<p>Sorry I am too lazy to develop this part
								<p>Sorry I don't know what to say...
							</div>
						</div>
					</div>
					</div>
					</div>
					</div>

<jsp:include page="common/foot_post.jsp"></jsp:include>
</body>
</html>