<%@page import="java.sql.*"%>
<%@page import="database.Utilconx" %>
<%if (request.getParameter("submit")!=null){
	 try {
	        // Récupérer les données du formulaire depuis la requête
	        String idNavire = request.getParameter("id_navire");
	        String idPost = request.getParameter("id_post");
	        String shift = request.getParameter("shift");
	        String dateAffectation = request.getParameter("date");
      Connection conx = Utilconx.Seconnecter();
      PreparedStatement pst = conx.prepareStatement("INSERT INTO affection (`id_navire`, `id_post`, `shift`, `date_affectation`) VALUES (?, ?, ?, ?)");
      pst.setString(1, idNavire);
      pst.setString(2, idPost);
      pst.setString(3, shift);
      pst.setString(4, dateAffectation);
      pst.executeUpdate();
      
     System.out.println(idNavire);
     }catch(Exception e){
    	 
     }}
	 
	 %>
                <%  
                            Connection conx = Utilconx.Seconnecter();
                            ResultSet rs = conx.createStatement().executeQuery("SELECT id_navire, id_post,shift,date_affectation FROM `affection`;");
                        %>
                        
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
	    <!----css3---->
        <link rel="stylesheet" href="css/custom.css">
		
		
		<!--google fonts -->
	
	    <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
	
	
	<!--google material icon-->
      <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">
      
</head>
<body>
<div class="wrapper">


        <div class="body-overlay"></div>
		
		<!-------------------------sidebar------------>
		     <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3><img src="img/logo.png" class="img-fluid"/><span>Marsa Maroc</span></h3>
            </div>
            <ul class="list-unstyled components">
			<li  class="active">
                    <a href="index.jsp" class="dashboard"><i class="material-icons">dashboard</i>
					<span>Dashboard</span></a>
                </li>
		

                <li class="dropdown">
                    <a href="/hhhh/Grue.jsp" class="dropdown-toggle">

					<i class="material-icons">aspect_ratio</i>Grue</a>
                   
                <li class="dropdown">
                   <a href="/hhhh/Equipe.jsp" class="dropdown-toggle">

					<i class="material-icons">apps</i><span>Equipe</span></a>
              
				  <li class="dropdown">
                   <a href="/hhhh/formulaire_affectation.jsp" class="dropdown-toggle">

					<i class="material-icons">extension</i><span>Affectation</span></a>
              
                </li> 
                
        </nav>
		
		<!--------page-content---------------->
		
		<div id="content">
		   
		   <!--top--navbar----design--------->
		   
		   <div class="top-navbar">
		      <div class="xp-topbar">

                <!-- Start XP Row -->
                <div class="row"> 
                    <!-- Start XP Col -->
                    <div class="col-2 col-md-1 col-lg-1 order-2 order-md-1 align-self-center">
                        <div class="xp-menubar">
                               <span class="material-icons text-white">signal_cellular_alt
							   </span>
                         </div>
                    </div> 
                    <!-- End XP Col -->


<!-- End XP Col -->

<!-- Start XP Col -->
<div style="padding-left: 10%;" class="col-10 col-md-6 col-lg-8 order-1 order-md-3">
    <div class="xp-profilebar text-right">
        <nav class="navbar p-0">
            <ul class="nav navbar-nav flex-row ml-auto">
                <!-- Move the Logout list item here -->
                <li>
                    <a href="LOGIN.jsp">
                        <span class="material-icons">logout</span>
                        Logout
                    </a>
                </li>
                <!-- If there are other menu items, you can keep them here -->
            </ul>
        </nav>
    </div>
</div>
                    <!-- End XP Col -->

                </div> 
                <!-- End XP Row -->

            </div>
		     <div class="xp-breadcrumbbar text-center">
                <h4 class="page-title">Vos opérations entre les mains d'un exprert</h4>  
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Qualité</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Confiance</li>
                  </ol>                
            </div>
			
		   </div>
		   
		   
		   
		   <!--------main-content------------->
		   
		   <div class="main-content">
			  <div class="row">
			    
				<div class="col-md-12">
				<div class="table-wrapper">
    <div class="table-title">
      <div class="row">
        <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
          <h2 class="ml-lg-2">Manage 
ship</h2>
        </div>
        <div class="col-sm-6 p-0 d-flex justify-content-lg-end justify-content-center">
          <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
		  <i class="material-icons">&#xE147;</i> <span>Add New 
ship</span></a>
          <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal">
		  <i class="material-icons">&#xE15C;</i> <span>Delete</span></a>
        </div>
      </div>
    </div>
     <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="selectAll">
                                            <label for="selectAll"></label>
                                        </span>
                                    </th>
                                    <th>id_Navire</th>
                                    <th>Post</th>
                                    <th>Shift</th>
                                    <th>date_affectation</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <% while (rs.next()) { %>
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="option[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td><%= rs.getString("id_navire") %></td>
                                    <td><%= rs.getString("id_post") %></td>
                                    <td><%= rs.getString("shift") %></td>
                                    <td><%= rs.getString("date_affectation") %></td>
                                <td>
  <a href="edit.jsp?id_navire=<%= rs.getString("id_navire") %>&?id=<%= rs.getString("id_post") %>">
                <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
            </a>
     <a href="delet.jsp?id=<%= rs.getString("id_navire") %>" class="delet" onclick="return confirm('Are you sure you want to delete this ship?')">
    <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
</a>
</td>



                                </tr>
                                <% } %>
                            </tbody>
                        </table>
 
    <div class="clearfix">
		 
    		 
    
  </div>
</div>
<!-- Edit Modal HTML -->


   <!-- Add Modal HTML -->
    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Ship</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
               <form method="POST" >
    <div class="modal-body">
        <div class="form-group">
            <label>matricule</label>
            <input name="id_navire" type="text" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="id_post">Sélectionnez un poste</label>
            <select name="id_post" class="form-control" id="id_post" required>
                <option value="">Poste</option>
                <% 
                // Code Java pour récupérer les postes disponibles de la base de données
                Connection co = Utilconx.Seconnecter();
                PreparedStatement st = co.prepareStatement("SELECT id_post from post where id_post not in(SELECT id_post from affection )");
                ResultSet rst = st.executeQuery();
                while (rst.next()) {
                %>
                <option value="<%= rst.getString(1) %>"><%= rst.getString(1) %></option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <label>Shift</label>
            <input name="shift" type="text" class="form-control" required>
        </div>
        <div class="form-group">
            <label>date</label>
            <input name="date" type="date" class="form-control" required>
        </div>
    </div>
    <div class="modal-footer">
        <input type="reset" class="btn btn-secondary" data-dismiss="modal" value="cancel">
        <input type="submit" class="btn btn-success" name="submit" value="valider">
    </div>
</form>

            </div>
        </div>
    </div>
<!-- Edit Modal HTML -->




<!-- Delete Modal HTML -->

  
     <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="js/jquery-3.3.1.slim.min.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/jquery-3.3.1.min.js"></script>
  
  
  <script type="text/javascript">
        
		$(document).ready(function(){
		  $(".xp-menubar").on('click',function(){
		    $('#sidebar').toggleClass('active');
			$('#content').toggleClass('active');
		  });
		  
		   $(".xp-menubar,.body-overlay").on('click',function(){
		     $('#sidebar,.body-overlay').toggleClass('show-nav');
		   });
		  
		});
		
</script>
  


</body>
</html>