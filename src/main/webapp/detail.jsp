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
            <a href="index.jsp"><img src="./res/101_0.jpg" alt="home"/> </a>
            <a href=""><img src="./res/arrow.png" alt="upload"/> </a>
            Welcome to PictureRate
            <!--<nav>
                <form action="image/*" method="GET">
                    <input type="text" name="name" placeholder="Search..">
                    <input type ="submit" value="Search">
                </form> 
            </nav> -->
            <div class="flexsearch">
                <div class="search-wrapper">
                    <form action="image/*" method="GET">
                        <div class="search-input-warpper">
                            <input class="search-input" type="text" placeholder="Bild suchen...">
                        </div>
                       <!-- <input class="search-submit" type="submit" placeholder="&#10140;"/> -->
                    </form>
                </div>
            </div>
        </header>
        
        <div align="center">
            <h1>I would be lost either way</h1>
            <img src="./res/Ikea.jpg" style="margin: 1em; border: 2px black solid; padding: 1em"/>
        </div>
        
    </body>
</html>

