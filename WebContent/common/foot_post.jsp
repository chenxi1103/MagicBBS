<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- //Categories -->
	<!--footer section start-->		
		<footer>
			<div class="footer-top">
				<div class="container">
					<div class="foo-grids">
						<div class="col-md-3 footer-grid">
							<h4 class="footer-head">Who I Am</h4>
							<p>Hi! My name is Chenxi Li. I am a master student majoring in Electrical & Computer Engineering in Carnegie Mellon University</p>
							<p>This BBS is built for strengthening my J2EE programming skills. If you have any suggestions, please feel free to contact me! Thanks! Have fun here! </p>
						</div>
					
						<div class="col-md-3 footer-grid">
							<h4 class="footer-head">Information</h4>
							<ul>
								<li><a href="${pageContext.request.contextPath }/Lazy.jsp">Locations Map</a></li>	
								<li><a href="t${pageContext.request.contextPath }/Lazy.jsp">Terms of Use</a></li>
								<li><a href="${pageContext.request.contextPath }/Lazy.jsp">Popular searches</a></li>	
								<li><a href="${pageContext.request.contextPath }/Lazy.jsp">Privacy Policy</a></li>	
							</ul>
						</div>
						<div class="col-md-3 footer-grid">
							<h4 class="footer-head">Contact Me</h4>
							<address>
								<ul class="location">
									<li><span class="glyphicon glyphicon-map-marker"></span></li>
									<li>4601 Bayard Street, Apt#605, Pittsburgh, PA, 15213</li>
									<div class="clearfix"></div>
								</ul>	
								<ul class="location">
									<li><span class="glyphicon glyphicon-earphone"></span></li>
									<li>(765)-337-0330</li>
									<div class="clearfix"></div>
								</ul>	
								<ul class="location">
									<li><span class="glyphicon glyphicon-envelope"></span></li>
									<li><a href="mailto:info@example.com">chenxili@andrew.cmu.edu</a></li>
									<div class="clearfix"></div>
								</ul>						
							</address>
						</div>
						
						<div class="col-md-3 footer-grid">
								<img src="images/head/post.png"/>
						</div>
						<div class="clearfix"></div>
					</div>						
				</div>	
			</div>	
			<div class="footer-bottom text-center">
			<div class="container">
				<div class="footer-logo">
					<a href="index.html"><span>Magic</span>BBS</a>
				</div>
				<div class="footer-social-icons">
					<ul>
						<li><a class="facebook" href="#"><span>Facebook</span></a></li>
						<li><a class="twitter" href="#"><span>Twitter</span></a></li>
						<li><a class="flickr" href="https://www.linkedin.com/in/chenxi-li-deborah/"><span>LinkedIn</span></a></li>
						<li><a class="googleplus" href="#"><span>Google+</span></a></li>
						<li><a class="dribbble" href="#"><span>Dribbble</span></a></li>
					</ul>
				</div>
				<jsp:include page="copyRight.jsp"></jsp:include>
				<div class="clearfix"></div>
			</div>
		</div>
		</footer>
        <!--footer section end-->