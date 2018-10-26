<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Picture Rate</title>
        <link rel="stylesheet" href="./css/detail.css">
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
        
        <!--
        Bild Version 1
        -->
        
        <!-- Bild Infos -->
        <!-- Name, Bewertungssystem, geg. Favorit -->
        <div style="border: 2px black solid">
            <table>
                <tr>
                    <td colspan="5"><h1>I would be lost either way</h1></td>
                </tr>
                <tr class="tabelle1">
                    <td><a href="">Upvote 1</a></td>
                    <td><a href="">Upvote 2</a></td>
                    <td><a href="">Favorit</a></td>
                    <td><a href="">Downvote 2</a></td>
                    <td><a href="">Downvote 1</a></td>
                </tr>
            </table>
        </div>
        
        <div style="text-align: center">
            <img src="http://localhost:8080/picturerate/picture/1">
        </div>
        
        <hr noshade="noshade">
        
        <!-- Kommentarfunktion -->
        <div>
            <table>
                <tr>
                    <td align="left">Verfassen Sie hier Ihr eigenes Kommentar:</td>
                    <td><button>Post</button></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="text"></td>
                </tr>
            </table>
        </div>
        
        <hr noshade="noshade">
        
        
        <!-- Optische Trennlinie -->
        <hr noshade="noshade" style="size: 10; margin-top: 20px; margin-bottom: 20px">
        
        <!-- 
        Bild Version 2
        -->
        
        <!-- Bild mit Infos -->
        <div>
            <fieldset>
                <legend align="left">I would be lost either way</legend>
                <div class="legend2">
                    <button>Favorit</button>
                </div>
                <img src="http://localhost:8080/picturerate/picture/1">
                <table>
                    <tr class="tabelle2">
                        <td><button>Upvote 1</button></td>
                        <td><button>Upvote 2</button></td>
                        <td><button>Downvote 2</button></td>
                        <td><button>Downvote 1</button></td>
                    </tr>
                </table>
            </fieldset>
        </div>
        
        <hr noshade="noshade">
        
        <!-- Kommentarfunktion -->
        <div>
            <table>
                <tr>
                    <td align="left">Verfassen Sie hier Ihr eigenes Kommentar:</td>
                    <td><button>Post</button></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="text"></td>
                </tr>
            </table>
        </div>
        
        <hr noshade="noshade">
        
    </body>
</html>

