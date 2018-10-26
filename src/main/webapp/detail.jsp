<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Picture Rate</title>
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="./css/detail.css">
    </head>
    
    <body>
        <header>
            <a href="/picturerate"><img src="./res/101_0.jpg" alt="home"/> </a>
            <a href="/picturerate/uploadinput"><img src="./res/arrow.png" alt="upload"/> </a>
            Welcome to PictureRate
            <div class="suchleiste">
                <form action="image/*" method="GET">
                    <input class="suchleiste-input" type="text" placeholder="Bild suchen...">
                </form>
            </div>
        </header>
        
        <!--
        Bild Version 1
        -->
        
        <!-- Bild Infos -->
        <!-- Name, Bewertungssystem, geg. Favorit -->        
        <h1>I would be lost either way</h1>
        <div style="text-align: center; background-color: black">
            <img src="http://localhost:8080/picturerate/picture/2">
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
        
        
    </body>
</html>

