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
        
        <form action="calldetailside" method="post">
            
            <!-- Bild Infos -->
            <!-- Name, Bewertungssystem, geg. Favorit-->
            <h1><%=request.getParameter("name")%></h1>
            <div style="text-align: center">
                <img src="http://localhost:8080/picturerate/picture/<%=request.getParameter("id")%>" style="border: 5px black solid">
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
            
        </form>
    </body>
</html>