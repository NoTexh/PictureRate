<%@page import="java.sql.ResultSet"%>
<%@page import="de.dhbw.karlsruhe.picturerate.DetailSideCall"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Picture Rate</title>
        <link rel="stylesheet" href="./css/detail.css">
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" >
    </head>
    <body>
        <header>
            <a href="/picturerate"> <i class="fas fa-home"></i></a>
            <a href="/picturerate/uploadinput"><i class="fas fa-upload"></i></a>
            PictureRate
            <div class="suchleiste">
                <form action="image/*" method="GET">
                    <input class="suchleiste-input" type="text" placeholder="Bild suchen...">
                </form>
            </div>
        </header>
        
        
        <!-- imgid aus URL an Servlet übergeben & Servlet Klasse instanzieren für Methodenaufruf -->
        <%
          DetailSideCall dsc = new DetailSideCall();
          dsc.getimgid(request.getParameter("id"));
        %>
        
        <!--<form action="calldetailside" method="post">
            
            
            
             Bild Name aus Datenbank abfragen -->
            <h1>
                <%
                out.println(dsc.test());
                %>
            </h1>
            
            <!-- Bild Infos -->
            <div style="text-align: center">
                <img src="http://localhost:8080/picturerate/picture/<%=request.getParameter("id")%>" style="border: 5px black solid">
            </div>
            
            <!-- Bewertungsfunktionen -->
            <div>
                <table class="bewertungssystem">
                    <colgroup span="5" width="20%"></colgroup>
                    <tr>
                        <td><button><i class="fas fa-heart"></i></button></td>
                        <td><button>Upvote (Daumen Hoch/Klatschen)</button></td>
                        <td><button>Favorit (Stern)</button></td>
                        <td><button>Downvote (Daumen Runter)</button></td>
                        <td><button>TopDownvote (Kackhaufen)</button></td>
                    </tr>
                </table>
            </div>
            

            <hr noshade="noshade">

            <!-- Kommentarfunktion -->
            <div>
                <table class="kommentarschreiben">
                    <tr>
                        <td align="left">Verfassen Sie hier Ihren eigenen Kommentar:</td>
                        <td><button>Post</button></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="text"></td>
                    </tr>
                </table>
            </div>

            <hr noshade="noshade">
            
            <!-- Kommentare ausgeben -->
            <%
                /*dsc.getcomments();
                for (int i = 0; i< 5; i++) {
                    out.println("<h1>" + dsc.comments[0] + "</h1>");
                
                /*while(rs.next()) {
                    out.println("<h1>" + rs.getString(2) + "</h1>");
                    out.println("<h1>" + rs.getString(3) + "</h1>");
                }*/
            %>
            
            
            
         
    </body>
</html>