<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MagicBBS: Category: ${category}</title>
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
   <script type="text/javascript">
		function checkAll(){
			$("tbody input[type='checkbox']").prop("checked", $("#allselect").is(":checked"));
		}
		
		function getCheckboxVal(){
			var ids = "";
			$("tbody input:checked").each(function(i,dom){
				if(""!=ids){
					ids+=","+dom.value;
				}else{
					ids+=dom.value;
				}
			});
			$("#pIds").val(ids);
			$("#m").val("batchDelete");
		}
		
		function deleteWarning(){
			if(!confirm("This process is irreversible! Are you sure you want to delete?")){
				return false;
			}
			return true;
		}
	</script>
	
</head>
<body>
<jsp:include page="common/NavigationBar.jsp"></jsp:include>

	<div class="banner text-center">
	  <div class="container">    
	         <h3>&nbsp;</h3>
			<h1 style = "color: black; font-family: 'Comic Sans MS">Share Your   <span  style = "color: black ; font-family: 'Comic Sans MS" class="segment-heading"> Fantasies </span> with MagicBBS</h1><br>
			<a href="${pageContext.request.contextPath }/indexSelect?m=allPost" style="font-family: 'Comic Sans MS">Check All the Posts</a>
	  </div>
	</div>

	<div class="submit-ad main-grid-border">
		<div class="container">
			<h2 class="head" style =" font-family: 'Comic Sans MS'">${category} Posts </h2>
		</div>
	</div>
			
<div class="panel panel-default">
  <!-- Default panel contents -->
 <div class="page-header"></div>
  <div class="panel-body"></div>
  
 		 <div class="row">
		 <div class="col-lg-6">
    		<div class="input-group">
    		
    		</div><!-- /input-group -->
  		</div><!-- /.col-lg-6 -->
		</div><!-- /.row -->
		
		
  <!-- Table -->
  <table class="table">
  <thead>
		<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Content</th>
				<th>Author</th>
				<th>Publish Time</th>
				<th>Operation</th>
		</tr>
		</thead>
		<tbody id = "dataTable">
				<c:forEach items="${cList}" var = "posts" varStatus = "s">
								<tr>
										<td>${s.count}</td>
										<td>${posts.postTitle }</td>
										<td>${posts.postContent }</td>
										<td>${posts.postAuthor }</td>
										<td>${posts.publishTime }</td>
										<td>
											<a href="${ pageContext.request.contextPath}/	indexSelect?id=${posts.id }&m=checkPost" target="_blank" role="button" data-toggle="modal">Take a Glance</a>&nbsp;&nbsp;	
									</td>
								</tr>			
							</c:forEach >	
							</tbody>
						</table>
				</div>
				
				<jsp:include page="common/foot_postMag.jsp"></jsp:include>		
</body>
</html>
