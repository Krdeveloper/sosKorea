<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp" %> 

<%-- <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />  --%> 
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> 
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />  
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />  
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" /> 
    
    
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
        <li class="breadcrumb-item active">Jobs</li>
      </ol>

      

      <!-- Contact Form -->
      <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
      <div class="row">
        <div class="col-lg-8 mb-4">
          <h3>Modify</h3>
          <form enctype="multipart/form-data" role="form" action="modify" method="post" name="sentMessage" id="contactForm" novalidate>   	
          
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
            
            <div class="control-group form-group">
            	<label for="exampleInputEmail1">Files</label>
              	<input type="file"  name="imgFiles" class="form-control" multiple="multiple">
              	
            </div> 
            
            <!-- <div class="control-group form-group">
            	<label for="exampleInputEmail1">File Drop Here</label>
              	<div class="fileDrop"></div>
            </div> -->
            
            <div id="success"></div>
            
            <input type="hidden" name="bno" value="${jobsVO.bno }">
            
            <input type="hidden" name="page" value="${cri.page }">
            <input type="hidden" name="perPageNum" value="${cri.perPageNum }">
            <input type="hidden" name="searchType" value="${cri.searchType }">
            <input type="hidden" name="keyword" value="${cri.keyword }">
            
            <ul class="mailbox-attachments clearfix uploadedList">                	 
            	</ul>
            	
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
	
	<!-- <style>
    	.fileDrop{
    		width:80%;
    		height:100px;
    		border:1px dotted gray;
    		background-color: lightslategrey;
    		margin:auto;
    	}
    </style> -->
    
	<script id="templateAttach" type="text/x-handlebars-template">
		<li data-src='{{fullName}}'>
			<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}"
			alt="Attachment"></span>
		<div class="mailbox-attachment-info">
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
			<i class="fa fa-fw fa-remove"></i></a>
		</div>
		</li>
	</script>
	
	<script>
	$(".uploadedList").on("click",".delbtn", function(e){
		e.preventDefault();
		alert("testRemove");
		var that = $(this);
		that.parent().parent().remove();
	})
	
	
	
	
	
	var bno= ${jobsVO.bno};
	
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
			imgsrc="${pageContext.request.contextPath}/resources/img/files.png";
			fileLink=fullName.substr(12);
			getLink = "/jobs/displayFile?fileName="+fullName;
		}
		fileName = fileLink.substr(fileLink.indexOf("_")+1);
		
		return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
	}
	
	var template2 = Handlebars.compile($("#templateAttach").html());	
	
	$.getJSON("/jobs/getAttach/" + bno, function(list){
		$(list).each(function(){
			var fileInfo = getFileInfo(this);
			
			var html = template2(fileInfo);
			
			$(".uploadedList").append(html);
		})
	})	
	
	/* $(".fileDrop").on("dragenter dragover", function(event){
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
					var html = template2(fileInfo);
					$(".uploadedList").append(html);
				}
			});
		});
		
		$("#sendMessageButton").submit(function(event){
			event.preventDefault();
			var that = $(this);
			var str = "";
			
			$(".uploadedList .delbtn").each(function(index){
				str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
			});
			
			that.append(str);
			
			that.get(0).submit();
		}); */
	
	
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
	
	<!-- Bootstrap 3.3.2 JS -->
    <%-- <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> --%> 
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.min.js'></script> 
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/app.min.js" type="text/javascript"></script> 
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/demo.js" type="text/javascript"></script>  
  </body>

</html>