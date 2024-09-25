<%@page import="java.sql.*"%>
<%@page import="database.Utilconx" %>
<% if(request.getParameter("submit")!=null){
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver") ;
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marsa","root","") ;
		String email=request.getParameter("email");
		String password =request.getParameter("password");
		PreparedStatement ps = con.prepareStatement("SELECT * From admin where email_ad =? and pwd_ad=?") ;
		ps.setString(1,email) ;
		ps.setString(2,password) ;
		ResultSet rs = ps.executeQuery() ; 
		if(rs.next()) {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}else {
			
		}
			
		
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<title>login</title>
<style type="text/css">
  

  .custom-button {
    background-color: #E53517; /* Set the desired background color */
    text-decoration: none;
    display: flex;
    width: max-content;
    align-items: center;
    
    border-color:#FFFFFF;
    bottom: 200px;
    left: 0;
    background-color: #E53517;
    font-family: "Montserrat Bold",sans-serif;
    font-size: 18px;
    font-weight: bold;
    color: #FFFFFF;
    padding: 10px 32px 10px 20px;
  }
   .custom-button:hover {
    background-color: #E53517; /* Set the desired background color */
    text-decoration: none;
    display: flex;
    width: max-content;
    align-items: center;
    
    border-color:#E53517;
    bottom: 200px;
    left: 0;
    background-color: #FFFFFF;
    font-family: "Montserrat Bold",sans-serif;
    font-size: 18px;
    font-weight: bold;
    color: #E53517;
    padding: 10px 32px 10px 20px;
  }
</style>
</head>
<body>
	
	
    <section class="vh-100" style="background-color:#353b48;">
        <div class="container h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
           <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
               
                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4"><img alt="" width="80px" src="img/Marsa.png"> Login</p>
                <fieldset>
                <form method ='POST' class="mx-1 mx-md-4">
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <label class="form-label" for="form3Example3c">Email</label>
                      <input type="email" id="form3Example3c" class="form-control"name="email" />
                       </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                        <label class="form-label" for="form3Example4c">Password</label>
                      <input type="password" id="form3Example4c" class="form-control" name="password"/>
                      
                    </div>
                  </div>
                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                   <input type="submit" class="btn btn-primary btn-lg custom-button" name="submit" value="se connecter">

                  </div>
                     
                </form>
               </fieldset>
              </div>
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                <img style=" display: flex;
      justify-content: center;" src="img/ss.jpg"
                  class="img-fluid" width="65%" height="auto"  >

              </div>
            </div>
          </div>
        </div>
         </div>
    </div>
  </div>
         	
     
 </section>

</body>
</html>