<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/nav.jsp" %> 
<style>
      	.youtubeWrap {
  			position: relative;
 			width: 100%;
  			padding-bottom: 56.25%;
		}
		.youtubeWrap iframe {
 		 	position: absolute;
 		 	width: 100%;
  			height: 100%;
		} 
      </style>
<header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('${pageContext.request.contextPath}/resources/img/korea_flag.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Blacklist</h3>
              <p>This is a description for the first slide.</p>
            </div>
          </div>
         
        </div>
        
      </div>
    </header>
	
	<!-- Portfolio Section -->
      <h2>Portfolio Heading</h2>

      <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="https://www.gov.uk/world/organisations/british-embassy-seoul"><img class="card-img-top" src='${pageContext.request.contextPath}/resources/img/uk_flag.jpg' alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="https://www.gov.uk/world/organisations/british-embassy-seoul">UK</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="https://kr.usembassy.gov/embassy-consulate/seoul/"><img class="card-img-top" src='${pageContext.request.contextPath}/resources/img/usa_flag.jpg' alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="https://kr.usembassy.gov/embassy-consulate/seoul/">USA</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="http://www.canadainternational.gc.ca/korea-coree/index.aspx?lang=eng"><img class="card-img-top" src='${pageContext.request.contextPath}/resources/img/canada_flag.jpg' alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="http://www.canadainternational.gc.ca/korea-coree/index.aspx?lang=eng">CANADA</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="http://southkorea.embassy.gov.au/"><img class="card-img-top" src='${pageContext.request.contextPath}/resources/img/australia_flag.jpg' alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="http://southkorea.embassy.gov.au/">AUSTRALIA</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="https://www.mfat.govt.nz/ko/countries-and-regions/north-asia/republic-of-korea-south/new-zealand-embassy/"><img class="card-img-top" src='${pageContext.request.contextPath}/resources/img/newzealand_flag.jpg' alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="https://www.mfat.govt.nz/ko/countries-and-regions/north-asia/republic-of-korea-south/new-zealand-embassy/">NEW-ZEALAND</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="http://www.southafrica-embassy.or.kr/"><img class="card-img-top" src='${pageContext.request.contextPath}/resources/img/southafrica_flag.jpg' alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="http://www.southafrica-embassy.or.kr/">SOUTH-AFRICA</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->
      
    <!-- Page Content -->
    <div class="container">

      <h1 class="my-4">Welcome to Modern Business</h1>

      <!-- Marketing Icons Section -->
      <div class="row">
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      

      <!-- Features Section -->
      <div class="row">
        <div class="col-lg-6">
          <h2>Modern Business Features</h2>
          <p>The Modern Business template by Start Bootstrap includes:</p>
          <ul>
            <li>
              <strong>Bootstrap v4</strong>
            </li>
            <li>jQuery</li>
            <li>Font Awesome</li>
            <li>Working contact form with validation</li>
            <li>Unstyled page elements for easy customization</li>
          </ul>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
        </div>
        <div class="col-lg-6">
          <!-- <img class="img-fluid rounded" src="http://placehold.it/700x450" alt=""> -->
          <div class="youtubeWrap">
          	<iframe width="560" height="315" src="https://www.youtube.com/embed/vXZsnlRtjQk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
          </div>
        </div>
      </div>
      <!-- /.row -->
      
      

      <hr>

      <!-- Call to Action Section -->
      <div class="row mb-4">
        <div class="col-md-8">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
        </div>
        <div class="col-md-4">
          <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
        </div>
      </div>

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>

  
