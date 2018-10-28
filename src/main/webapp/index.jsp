<%@page import="java.sql.ResultSet"%>
<%@page import="de.dhbw.karlsruhe.picturerate.DetailSideCall"%>
<%@page import="de.dhbw.karlsruhe.picturerate.PicturesFromDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Picture Rate</title>
        <link rel="stylesheet" href="./css/styles.css">
        
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" >
    </head>
    <body>
        <header>
            
            <a href="/picturerate"> <i class="fas fa-home"></i></a>
            <a href="/picturerate/uploadinput"><i class="fas fa-upload"></i></a>
            Welcome to PictureRate
            <div class="suchleiste">
                <form action="image/*" method="GET">
                    <input class="suchleiste-input" type="text" placeholder="Bild suchen...">
                </form>
            </div>
        </header>
        <main>
            <%
            PicturesFromDB pics = new PicturesFromDB();
            int anzBilder = pics.getAnzBilder();
            for(int i = 0; i<anzBilder; i++){
                int id = i+1;
                out.write("<fieldset>");
                out.write("<legend align='left'>title</legend>");
                out.write("<a href='/picturerate/detailaufruf?id="+id+"'> <img src='http://localhost:8080/picturerate/picture/"+id+"' class='bilder' alt='pic'> </a>");
                out.write("</fieldset>");
            }
            %>
        </main>
    </body>
</html>
