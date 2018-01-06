<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

   <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">Contact
        <small>Subheading</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Jobs</li>
      </ol>

      

      <!-- Contact Form -->
      <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
      <div class="row">
        <div class="col-lg-8 mb-4">
          <h3>Modify</h3>
          <form role="form" method="post" name="sentMessage" id="contactForm" novalidate>   	
          
            <div class="control-group form-group">
              <div class="controls">
                <label>Title</label>
                <input type="text" name="title" class="form-control" id="name" 
                value="${jobsVO.title }" required data-validation-required-message="Please enter your name.">
                <p class="help-block"></p>
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>Content</label>                
                <textarea rows="5" cols="" name="content"  
								class="form-control">${jobsVO.content }</textarea>
               
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>Writer</label>
                <input type="text" name="userid" class="form-control" readonly="readonly" id="email" 
                value="${jobsVO.userid }" required data-validation-required-message="Please enter your email address.">
              </div>
            </div>
            <!-- <div class="control-group form-group">
              <div class="controls">
                <label>Message:</label>
                <textarea rows="10" cols="100" class="form-control" id="message" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
              </div>
            </div> -->
            <div id="success"></div>
            
            <input type="hidden" name="bno" value="${jobsVO.bno }">
            
            <input type="hidden" name="page" value="${cri.page }">
            <input type="hidden" name="perPageNum" value="${cri.perPageNum }">
            <input type="hidden" name="searchType" value="${cri.searchType }">
            <input type="hidden" name="keyword" value="${cri.keyword }">
            
            </form>
            
            <div class="box-footer">
        	<button type="submit" class="btn btn-primary" id="sendMessageButton">SAVE</button>        	
        	<button type="submit" class="btn btn-warning" id="sendMessageButton">CANCEL</button>
       	    </div>
          
        </div>
        

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
    
    <script type="text/javascript"> 
		$(document).ready(
		  function(){
			  
			var formObj = $("form[role='form']");
			
			console.log(formObj);
			
			$(".btn-primary").on("click", function(){
				
				formObj.attr("action", "/jobs/modify");
				formObj.submit();
			});	
			
			$(".btn-warning").on("click", function(){
				self.location="/jobs/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";				
			});			
			
			
		});
		
	</script>

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

    <!-- Contact form JavaScript -->
    <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <script src="${pageContext.request.contextPath}/resources/js/jqBootstrapValidation.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/resources/js/contact_me.js"></script> --%>

  </body>

</html>