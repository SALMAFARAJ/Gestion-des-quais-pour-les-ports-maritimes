
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="database.Utilconx" %>
<% if (request.getParameter("submitBtn")!=null){
	 try {
	        // Récupérer les données du formulaire depuis la requête
	        String idNavire = request.getParameter("idnavire");
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
    
	       
       
        String id_equipe = request.getParameter("id_equipe");
        String id_grue = request.getParameter("id_grue");
        
        String date=request.getParameter("date");
        Connection con = Utilconx.Seconnecter();
         PreparedStatement ptt = con.prepareStatement("INSERT INTO `affectation_eq` (`id_equipe`, `id_navire`, `date`) VALUES(?, ?, ?)");
         ptt.setString(2, idNavire);
         ptt.setString(1, id_equipe);
         ptt.setString(3, date);
         ptt.executeUpdate();

         PreparedStatement pt = con.prepareStatement("INSERT INTO `affectation_gr` (`id_gr`, `id_navire`, `date_gr`) VALUES (?, ?, ?)");
         pt.setString(2, idNavire);
         pt.setString(1, id_grue);
         pt.setString(3, date);
         pt.executeUpdate();
         pt.close();
         ptt.close();
         pst.close();
         conx.close();
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         con.close();
         response.sendRedirect("report.jsp");
     } catch (SQLException e) {
        
         e.printStackTrace();
         // Rediriger vers une page d'erreur pour afficher un message convivial à l'utilisateur
         response.sendRedirect("erreur.jsp");
     }
} %>


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
  <img src="https://www.fondationzakoura.org/assets/images/news/9dc94-marsa-maroc.png" alt="Your Logo" style="vertical-align: middle; height:70px; margin-right: 0px;">Affectation 
  </h1>
  <input type="text" name="idnavire"  placeholder="id_navire" id="idnavire">
  <input type="text" name="nom"  placeholder="Nom de Navire" id="nom">
  <select name="id_post"class="form-style">
                          <option value="">Sélectionnez un poste</option>
                          <% 
                            // Code Java pour récupérer les postes disponibles de la base de données
                            Connection conx = Utilconx.Seconnecter();
                            PreparedStatement st = conx.prepareStatement("SELECT id_post from post where id_post not in(SELECT id_post from affection )");
                            ResultSet rst = st.executeQuery();
                            while (rst.next()) {
                          %>
                            <option name="id_post" value="<%= rst.getString(1) %>"><%= rst.getString(1) %></option>
                          <% } %>
                        </select>
  
  <input type="text" name="shift" half  placeholder="Shift" id="shift">
  <input type="date" name="date" placeholder="date d'affectation" id="date">
 <select name="id_grue"class="form-style">
                          <option value="">Sélectionnez un grue</option>
                          <% 
                            // Code Java pour récupérer les postes disponibles de la base de données
                            Connection con = Utilconx.Seconnecter();
                            PreparedStatement pst = con.prepareStatement("SELECT id_gr from grue where id_gr not in(SELECT id_gr from affectation_gr )");
                            ResultSet rs = pst.executeQuery();
                            while (rs.next()) {
                          %>
                            <option name="id_grue" value="<%= rs.getString(1) %>"><%= rs.getString(1) %></option>
                          <% } %>
                        </select>
  <select name="id_equipe"class="form-style">
                          <option value="">Sélectionnez un equipe</option>
                          <% 
                            // Code Java pour récupérer les postes disponibles de la base de données
                            Connection cn = Utilconx.Seconnecter();
                            PreparedStatement pt = cn.prepareStatement("SELECT id_equipe from equipe where id_equipe not in(SELECT id_equipe from affectation_eq )");
                            ResultSet rt = pt.executeQuery();
                            while (rt.next()) {
                          %>
                            <option name="id_equipe" value="<%= rt.getString(1) %>"><%= rt.getString(1) %></option>
                          <% } %>
                        </select>
 
  <input type="submit" value="Send it" name ="submitBtn" id ="submit">
</form>
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