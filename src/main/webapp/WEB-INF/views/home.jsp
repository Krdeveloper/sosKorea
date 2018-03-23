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
		body{
			background-color: #BDBDBD;
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
              
            </div>
          </div>
         
        </div>
        
      </div>
    </header>
	
	<!-- Portfolio Section -->
	
      <h2>The Embassies</h2>

      <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="https://www.gov.uk/world/organisations/british-embassy-seoul"><img class="card-img-top" src='${pageContext.request.contextPath}/resources/img/uk_flag.jpg' alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="https://www.gov.uk/world/organisations/british-embassy-seoul">UK</a>
              </h4>
              <p class="card-text">
Address : Sejong-daero 19-gil 24 Jung-gu Seoul 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;04519<br>
Email : Consular.Seoul@fco.gov.uk<br>
Telephone : +82 (0)2 3210 5500
</p>
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
              <p class="card-text">Address : US Embassy in Seoul, Korea
188 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sejong-daero, Jongno-gu,
Seoul, Korea
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;03141<br>
Telephone : +82-2-397-4114</p>
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
              <p class="card-text">Address : 21, Jeongdong-gil (Jeong-dong),<br> 
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jung-gu
Seoul, 04518<br>
Email : seoul@international.gc.ca<br>
Telephone : +82-2-3783-6000</p>
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
              <p class="card-text">Address : 19th Fl, Kyobo Building, 1 Jongro,
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jongno-Gu, Seoul 03154<br>
Telephone :  +822 2003 0100</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="https://www.dfa.ie/irish-embassy/republic-of-korea/"><img class="card-img-top" src='${pageContext.request.contextPath}/resources/img/ireland_flag.jpg' alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="https://www.dfa.ie/irish-embassy/republic-of-korea/">IRELAND</a>
              </h4>
              <p class="card-text">Address : Leema Bldg. 13F.,
42, Jongro 1-gil,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jongno-gu,
Seoul, Korea 03152<br>
Telephone: +82-2721 7200</p>
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
              <p class="card-text">Address : 104 Dokseodang-ro (Hannam-dong) 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yongsan-gu 
Seoul 140-884<br>
Email : general@southafrica-embassy.or.kr<br>
Telephone : + 82 (0)2 2077 5900</p>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->
      
    <!-- Page Content -->
    <div class="container">

      <h1 class="my-4">New Jobs</h1>

      <!-- Marketing Icons Section -->
      <div class="row">
        <!-- <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div> -->
        <c:forEach items="${listTopThree }" var="jobsVO">
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">${jobsVO.title }</h4>
            <div class="card-body">
              <p class="card-text">${jobsVO.content }</p>
            </div>
            <div class="card-footer">
              <a href="/jobs/read${pageMaker.makeQuery(pageMaker.cri.page) }&bno=${jobsVO.bno }" class="btn btn-primary">Detail</a>
            </div>
          </div>
        </div>
        </c:forEach>
        <!-- <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div> -->
      </div>
      <!-- /.row -->

      <hr>

      <!-- Features Section -->
      <div class="row">
        <div class="col-lg-6">
          <h2>Welcome to Teach ESL Korea</h2>
          <p>Here are some things that you might need...</p>
          <ul>
            <li>
              <strong>up to date job opportunities</strong>
            </li>
            <li>information about jobs from those who have worked there</li>
            <li>ideas on where to eat and drink</li>
            <li>advice from others who have been in your shoes</li>
            <li>links to useful sites for your stay in Korea</li>
          </ul>
          <p>Welcome to The Secrets of South Korea. This page is aimed at the expats in Korea.
            This is a platform for us expats to celebrate the best and chat about the rest.</p>
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
          <p>Address : 1.Daegu Suseonggu sawoldong   2.Gyeonggi-do Hwaseong City Bansongdong</p>
          <p>Phone : (+82)10-3655-20777    	
          </p>
          <a href=""><p class="fa fa-facebook-square">Facebook</p></a>
          	<a href=""><p class="fa fa-instagram">Instagram</p></a>
        	<a href=""><p class="fa fa-twitter-square">Twitter</p></a>
          
        </div>
        <div class="col-md-4">
          <a class="btn btn-lg btn-secondary btn-block" href="#">Go to The Top</a>
        </div>
      </div>

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">
        Copyright &copy; By Krdeveloper 2018
          
          
        
        </p>
        
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>

  
