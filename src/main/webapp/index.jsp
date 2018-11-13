<%@page import="java.sql.ResultSet"%>
<%@page import="de.dhbw.karlsruhe.picturerate.PicturesFromDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Picture Rate</title>
        <link rel="icon" href="./res/PR-Logo.png">
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="./css/index.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" >
    </head>
    <body>
        <header>

            <a href="/picturerate"> <i class="fas fa-home"></i></a>
            <a href="/picturerate/uploadinput"><i class="fas fa-upload"></i></a>
            Welcome to PictureRate
            <div class="suchleiste">
                <form action="PicturesFromDB" method="GET">
                    <input class="suchleiste-input" type="text" name="suche" placeholder="Bild suchen..."
                           value="<%
                               String errorMessage = (String) request.getAttribute("error");
                               if (errorMessage == "noMatch") {
                                   out.println("Kein Treffer!");
                               }
                           %>"
                           style="<%
                               errorMessage = (String) request.getAttribute("error");
                               if (errorMessage == "noMatch") {
                                   out.println("color:red;");
                               }
                           %>"
                           >
                </form>
            </div>

        </header>
        <main>
            <%
                PicturesFromDB pics = new PicturesFromDB();
                int anzBilder = pics.getAnzBilder();
                for (int i = 0; i < anzBilder; i++) {
                    out.write("<fieldset>");
                    out.write("<legend align='left'>" + pics.bilderListe[i][1] + "</legend>");
                    out.write("<a href='/picturerate/detailaufruf?id=" + pics.bilderListe[i][0] + "'> <img src='http://localhost:8080/picturerate/picture/" + pics.bilderListe[i][0] + "' class='bilder' alt='pic'> </a>");
                    out.write("</fieldset>");
                }
            %>
        </main>
    </body>
</html>
