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

<style>
      	
		body{
			background-color: #BDBDBD;
		}
      </style>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">



<!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="/">sosKorea</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="/jobs/listPage">Jobs</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">FleaMarket</a>
            </li>
            <!-- <li class="nav-item">
              <a class="nav-link" href="contact.html">Contact</a>
            </li> -->
            <!-- <li class="nav-item  dropdown">
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
            </li> -->
            <!-- <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Blog
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
                <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
                <a class="dropdown-item" href="blog-post.html">Blog Post</a>
              </div>
            </li> -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                [Agree Disagree]
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="">Tell</a>
                <a class="dropdown-item" href="">Me</a>
                <a class="dropdown-item" href="">What</a>
                <a class="dropdown-item" href="">U</a>
                <a class="dropdown-item" href="">Need</a>
              </div>
            </li>
            <li class="nav-item">
              <!-- <a class="nav-link" href="contact.html">Contact</a> -->
              <c:if test="${empty login }">
                   <a href="/user/login" class="btn btn-default btn-flat">log in</a>
               </c:if>
               <c:if test="${!empty login }">
                   <a href="/user/logout" class="btn btn-default btn-flat">log out</a>
               </c:if>
            </li>
          </ul>
        </div>
      </div>
    </nav>




	<div>
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Home</a></li>
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
										<!-- <label> "Show " <select name="dataTable_length"
											aria-controls="dataTable"
											class="form-control form-control-sm">
												<option value="10">10</option>
												<option value="25">25</option>
												<option value="50">50</option>
												<option value="100">100</option>
										</select> " entries"
										</label> -->
									</div>
								</div>
								<div class="col-sm-12 col-md-6">
									<div class="dataTable_filter" id="dataTables_filter">
										<select name="searchType">
											<option value="n"
												<c:out value="${cri.searchType==null?'selected':'' }"/>>----------</option>
											<option value="t" 
												<c:out value="${cri.searchType eq 't'?'selected':'' }"/>>Title</option>
											<option value="c"
												<c:out value="${cri.searchType eq 'c'?'selected':'' }"/>>Content</option>
											<option value="w"
												<c:out value="${cri.searchType eq 'w'?'selected':'' }"/>>Writer</option>							
											<option value="tc"
												<c:out value="${cri.searchType eq 'tc'?'selected':'' }"/>>Title OR Content</option>
											<option value="cw"
												<c:out value="${cri.searchType eq 'cw'?'selected':'' }"/>>Content OR Writer</option>
											<option value="tcw"
												<c:out value="${cri.searchType eq 'tcw'?'selected':'' }"/>>Title OR Content OR Writer</option>
										</select>
										<input type="text" id="keywordInput" value="${cri.keyword }" name="keyword">
										<button id="searchBtn">Search</button> 
										<button id="newBtn">New Board</button> 
										<!-- <label>Search: <input type="search"
											class="form-control form-control-sm" placeholder
											aria-controls="dataTable">
										</label> -->
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
												<th><a href="/jobs/read${pageMaker.makeQuery(pageMaker.cri.page) }&bno=${jobsVO.bno }">${jobsVO.title}</a></th>
												<th>${jobsVO.userid }</th>
												<th><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${jobsVO.regdate }"/></th>
												<th><span class="badge bg-red">
													${jobsVO.viewcnt }
												    </span></th>
												<th><span class="badge bg-red">
													<strong>[ ${jobsVO.replycnt } ]</strong>
												    </span></th>
											  </tr>											
											
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<!-- <div class="dataTables_info" id="dataTable_info" role="status"
										aria-live="polite">
										<a href="/jobs/register">등록</a> Showing 1 to 10 of 57entries
									</div> -->
								</div> 
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers"
										id="dataTable_paginate">
										<ul class="pagination">
										  <c:if test="${pageMaker.prev }">
											<li class="paginate_button page-item previous"
												id="dataTable_previous"><a href="listPage${pageMaker.makeQuery(pageMaker.startPage-1) }"
												aria-controls="dataTable"
												class="page-link">Previous</a></li>
										  </c:if>
										  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
											 <li 
											   <c:out value="${pageMaker.cri.page==idx?'class =active':''}"/>   
											   class= "paginate_button page-item active"> 											   
											   <a href="listPage${pageMaker.makeQuery(idx)}"
												aria-controls="dataTable"
												class="page-link">${idx }</a></li>
										  </c:forEach>
											
										  <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
											<li class="paginate_button page-item next"
												id="dataTable_next"><a href="listPage${pageMaker.makeQuery(pageMaker.endPage+1) }"
												aria-controls="dataTable"
												class="page-link">Next</a></li>
										  </c:if>
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
				<p class="m-0 text-center text-white">Copyright &copy; By Krdeveloper 2018</p>
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
   		
   		
			$(document).ready(
					function() {
					   /*  $('#searchBtn').on(
								"click",
								function(event) {
									 self.location = "listPage"
											+ "${pageMaker.makeQuery(1)}"
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ $("input[name='keyword']").val();  
									
								});   */
								
							    $("#searchBtn").click(function(){
									var keyword = $("input[name='keyword']").val();
									var searchType=$("select").val();
									location.href="listPage?page=1&perPageNum=10&searchType=" + searchType + "&keyword=" + keyword;
								}); 
								
								

						$('#newBtn').on("click", function(evt) {
							self.location = "register";
						});
					}); 
		</script>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>  
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
    
</body>
</html>