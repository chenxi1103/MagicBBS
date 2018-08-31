<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html>

<!-- Head -->
<head>

<head>
<title>MagicBBS: Change Account Info</title>
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
		
	<script type="text/javascript">
	function checkAccount(){
		var accountVal = $("#account").val().trim();
		if("" != accountVal && accountVal.length>0){
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/userServlet.action?md=checkAccount",
				data: "account=" + accountVal,
				success: function(msg){
					if(msg == "false"){
						alert("Sorry! This UserName has already existed! Try another one!");
						$("#account").val("");
					}
				}
			});
		}
	}
	
	function checkForm(){
		var accountVal = $("#account").val().trim();
		if("" == accountVal && accountVal.length==0){
			alert("Username cannot be null!");
			return false;
		}
		return true;
	}
	
	</script>
</head>
<!-- //Head -->

<!-- Body -->
<body>
<jsp:include page="common/NavigationBar.jsp"></jsp:include>
		<section>
			<div id="page-wrapper" class="sign-in-wrapper">
				<div class="graphs">
					<div class="sign-up">
						<p class="creating" style=color:red>Attention: UserName is Unable to Change</p>
			<form action="${pageContext.request.contextPath}/userServlet.action?md=changed&un=${un}" method="post" onsubmit ="return checkForm();"enctype="application/x-www-form-urlencoded">
				<input type="hidden" name = "checkResult" id="checkResult">
				<c:forEach items="${currUser}" var = "user" varStatus = "s">
				<div class="sign-up1"><h4>UserName</h4></div>
				<div class="sign-up2"><input type = "text" Name = "account" value = ${user.account} disabled="disabled" /><br></div>
				<div class="sign-up1"><h4>NickName</h4></div>
				<div class="sign-up2"><input type = "text" Name = "nickName" value = ${user.nickName} /><br></div>
				
				<div class="sign-up1"><h4>Password</h4></div>
				<div class="sign-up2"><input type="password" Name="pwd" value = ${user.pwd}  /><br></div>
				
				<div class="sign-up1"><h4>Re-Password</h4></div>
				<div class="sign-up2"><input type="password" Name="repwd" value = ${user.pwd} /><br></div>
				
				<div class="sign-up1"><h4>Email</h4></div>
				<div class="sign-up2"><input type="text" Name="email" value=${user.email}><br></div>
				
				<div class="sign-up1"><h4>PhoneNumber</h4></div>
				<div class="sign-up2"><input type="text" Name="phone" value=${user.phone}><br></div>
				<br>
			<br><div class="sign-up1"><h4>Select Your Portrait </h4></div><br>
			
			<div class="content">
			<div class="categories">
				<div class="container">
				
					<div class="col-md-2 focus-grid">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i><img src="images/head/1.png"/><input type="radio" name="head" value="1.png" checked="checked"></i></div>
								</div>
							</div>
					</div>
					
			<div class="col-md-2 focus-grid">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i ><img src="images/head/2.png"/><input type="radio" name="head" value="2.png"></i><br></div>
								</div>
							</div>
					</div>
			<div class="col-md-2 focus-grid">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i ><img src="images/head/3.png"/><input type="radio" name="head" value="3.png"></i></div>
								</div>
							</div>
					</div>
					
			<div class="col-md-2 focus-grid">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i ><img src="images/head/4.png"/><input type="radio" name="head" value="4.png"></i></div>
								</div>
							</div>
					</div>
					
							<div class="col-md-2 focus-grid">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i ><img src="images/head/5.png"/><input type="radio" name="head" value="5.png"></i></div>
								</div>
							</div>
					</div>
					
							<div class="col-md-2 focus-grid">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i ><img src="images/head/6.png"/><input type="radio" name="head" value="6.png"></i></div>
								</div>
							</div>
					</div>
					
							<div class="col-md-2 focus-grid">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i ><img src="images/head/7.png"/><input type="radio" name="head" value="7.png"></i></div>
								</div>
							</div>
					</div>
					
							<div class="col-md-2 focus-grid">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i ><img src="images/head/8.png"/><input type="radio" name="head" value="8.png"></i></div>
								</div>
							</div>
					</div>
					
							<div class="col-md-2 focus-grid">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i ><img src="images/head/9.png"/><input type="radio" name="head" value="9.png"></i></div>
								</div>
							</div>
					</div>

</div>
</div>
</div>
			</c:forEach>
				<div class="sub_home">
							<div class="sub_home_left">
									<input type="submit" value="Change">
							</div>
				</div>
			</form>
			</div>
			</div>
							<div class="sub_home_right">
								<p>Go Back to <a href="index.jsp">Home</a></p>
							</div>
							<div class="clearfix"> </div>
						</div>
		<!--footer section start-->
			<footer class="diff">
					<jsp:include page="common/copyRight.jsp"></jsp:include>
			</footer>
        <!--footer section end-->
	</section>
	
		
			<div class="clear"></div>
		<div class="clear"></div>

</body>
<!-- //Body -->

</html>