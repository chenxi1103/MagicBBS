<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<title>MagicBBS: Login</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

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
	 <section>
			<div id="page-wrapper" class="sign-in-wrapper">
				<div class="graphs">
					<div class="sign-in-form">
						<div class="sign-in-form-top">
							<h1>Log in</h1>
						</div>
						<div class="signin">
							<div class="signin-rit">
								<div class="clearfix"> </div>
							</div>
							<c:if test="${ not empty message }">
									<div class="alert alert-danger" role="alert">${message }</div>
							</c:if>
								<c:if test="${ not empty postRefuse }">
								<div class="alert alert-danger" role="alert">${postRefuse }</div>
						</c:if>
							<form action="${pageContext.request.contextPath}/userServlet.action?md=login" method="post" enctype="application/x-www-form-urlencoded" >
							<div class="log-input" action="" method ="post">
								<div class="log-input-left">
								   <input type="text" class="user"  name = "account"  value="account" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'accountl';}"/>
								</div>
								<div class="clearfix"> </div>
							</div>
							
			
							<div class="log-input">
								<div class="log-input-left">
								   <input type="password" class="lock"  name = "pwd" value="pwd" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email address:';}"/>
								</div>
								
								<div class="clearfix"> </div>
							</div>
							<input type="submit" value="Log in">
						</form>	
						
						 
						</div>
						<div class="new_people">
							<h2>For New People</h2>
							<p>Join us today to enjoy our great Magic BBS!</p>
							<a href="register.jsp">Register Now!</a>
						</div>
					</div>
				</div>
			</div>
		<!--footer section start-->
			<footer class="diff">
				<jsp:include page="common/copyRight.jsp"></jsp:include>
			</footer>
        <!--footer section end-->
	</section>
</body>
</html>