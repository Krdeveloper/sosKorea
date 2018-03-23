<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<meta name="description" content="">
  	<meta name="author" content="">
    <title>sosKorea</title>
    <!-- Bootstrap core CSS-->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css3/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css3/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css3/sb-admin.css" rel="stylesheet">
    
  </head>
  
  <body class="bg-dark">
  
  <script type="text/javascript">
  	function confirmCheck(){
  		if(fr.userid.value==""){
  			alert("The Id is empty");
  			fr.userid.focus();
  			return false;
  		}
  		else if(fr.email.value==""){
  			alert("The email is empty");
  			fr.email.focus();
  			return false;
  		}
  		else if(fr.userpw.value==""){
  			alert("The Password is empty");
  			fr.userpw.focus();
  			return false;
  		}
  		else if(fr.userpw2.value==""){
  			alert("The Password is empty");
  			fr.userpw.focus();
  			return false;
  		}
  		else if(fr.userpw.value!=fr.userpw2.value){
  			alert("Check the confirm");
  			fr.userpw2.focus();
  			return false;
  		}
  		
  		else return true;
  	}
  </script>
  
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Register an Account</div>
      <div class="card-body">
        <form name="fr" role="form" method="post" onsubmit="return confirmCheck()">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">ID</label>
                <input name="userid" class="form-control" id="exampleInputName" type="text" aria-describedby="nameHelp" placeholder="Enter first name">
              </div>
              
            </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input name="email" class="form-control" id="exampleInputEmail1" type="email" aria-describedby="emailHelp" placeholder="Enter email">
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">Password</label>
                <input name="userpw" class="form-control" id="exampleInputPassword1" type="password" placeholder="Password">
              </div>
              <div class="col-md-6">
                <label for="exampleConfirmPassword">Confirm password</label>
                <input name="userpw2" class="form-control" id="exampleConfirmPassword" type="password" placeholder="Confirm password">
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <label for="exampleInputEmail1">SecretCode(IfUKnow)</label>
            <input  class="form-control" id="exampleInputPassword1" type="password" placeholder="If u know SecretCode">
          </div>
          
          <button type="submit" class="btn btn-primary btn-block">Register</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="login.html">Login Page</a>
          <!-- <a class="d-block small" href="forgot-password.html">Forgot Password?</a> -->
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>