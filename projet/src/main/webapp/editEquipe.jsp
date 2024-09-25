<%@page import="java.sql.*"%>
<%@page import="database.Utilconx" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if (request.getParameter("submitBtn") != null) {

    
    try {

        String idNavire = request.getParameter("id_navire");
        String id_equipe = request.getParameter("id_equipe");
       
        String date = request.getParameter("date");
        Connection conx = Utilconx.Seconnecter();
        PreparedStatement pst = conx.prepareStatement("UPDATE affectation_eq SET id_equipe=?, date=? WHERE id_navire=?");
        pst.setString(1, id_equipe);
     
        pst.setString(2, date);
        pst.setString(3, idNavire);
        pst.executeUpdate();
       
        conx.close();
        response.sendRedirect("Equipe.jsp");
    }catch(Exception e){}}
%>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENSA KHOURIBGA</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/New.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Poppins:400,700&amp;display=swap'>
        <!--link rel="stylesheet" href="css/first.css"-->
    </head>
    
    <body style="background-image:url(images/body-bg.jpg);">
        
   


       
        
             <form  method="POST" action="#" >
  <div id="focus"></div>
  <h1 style ="text-align:center;">
  <img src="https://www.fondationzakoura.org/assets/images/news/9dc94-marsa-maroc.png" alt="Your Logo" style="vertical-align: middle; height:70px; margin-right: 0px;">Update Affectation 
  </h1>
  <%  
            String idNavire = request.getParameter("id_navire");
            if (idNavire != null) {
                Connection conx = Utilconx.Seconnecter();
                PreparedStatement pst = conx.prepareStatement("SELECT id_navire, id_equipe,  date FROM affectation_eq WHERE id_navire = ?");
                pst.setString(1, idNavire);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                	String id_post=rs.getString("id_equipe");
                    
                 
                    String date = rs.getString("date");
        %>
       
            <input type="hidden" name="id_navire" value="<%= idNavire %>">
            
              
                <input type="text" name="matricule" value="<%= idNavire %>" class="form-control" required readonly="readonly">
            
             
              <select name="id_equipe" class="form-control" id="id_equipe" required>
    <% 
    // Code Java to retrieve the available posts from the database
    Connection co = Utilconx.Seconnecter();
    PreparedStatement st = co.prepareStatement("SELECT id_equipe from equipe where id_equipe not in(SELECT id_equipe from affectation_eq )");
    ResultSet rst = st.executeQuery();

    boolean idPostFound = false; // Variable to check if the id_post exists in the database

    while (rst.next()) {
        String postId = rst.getString(1);
        %>
        <!-- Generate the options -->
        <option value="<%= postId %>" <%= (postId.equals(id_post)) ? "selected" : "" %>><%= postId %></option>
        <% 
        // Set the idPostFound to true if the id_post exists in the database
        if (postId.equals(id_post)) {
            idPostFound = true;
        }
    } %>
    <!-- If the id_post does not exist in the database, display it directly -->
    <% if (!idPostFound && id_post != null) { %>
        <option value="<%= id_post %>" selected><%= id_post %></option>
    <% } %>
</select>


         
               
                <input type="text" name="date" value="<%= date %>"placeholder="date_affectation" class="form-control" required>
                
  <input type="submit" value="Send it" name ="submitBtn" id ="submit">
</form>
  <% 
                } else {
                    out.println("Aucune donnée trouvée pour cet ID.");
                }
                rs.close();
            } else {
                out.println("ID non spécifié.");
            }
        %>

<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script><script  src="js/new.js"></script>
                 
 <style>@charset "UTF-8";* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}

body {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

form{
	display:inline;
  margin-top:5px;
  border: 2px solid #E53517;
  padding: 40px 10px 0px 40px;
  width: 70%;
  max-width: 700px;
  border-radius: 20px;
}

#focus {
  border: 3px solid #fef6fb;
  box-shadow: 0 0 10px 0 #E53517;
  position: absolute;
  transition: width 0.2s ease, height 0.2s ease, left 0.2s ease, top 0.2s ease, border-radius 0.2s ease;
  pointer-events: none;
  z-index: 5;
  border-radius: 10px;
  display: none;
}

h1 {
  margin-bottom: 30px;
  font-size: 2em;
  color: #000;
}

input {
  padding: 10px 15px;
  border-radius: 10px;
  transition: 0.3s ease;
  color: #868283;
}
input[type=text] {
  width: calc(100% - 30px);
  margin-bottom: 30px;
  border: 2px solid #868283;
}
input[type=date] {
  width: calc(100% - 30px);
  margin-bottom: 30px;
  border: 2px solid #868283;
}
input[type=password] {
  width: calc(100% - 30px);
  margin-bottom: 30px;
  border: 2px solid #868283;
}
input[type=email] {
  width: calc(100% - 30px);
  margin-bottom: 30px;
  border: 2px solid #868283;
}

input[type=text]:placeholder-shown {
  border: 2px solid #EAE4DA;
}
input[type=email]:placeholder-shown {
  border: 2px solid #EAE4DA;
}
input[type=date]:placeholder-shown {
  border: 2px solid #EAE4DA;
}
input[type=password]:placeholder-shown {
  border: 2px solid #EAE4DA;
}
input[type=text]::placeholder {
  color: #A3A5AA;
}
input[type=password]::placeholder {
  color: #A3A5AA;
}
input[type=date]::placeholder {
  color: #A3A5AA;
}
input[type=email]::placeholder {
  color: #A3A5AA;
}
input[type=text][half] {
  width: calc(50% - 30px);
  float: left;
  margin-right: 30px;
}
input[type=email][half] {
  width: calc(50% - 30px);
  float: left;
  margin-right: 30px;
}
input[type=password][half] {
  width: calc(50% - 30px);
  float: left;
  margin-right: 30px;
}
input[type=submit] {
  background:#E53517;
  color: #EAE4DA;
  border: 2px solid #E53517;
  outline: 10px solid #fff;
  width: calc(50% - 30px);
  height: 40px;
  margin: 0 30px -20px 0;
  float: right;
  font-weight: 800;
  font-size: 0.7em;
  letter-spacing: 1.8pt;
  text-transform: uppercase;
  cursor: pointer;
}
input[type=submit]:hover {
  outline-width: 0;
}
input:focus {
  outline: 0;
}
/* Add this CSS rule to style the select tag */
select {
  padding: 10px 15px;
  border-radius: 10px;
  transition: 0.3s ease;
  color: #868283;
  width: calc(100% - 30px);
  margin-bottom: 30px;
  border: 2px solid #868283;
}

select::placeholder {
  color: #A3A5AA;
}

select:placeholder-shown {
  border: 2px solid #EAE4DA;
}

/* Additional styling for the focused state of the select tag */
select:focus {
  border: 3px solid #fef6fb;
  box-shadow: 0 0 10px 0 #E53517;
  border-radius: 10px;
  outline: 0;
}


 </style>
        
 
    </body>
</html>
