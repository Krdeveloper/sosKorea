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

 	<div class='popup back' style="display:none;"></div>
    <div id="popup_front" class='popup front' style="display:none;">
      	<img id="popup_img">
    </div>
      
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
          <h3>Read</h3>
          <form role="form" action="modify" method="post" name="sentMessage" id="contactForm" novalidate>
          	<input type="hidden" name="bno" value="${jobsVO.bno }">
          	<input type="hidden" name="page" value="${cri.page }">
          	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
          	<input type="hidden" name="searchType" value="${cri.searchType }">
          	<input type="hidden" name="keyword" value="${cri.keyword }">
          </form>
            <div class="control-group form-group">
              <div class="controls">
                <label>Title</label>
                <input type="text" name="title" class="form-control" id="name" 
                value="${jobsVO.title }" readonly="readonly" required data-validation-required-message="Please enter your name.">
                <p class="help-block"></p>
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>Content</label>
                <textarea rows="5" cols="" name="content"  
								class="form-control" readonly="readonly">${jobsVO.content }</textarea>
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>Writer</label>
                <input type="text" name="userid" class="form-control" readonly="readonly" id="email" 
                value="${jobsVO.userid }" required data-validation-required-message="Please enter your email address.">
              </div>
            </div>
            
            <ul class="mailbox-attachments clearfix uploadedList">                	 
            	</ul>
            	
            <!-- <div class="control-group form-group">
              <div class="controls">
                <label>Message:</label>
                <textarea rows="10" cols="100" class="form-control" id="message" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
              </div>
            </div> -->
            <div id="success"></div>
            
            <div class="box-footer">
        	<button type="submit" class="btn btn-warning modifyBtn" id="sendMessageButton">Modify</button>
        	<button type="submit" class="btn btn-danger removeBtn" id="sendMessageButton">Remove</button>
        	<button type="submit" class="btn btn-primary goListBtn" id="sendMessageButton">Go List</button>
       	    </div>
          
        </div>
        
       

      </div>
      <!-- /.row -->
      
      
      
      <style type="text/css">
      	.popup {position:absolute;}
      	.back {background-color:gray; opacity:0.5; width:100%; height:300%;
      			overflow:hidden; z-index:1101;}
      	.front{
      		z-index:1110; opacity:1; border:1px; margin:auto;
      	} 
      	.show2{
      		position:relative; 
      		max-width:1200px;
      		max-height:800px;
      		overflow:auto;       		 		
      	}  	
      	 	   
      </style> 
      
      <script type="text/javascript">
      	 $(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
      		
      		var fileLink = $(this).attr("href");
      		
      		if(checkImageType(fileLink)){
      			
      			event.preventDefault();
      			
      			var imgTag = $("#popup_img");
      			imgTag.attr("src",fileLink);
      			
      			console.log(imgTag.attr("src"));
      			
      			$(".popup").show('slow');
      			imgTag.addClass("show2");
      		}      		
      	}); 
      	
      	$("#popup_img").on("click", function(){
      		$(".popup").hide('slow');
      	});
      </script>
      
      <script type="text/javascript"> 
		$(document).ready(function(){
			var formObj = $("form[role='form']");
			console.log(formObj);
			
			$(".modifyBtn").on("click", function(){
				formObj.attr("action", "/jobs/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});			
			$(".removeBtn").on("click", function(){
				
				var replyCnt = $("#replycntSmall").html().replace(/[^0-9]/g,"");
				
				if(replyCnt > 0){
					alert("Sorry. Can not delete if there is reply");
					return;
				} 
				
				var arr=[];
				$(".uploadedList li").each(function(index){
					arr.push($(this).attr("data-src"));
				});
				
				if(arr.length>0){
					$.post("/deleteAllFiles", {files:arr}, function(){
						
					});
				}			
				
				formObj.attr("action", "/jobs/remove");				
				formObj.submit();
			});
			$(".goListBtn").on("click", function(){				
				formObj.attr("method", "get");
				formObj.attr("action", "/jobs/listPage");
				formObj.submit();
			});
		});
		
	</script>
      
      <div class="row">
      	<div class="col-md-12">
      		<div class="box box-success">
      			<div class="box-header">
      				<h3 class="box-title">ADD NEW REPLY</h3>
      			</div>
      			<div class="box-body">
      				<label for="newReplyWriter">Writer</label>
      				<input class="form-control" type="text" placeholder="USER ID"
      				id="newReplyWriter"> <label for="newReplyText">ReplyText</label>
      				<input class="form-control" type="text" placeholder="REPLY TEXT"
      				id="newReplyText">
      			</div>
      			<div class="box-footer">
      				<button type="submit" class="btn btn-primary" id="replyAddBtn">
      				ADD REPLY</button>
      			</div>
      		</div>
      		
      		<ul class="timeline">
      			<li class="time-label btn btn-info" id="repliesDiv"><span class="bg-green">
      				Replies List <small id="replycntSmall">[ ${jobsVO.replycnt} ]</small></span></li>
      		</ul>
      		<div class="text-center dataTables_paginate paging_simple_numbers"
      			id="dataTable_paginate">
      			<ul id="pagination" class="pagination pagination-sm no-margin">
      			</ul>
      		</div>
      	</div>
      </div>

    </div>
    <!-- /.container -->
    
    <div id="modifyModal" class="modal modal-primary fade" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	      	<h4 class="modal-title"></h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>	        
	      </div>
	      <div class="modal-body" data-rno>
	        <p><input type="text" id="replytext" class="form-control"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
	        <button type="button" class="btn btn-danger" id="replyDelBtn">Delete</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div> 
    
    <script id="template" type="text/x-handlebars-template">
		{{#each .}}
		<li class="replyLi" data-rno={{rno}}>
		<i class="fa fa-comments bg-blue"></i>
		 <div class="timeline-item">
			<span class="time">
				<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
			</span>
			<h3 class="timeline-header"><strong>{{rno}}</strong> -{{userid}}</h3>
			<div class="timeline-body">{{replytext}} </div>
			  <div class="timeline-footer">
				<a class="btn btn-primary btn-xs"
						data-toggle="modal" data-target="#modifyModal">Modify</a>
			  </div>
		 </div>
		</li>
		{{/each}}
	</script>
	
	<script id="templateAttach" type="text/x-handlebars-template">
		<li data-src='{{fullName}}'>
			<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}"
			alt="Attachment"></span>
		<div class="mailbox-attachment-info">
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		</div>
		</li>
	</script>
	
	<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth()+1;
		var date = dateObj.getDate();
		
		return year + "/" + month + "/" + date;
	});
	
	var printData = function(replyArr, target, templateObject){
		
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	}
	
	
	
	var bno= ${jobsVO.bno};
	var replyPage=1;
	
	function getPage(pageInfo){
		$.getJSON(pageInfo, function(data){
			printData(data.list, $("#repliesDiv"), $("#template"));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#modifyModal").modal("hide");
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount +" ]");
		});
	}
	
	var printPaging = function(pageMaker, target){
		
		var str="";
		
		if(pageMaker.prev){
			str += "<li class='paginate_button page-item previous' id='dataTable_previous'><a href='"+(pageMaker.startPage-1)
			+"' aria-controls='dataTable' class='page-link'> << </a></li>";
		}
		
		for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++){
			var strClass = pageMaker.cri.page == i?'class=active':'';
			str += "<li "+strClass+" class='paginate_button page-item active'><a href='"+i+"' aria-controls='dataTable' class='page-link'>"+i+"</a></li>";
		}
		
		if(pageMaker.next){
			str += "<li class='paginate_button page-item next' id='dataTable_next'><a href='"+(pageMaker.endPage + 1)
			+"' aria-controls='dataTable' class='page-link'> >> </a></li>";
		}
		
		target.html(str);
	};
	
	$("#repliesDiv").on("click", function(){
		/* if($(".timeline li").size() > 1){
			return;
		}  */
		getPage("/replies/" + bno + "/1");
	});
	
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		replyPage = $(this).attr("href");
		getPage("/replies/"+bno+"/"+replyPage);
	});
	
	$("#replyAddBtn").click(function(){
		var replyerObj = $("#newReplyWriter");
		var replytextObj =  $("#newReplyText");
		var replyer = replyerObj.val();
		var replytext = replytextObj.val();		
		
		$.ajax({			
			type:"post",
			url:"/replies/",
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"POST"},			
			dataType:"text",
			data:JSON.stringify({bno:bno, userid:replyer, replytext:replytext}),			
			success:function(result){
				console.log("result: " + result);
				if(result=="SUCCESS"){
					alert("등록되었습니다.");
					replyPage=1;
					getPage("/replies/"+bno+"/"+replyPage);
					replyerObj.val("");
					replytextObj.val("");
				}
			}
		});
	});
	
	//modal창에 값 띄우기
	$(".timeline").on("click",".replyLi", function(event){
		var reply = $(this);
		
		$("#replytext").val(reply.find(".timeline-body").text());
		$(".modal-title").html(reply.attr("data-rno"));
	})
	
	//modify
	$("#replyModBtn").on("click",function(){
		
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
			
		$.ajax({
			type:'put',
			url:"/replies/" + rno,
			headers : {
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"PUT"},
			data:JSON.stringify({replytext:replytext}),
			dataType:'text',
			success:function(result){
				console.log("result: " + result);
				if(result=='SUCCESS'){
					alert("수정되었습니다.");
					getPage("/replies/"+bno+"/"+replyPage);
				}	
			}});
		});
		
	$("#replyDelBtn").on("click",function(){
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
			
		$.ajax({
			type:'delete',
			url:"/replies/" + rno,
			headers : {
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"DELETE"},
			dataType:'text',
			success:function(result){
				console.log("result: " + result);
				if(result=='SUCCESS'){
					alert("삭제성공");
					getPage("/replies/"+bno+"/"+replyPage);
				}								
			}});
		});	
	
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