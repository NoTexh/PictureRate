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
                <form action="PicturesFromDB" method="GET">
                    <input class="suchleiste-input" type="text" name="suche" placeholder="Bild suchen...">
                </form>
            </div>
        </header>
        
        <main>
        
            <!-- imgid aus URL an Servlet übergeben & Servlet Klasse instanzieren für Methodenaufruf -->
            <%
              DetailSideCall dsc = new DetailSideCall();
              dsc.getimgid(request.getParameter("id"));
            %>

            <!-- Bild Name aus Datenbank abfragen -->
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
                        <td><button class="btn_bewerten"><i class="fas fa-heart"></i></button></td>
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
                <form action="calldetail" method="GET" enctype="multipart/form-data">
                    <table class="kommentarschreiben">
                        <tr>
                            <td align="left" style="font-size: 19px">Verfassen Sie hier Ihren eigenen Kommentar:</td>
                            <td><input class="btn_post" type="submit" value="Post"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="text" id="comment" name ="comment" class="txt_eingabe" placeholder="Kommentar einfügen"></td>
                        </tr>
                    </table>
                    <input type="hidden" name="id" value="<%out.println(request.getParameter("id"));%>">
                    <input type="hidden" name="comid" value="<% int laenge = dsc.getcomments(); out.println(laenge+1);%>">
                </form>
            </div>

            <hr noshade="noshade">

            <!-- Kommentare ausgeben -->
            <div>
                <table width="100%" border="2px black">
                    <caption>Kommentare</caption>
                    <%
                        for (int i = 0; i < laenge; i++) {
                            out.println("<tr>");
                            out.println("<td align=\"center\" style=\"width: 30%\">" + dsc.comments [i] [0] + "</td>");
                            out.println("<td align=\"left\" style=\"padding: 5px\">" + dsc.comments [i] [1] + "</td>");
                            out.println("</tr>");
                        }
                    %>
                </table>
            </div>
        </main>
    </body>
</html>