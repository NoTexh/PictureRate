<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Picture Rate</title>
        <link rel="stylesheet" href="./css/styles.css">
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
        
        <div align="center">
            <h1>I would be lost either way</h1>
            <img src="http://localhost:8080/picturerate/picture/2" style="margin: 1em; border: 2px black solid; padding: 1em"/>
        </div>
        <div align="center">
            <fieldset style="margin: 1em; padding: 2em; width: 100px; ">
                <legend style="text-align: left">I would be lost either way</legend>
                <img src="http://localhost:8080/picturerate/picture/2"/>
            </fieldset>
        </div>
    </body>
</html>

