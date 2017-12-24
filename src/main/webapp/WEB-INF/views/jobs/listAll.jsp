<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%-- <%@ page session="false" %> --%>
   
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content = "IE-edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>sosKorea</title>
	<!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css2/bootstrap.min.css" rel="stylesheet">
   	<!-- Custom styles for this template -->
   	<link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet">
   	<link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   	 <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">

</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">

<!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.html">sosKorea</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="/jobs/listAll">Jobs</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="services.html">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contact.html">Contact</a>
            </li>
            <li class="nav-item  dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Portfolio
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
                <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
                <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
                <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
                <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Blog
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
                <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
                <a class="dropdown-item" href="blog-post.html">Blog Post</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Other Pages
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="full-width.html">Full Width Page</a>
                <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
                <a class="dropdown-item" href="faq.html">FAQ</a>
                <a class="dropdown-item" href="404.html">404</a>
                <a class="dropdown-item" href="pricing.html">Pricing Table</a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>




	<div>
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item active">Jobs</li>
			</ol>
			<!-- Example DataTables Card-->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-table"></i>Jobs
				</div>
				<div class="card-body">

					<div class="table-responsive">
						<div id="dataTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4">
							<div class="row">
								<div class="col-sm-12 col-md-6">
									<div class="dataTables_length" id="dataTalbe_length">
										<label> "Show " <select name="dataTable_length"
											aria-controls="dataTable"
											class="form-control form-control-sm">
												<option value="10">10</option>
												<option value="25">25</option>
												<option value="50">50</option>
												<option value="100">100</option>
										</select> " entries"
										</label>
									</div>
								</div>
								<div class="col-sm-12 col-md-6">
									<div class="dataTable_filter" id="dataTables_filter">
										<label> "Search:" <input type="search"
											class="form-control form-control-sm" placeholder
											aria-controls="dataTable">
										</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0" role="grid" aria-describedby="dataTable_info"
										style="width: 100%;">
										<thead>
											<tr>
												<th>No.</th>
												<th>Title(n City)</th>
												<th>Writer</th>
												<th>Regdate</th>
												<th>Viewcnt</th>
												<th>Replycnt</th>
											</tr>
										</thead>
										
										<tbody>
											<c:forEach items="${list }" var="jobsVO">
											  <tr>
												<th>${jobsVO.bno }</th>
												<th><a href="/jobs/read?bno=${jobsVO.bno }">${jobsVO.title}</a></th>
												<th>${jobsVO.userid }</th>
												<th><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${jobsVO.regdate }"/></th>
												<th><span class="badge bg-red">
													${jobsVO.viewcnt }
												    </span></th>
												<th><span class="badge bg-red">
													${jobsVO.replycnt }
												    </span></th>
											  </tr>
											
											
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="dataTable_info" role="status"
										aria-live="polite">
										<a href="/jobs/register">등록</a> Showing 1 to 10 of 57entries
									</div>
								</div>
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers"
										id="dataTable_paginate">
										<ul class="pagination">
											<li class="paginate_button page-item previous disabled"
												id="dataTable_previous"><a href="#"
												aria-controls="dataTable" data-dt-idx="0" tabindex="0"
												class="page-link">Previous</a></li>
											<li class="paginate_button page-item active"><a href="#"
												aria-controls="dataTable" data-dt-idx="1" tabindex="0"
												class="page-link">1</a></li>
											<li class="paginate_button page-item"><a href="#"
												aria-controls="dataTable" data-dt-idx="2" tabindex="0"
												class="page-link">2</a></li>
											<li class="paginate_button page-item"><a href="#"
												aria-controls="dataTable" data-dt-idx="3" tabindex="0"
												class="page-link">3</a></li>
											<li class="paginate_button page-item"><a href="#"
												aria-controls="dataTable" data-dt-idx="4" tabindex="0"
												class="page-link">4</a></li>
											<li class="paginate_button page-item"><a href="#"
												aria-controls="dataTable" data-dt-idx="5" tabindex="0"
												class="page-link">5</a></li>
											<li class="paginate_button page-item next"
												id="dataTable_next"><a href="#"
												aria-controls="dataTable" data-dt-idx="6" tabindex="0"
												class="page-link">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			</div>
		</div>
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->
		<!-- Footer -->
		<footer class="py-5 bg-dark">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; Your
					Website 2017</p>
			</div>
			<!-- /.container -->
		</footer>

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fa fa-angle-up"></i>
		</a>


		<!-- Bootstrap core JavaScript-->
		<script
			src="${pageContext.request.contextPath}/resources/vendor/jquery2/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script
			src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Page level plugin JavaScript-->
		<script
			src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.js"></script>
		<!-- Custom scripts for all pages-->
		<script
			src="${pageContext.request.contextPath}/resources/js/sb-admin.min.js"></script>


		<!-- Bootstrap core JavaScript -->
		<script
			src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Contact form JavaScript -->
		<!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
		<script
			src="${pageContext.request.contextPath}/resources/js/jqBootstrapValidation.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/contact_me.js"></script>

		<!-- Custom scripts for this page-->
		<script
			src="${pageContext.request.contextPath}/resources/js/sb-admin-datatables.min.js"></script>
		<script type="text/javascript">
   		var result = '${msg}';
   		
   		if(result=='SUCCESS'){
   			alert("complete!!!");
   		}
   </script>
	</div>
</body>
</html>