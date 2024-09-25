<%@page import="java.sql.*"%>
<%@page import="database.Utilconx" %>
<% if (request.getParameter("submitBtn")!=null){
	 try {
	        // Récupérer les données du formulaire depuis la requête
	        String idNavire = request.getParameter("idnavive");
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
         pst.close();
         conx.close();
         response.sendRedirect("report.jsp?idnavive=" + idNavire + "&id_post=" + idPost + "&shift=" + shift + "&date=" + dateAffectation);
     } catch (SQLException e) {
         // Gérer les erreurs pouvant survenir lors des opérations avec la base de données
         e.printStackTrace();
         // Rediriger vers une page d'erreur pour afficher un message convivial à l'utilisateur
         response.sendRedirect("erreur.jsp");
     }
} %>
<% if (request.getParameter("submit")!=null){
	 try {
	        // Récupérer les données du formulaire depuis la requête
        String idNavire = request.getParameter("idnavive");
        String id_equipe = request.getParameter("id_equipe");
        String id_grue = request.getParameter("id_grue");
        String date_gr = request.getParameter("date");
        String date=request.getParameter("date");
        Connection con = Utilconx.Seconnecter();
         PreparedStatement pst = con.prepareStatement("INSERT INTO `affectation_eq` (`id_equipe`, `id_navire`, `date`) VALUES(?, ?, ?)");
         pst.setString(2, idNavire);
         pst.setString(1, id_equipe);
         pst.setString(3, date);
         pst.executeUpdate();
        
         
       
         PreparedStatement pt = con.prepareStatement("INSERT INTO `affectation_gr` (`id_gr`, `id_navire`, `date_gr`) VALUES (?, ?, ?)");
         pt.setString(2, idNavire);
         pt.setString(1, id_grue);
         pt.setString(3, date);
         pt.executeUpdate();
         pt.close();
         con.close();
         response.sendRedirect("report.jsp?idnavive=" + idNavire + "&id_grue=" + id_grue + "&id_equipe=" + id_equipe + "&date=" + date_gr);
     } catch (SQLException e) {
        
         e.printStackTrace();
         // Rediriger vers une page d'erreur pour afficher un message convivial à l'utilisateur
         response.sendRedirect("erreur.jsp");
     }
} %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title> </title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
  <link rel='stylesheet' href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>
  <link rel="stylesheet" href="./style.css">
</head>
<body>
<a href="https://front.codes/" class="logo" target="_blank">
  <img src="https://telecomaroc.com/web/images/itl_demo/portfolio/portofolio_Marsa_Maroc.png" width="100px" alt="">
</a>


<div class="section">
  <div class="container">
    <div class="row full-height justify-content-center">
      <div class="col-12 text-center align-self-center py-5">
        <div class="section pb-5 pt-5 pt-sm-2 text-center">
          <h6 class="mb-0 pb-3"><span>Post </span><span>Grue</span></h6>
          <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
          <label for="reg-log"></label>
          <div class="card-3d-wrap mx-auto">
            <div class="card-3d-wrapper">
              <div class="card-front">
                <div class="center-wrap">
                  <div class="section text-center">

                    <h4 class="mb-4 pb-3">Affectation de post</h4>

                    <form method="POST" >
                      <div class="form-group">
                        <input type="text" name="idnavive" class="form-style" placeholder="Id_Navire" id="idnavire" autocomplete="off">
                        <i class="input-icon uil uil-at"></i>
                      </div>
                      <div class="form-group mt-2">
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
                        <i class="input-icon uil uil-lock-alt"></i>
                      </div>
                      <div class="form-group mt-2">
                        <input type="date" name="date" class="form-style" placeholder="date" id="logpass" autocomplete="off">
                        <i class="input-icon uil uil-lock-alt"></i>
                      </div>
                      <div class="form-group mt-2">
                        <input type="text" name="shift" class="form-style" placeholder="Shift" id="logpass" autocomplete="off">
                        <i class="input-icon uil uil-lock-alt"></i>
                      </div>
                      <input type="submit" class="btn mt-4" name="submitBtn" value="valider">
                      
                      
                    </form>

                  </div>
                </div>
              </div>
              <div class="card-back">
                <div class="center-wrap">
                  <div class="section text-center">
                    <h4 class="mb-4 pb-3">Sign Up</h4>

                    <form method="POST" >
                       <div class="form-group">
                        <input type="text" name="idnavive" class="form-style" placeholder="Id_Navire" id="idnavire" autocomplete="off">
                        <i class="input-icon uil uil-at"></i>
                      </div>
                       <div class="form-group mt-2">
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
                        <i class="input-icon uil uil-lock-alt"></i>
                      </div>
                       <div class="form-group mt-2">
                       
                        <i class="input-icon uil uil-lock-alt"></i>
                      </div>
                    
                      <div class="form-group mt-2">
                        <input type="date" name="date" class="form-style" placeholder="date" id="date" autocomplete="off">
                        <i class="input-icon uil uil-lock-alt"></i>
                      </div>
                      <input type="submit" class="btn mt-4" name="submit" value="valider">
                    </form>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script  src="./script.js"></script>

</body>
</html>
