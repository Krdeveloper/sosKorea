<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
        <li class="breadcrumb-item active">Contact</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Map Column -->
        <div class="col-lg-8 mb-4">
          <!-- Embedded Google Map -->
          <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?hl=en&amp;ie=UTF8&amp;ll=37.0625,-95.677068&amp;spn=56.506174,79.013672&amp;t=m&amp;z=4&amp;output=embed"></iframe>
        </div>
        <!-- Contact Details Column -->
        <div class="col-lg-4 mb-4">
          <h3>Contact Details</h3>
          <p>
            3481 Melrose Place
            <br>Beverly Hills, CA 90210
            <br>
          </p>
          <p>
            <abbr title="Phone">P</abbr>: (123) 456-7890
          </p>
          <p>
            <abbr title="Email">E</abbr>:
            <a href="mailto:name@example.com">name@example.com
            </a>
          </p>
          <p>
            <abbr title="Hours">H</abbr>: Monday - Friday: 9:00 AM to 5:00 PM
          </p>
        </div>
      </div>
      <!-- /.row -->

      <!-- Contact Form -->
      <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
      <div class="row">
        <div class="col-lg-8 mb-4">
          <h3>Register</h3>
          <form enctype="multipart/form-data" role="form" action="register" method="post" name="sentMessage" id="contactForm" novalidate>
            <div class="control-group form-group">
              <div class="controls">
                <label>Title</label>
                <input type="text" name="title" class="form-control" id="name" required data-validation-required-message="Please enter your name.">
                <p class="help-block"></p>
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>Content</label>
                <textarea rows="5" cols="" name="content"  
								class="form-control"></textarea>
                
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>Writer</label>
                <input type="text" name="userid" class="form-control" id="email" required data-validation-required-message="Please enter your email address.">
              </div>
            </div>
            <!-- <div class="control-group form-group">
              <div class="controls">
                <label>Message:</label>
                <textarea rows="10" cols="100" class="form-control" id="message" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
              </div>
            </div> -->
            
            <div class="control-group form-group">
            	<label for="exampleInputEmail1">Files</label>
              	<input type="file" name="imgFiles" class="form-control" multiple="multiple">
            </div> 
            
            
            
            <div class="box-footer">
            	<div>
            		<hr>
            	</div>
            	<div id="success"></div>
            	<!-- For success/fail messages -->
            	
            	<ul class="mailbox-attachments clearfix uploadedList">                	 
            	</ul>
            	
            	
            	<button type="submit" class="btn btn-primary" id="sendMessageButton">Submit</button>
           		
           		
            </div>            
            
          </form>
        </div>

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
    
    <!-- <style>
    	.fileDrop{
    		width:80%;
    		height:100px;
    		border:1px dotted gray;
    		background-color: lightslategrey;
    		margin:auto;
    	}
    </style> -->
	
	<script id="template" type="text/x-handlebars-template">		
		<li>
			<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}"
			alt="Attachment"></span>
			<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a href="{{fullName}}" 
				class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
			</div>
		</li>
	</script>
	
	<!-- <script>
		function checkImageType(fileName){
			var pattern = /jpg|gif|png|jpeg/i;
			return fileName.match(pattern);
		}
		
		function getFileInfo(fullName){
			var fileName, imgsrc, getLink;
			
			var fileLink;
			
			if(checkImageType(fullName)){
				imgsrc = "/jobs/displayFile?fileName="+fullName;
				fileLink = fullName.substr(14);
				
				var front = fullName.substr(0,12);  // /2017/00/00/
				var end = fullName.substr(14);
				
				getLink = "/jobs/displayFile?fileName="+front+end;
			}else{
				imgsrc="${pageContext.request.contextPath}/resources/img/korea_flag.jpg";
				fileLink=fullName.substr(12);
				getLink = "/jobs/displayFile?fileName="+fullName;
			}
			fileName = fileLink.substr(fileLink.indexOf("_")+1);
			
			return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
		}
		
	 	var template = Handlebars.compile($("#template").html());
	
		$(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$(".fileDrop").on("drop", function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			
			var file = files[0];
			
			var formData = new FormData();
			
			formData.append("file", file);
			
			$.ajax({
				url: '/jobs/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success: function(data){
					var fileInfo = getFileInfo(data);
					var html = template(fileInfo);
					$(".uploadedList").append(html);
				}
			});
		});
		
		$("#sendMessageButton").submit(function(event){
			event.preventDefault();
			var that = $(this);
			var str = "";
			
			$(".uploadedList .delbtn").each(function(index){
				str += "<input type='hidden' name='files["+index+"]' value='"+$(this).
				attr("href") +"'> ";
			});
			
			that.append(str);
			
			that.get(0).submit();
		});
	</script> -->
	
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
   <%--  <script src="${pageContext.request.contextPath}/resources/js/contact_me.js"></script> --%>

  </body>

</html>