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
                <form action="ratingbyid" method="GET" enctype="multipart/form-data">
                    <table class="bewertungssystem">
                        <colgroup span="5" width="20%"></colgroup>
                        <tr>
                            <td align="center"><button class="btn_bewerten" name="btn" type="submit" value="rateheart"><i class="fas fa-heart" ></i></button></td>
                            <td align="center"><button class="btn_bewerten" name="btn" type="submit" value="ratethumbup"><i class="fas fa-thumbs-up"></i></button></td>
                            <td align="center"><button class="btn_bewerten" name="btn" type="submit" value="star"><i class="fas fa-star"></i></button></td>
                            <td align="center"><button class="btn_bewerten" name="btn" type="submit" value="ratethumbdown"><i class="fas fa-thumbs-down"></i></button></td>
                            <td align="center"><button class="btn_bewerten" name="btn" type="submit" value="ratepoop"><i class="fas fa-poo"></i></button></td>
                        </tr>
                            <%
                                dsc.getRating();
                                String heart = dsc.rating[0];
                                String thumbup = dsc.rating[1];
                                String thumbdown = dsc.rating[2];
                                String poop = dsc.rating[3];
                                out.println("<tr>");
                                out.println("<td align=\"center\" class=\"bewertunganzeigen\">" + heart + "</td>");
                                out.println("<td align=\"center\" class=\"bewertunganzeigen\">" + thumbup + "</td>");
                                out.println("<td></td>");
                                out.println("<td align=\"center\" class=\"bewertunganzeigen\">" + thumbdown + "</td>");
                                out.println("<td align=\"center\" class=\"bewertunganzeigen\">" + poop + "</td>");
                                out.println("</tr>");
                            %>
                    </table>
                    <input type="hidden" name="id" value="<%out.println(request.getParameter("id"));%>">
                    <input type="hidden" name="heart" value="<%out.println(heart);%>">
                    <input type="hidden" name="thumbup" value="<%out.println(thumbup);%>">
                    <input type="hidden" name="thumbdown" value="<%out.println(thumbdown);%>">
                    <input type="hidden" name="poop" value="<%out.println(poop);%>">
                </form>
            </div>


            <hr noshade="noshade">

            <!-- Kommentarfunktion -->
            <div>
                <form action="calldetail" method="GET" enctype="multipart/form-data">
                    <table class="kommentarschreiben">
                        <tr>
                            <td align="left" style="font-size: 19px">Verfassen Sie hier Ihren eigenen Kommentar:</td>
                            <td style="width: 290px; padding: 2px">
                                <%
                                    String errormsg = (String) request.getParameter("input");
                                    if (errormsg != null) {
                                        out.println("<p style=\"color: #721c24; font-size: 15px; border-radius: 5%;border: 2px solid black; background-color: #f8d7da;\">Bitte geben Sie zuerst einen Kommentar ein</p>");
                                    };
                                %>  
                            </td>
                            <td><input class="btn_post" type="submit" value="Post"></td>
                        </tr>
                        <tr>
                            <td colspan="3"><input type="text" id="comment" name="comment" class="txt_eingabe" placeholder="Kommentar einfügen"></td>    
                        </tr>
                    </table>
                    <input type="hidden" name="id" value="<%out.println(request.getParameter("id"));%>">
                    <input type="hidden" name="comid" value="<% int laenge = dsc.getcomments(); out.println(laenge + 1);%>">
                </form>
            </div>

            <hr noshade="noshade">

            <!-- Kommentare ausgeben -->
            <div>
                <table style="width: 100%; border: 1px solid" cellspacing="0">
                    <caption>Kommentare</caption>
                    <%
                        int test = laenge - 1;
                        for (int i = 0; i < laenge; i++) {
                            out.println("<tr style=\"margin: 50px\">");
                            out.println("<td align=\"center\" rowspan=\"2\" style=\"width: 20%; padding: 5px; border: 0.5px solid\">" + dsc.comments[test - i][0] + "</td>");
                            out.println("<td align=\"left\" style=\"padding: 5px; text-decoration: underline; border: 0.5px solid; border-bottom: 0\">" + dsc.comments[test - i][2] + "</td>");
                            out.println("</tr>");
                            out.println("<tr>");
                            out.println("<td align=\"left\" style=\"padding: 5px; border: 0.5px solid; border-top: 0\">" + dsc.comments[test - i][1] + "</td>");
                            out.println("</tr>");
                        }
                    %>
                </table>
            </div>
        </main>
    </body>
</html>