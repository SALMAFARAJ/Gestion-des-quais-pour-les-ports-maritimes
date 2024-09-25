<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Form Data Report</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
  <!-- Add any other CSS styling you want for the report -->
</head>
<body>
  <div class="container mt-4">
    <h1 class="text-center">Form Data Report</h1>
    <div class="row mt-4">
      <div class="col-md-6">
        <h2>Post Grue Form Data:</h2>
        <p><strong>Id Navire:</strong> <%= request.getParameter("idnavive") %></p>
        <p><strong>Id Post:</strong> <%= request.getParameter("id_post") %></p>
        <p><strong>Shift:</strong> <%= request.getParameter("shift") %></p>
        <p><strong>Date Affectation:</strong> <%= request.getParameter("date") %></p>
      </div>
      <div class="col-md-6">
        <h2>Sign Up Form Data:</h2>
        <p><strong>Id Navire:</strong> <%= request.getParameter("idnavive") %></p>
        <p><strong>Id Grue:</strong> <%= request.getParameter("id_grue") %></p>
        <p><strong>Id Equipe:</strong> <%= request.getParameter("id_equipe") %></p>
        <p><strong>Date:</strong> <%= request.getParameter("date") %></p>
      </div>
    </div>
    <div class="text-center mt-4">
      <button class="btn btn-primary" onclick="window.print()">Print Report</button>
      <a href="NewFile.jsp" class="btn btn-secondary ml-3">Return to Form</a>
    </div>
  </div>
</body>
</html>
