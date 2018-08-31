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
	<!-- Submit Ad -->
	<div class="submit-ad main-grid-border">
		<div class="container">
			<h2 class="head" style =" font-family: 'Comic Sans MS'">Write A Post</h2>
			<div class="post-ad-form">
				<form action = "${ pageContext.request.contextPath}/postMag_Servlet.do?un=${un}&m=add " class = "form-horizontal" method="post">
				<input type = "hidden" name = "id" value = "${p.id }">
					<label>Select Category <span>*</span></label>
					<select class="" name = "postType" id = "postType">
						<c:if test="${not empty p.id }">
		                           <option selected>${p.postType }</option>
						</c:if>
						  <option value="General" >Select Category</option>
						  <option value="General" >General</option>
						  <option value="Programmer"  >Programmer Zone</option>
						  <option value="Gamer" >Gamer</option>
						  <option value="Delicacy" >Delicacy</option>
						  <option value="Music" >Music</option>
						  <option value="Pets" >Pets</option>
						  <option value="Books"  >Books</option>
						  <option value="Movies"  >Movies</option>
						  <option value="Fashion" >Fashion</option>
						  <option value="Jokes" >Jokes</option>
						  <option value="Sports" >Sports</option>
						  <option value="Friends" >Friends</option>
					</select>
					<div class="clearfix"></div>
					<label>Post Title <span>*</span></label>
					<input type="text" class="form-control" name = "postTitle" id="postTitle" value= "${p.postTitle }" placeholder="" require autofocus/>
					<div class="clearfix"></div>
					<label>Post Content <span>*</span></label>
					<textarea class="mess" placeholder="Write your post here..." name = "postContent" id="postContent">${p.postContent }</textarea><br>
					<div class="clearfix"></div>
					<div class="clearfix"></div>
					<label>Publisher: </label>&nbsp;<button type="button" class="btn btn-info">${un }</button><br><br><br>
					<p class="post-terms">By clicking <strong>post Button</strong> you accept our <a href="${pageContext.request.contextPath }/Lazy.jsp" target="_blank">Terms of Use </a> and <a href="${pageContext.request.contextPath }/Lazy.jsp" target="_blank">Privacy Policy</a></p>
								<input type="submit" value="Post" onclick="this.disabled=true;this.form.submit();" />
					<div class="clearfix"></div>

					</form>
					</div>
			</div>
		</div>	
	<!-- // Submit Ad -->
<jsp:include page="common/foot_post.jsp"></jsp:include>
</body>
</html>