<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PictureRate - Upload</title>
        <link rel="stylesheet" href="./css/upload.css">
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" >
        <script src="FileUpload.js"></script>
        <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    </head>

    <body>
        <header>
            <a href="/picturerate"> <i class="fas fa-home"></i></a>
            <a href="/picturerate/uploadinput"><i class="fas fa-upload"></i></a>
            Welcome to PictureRate
            <div class="suchleiste">
                <form action="PicturesFromDB" method="GET">
                    <input class="suchleiste-input" type="text" name="suche" placeholder="Bild suchen...">
                </form>
            </div>
        </header>

        <main>
            <form action="uploaddata" method="post" enctype="multipart/form-data">
                <div class="file-upload">
                    <input class="file-upload-text" type="text" name="name" placeholder="Picturename...">
                    <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger('click')">Add Image</button>

                    <div class="image-upload-wrap">
                        <input class="file-upload-input" type='file' name="image" onchange="readURL(this);" accept="image/*" />
                        <div class="drag-text">
                            <h3>Drag and drop a file or select add Image</h3>
                        </div>
                    </div>

                    <div class="file-upload-content">
                        <img class="file-upload-image" src="#" alt="your image" />
                        <div class="image-title-wrap">
                            <button type="button" onclick="removeUpload()" class="remove-image">Remove <span class="image-title">Uploaded Image</span></button>
                        </div>
                    </div>

                    <table style="width: 100%; margin-top: 20px; border-spacing: 5px ">
                        <tr>
                            <td style="width: 50%;"><input class="file-upload-submit" type="submit" value="Upload"></td>
                            <td style="width: 50%;"><input class="file-upload-submit" type="reset" value="Reset"></td>
                        </tr>

                        <%
                            String message = (String) request.getAttribute("message");
                            if (message == "NoPictureFormat") {
                                out.println("<tr><td colspan=\"2\"><div class=\"alert alert-danger\" role=\"alert\">No Picture Input!</div></td></tr>");
                            }else if (message == "ErrorBoth") {
                                out.println("<tr><td colspan=\"2\"><div class=\"alert alert-danger\" role=\"alert\">Picturename and Picture are missing</div></td></tr>");
                            } else if (message == "ErrorName") {
                                out.println("<tr><td colspan=\"2\"><div class=\"alert alert-danger\" role=\"alert\">Picturename is missing</div></td></tr>");
                            } else if (message == "ErrorPicture") {
                                out.println("<tr><td colspan=\"2\"><div class=\"alert alert-danger\" role=\"alert\">Picture is missing</div></td></tr>");
                            } else if (message == "Sucess") {
                                out.println("<tr><td colspan=\"2\"><div class=\"alert alert-success\" role=\"alert\">Sucessfully uploaded</div></td></tr>");
                            }
                        %>
                    </table>
                </div>
            </form>
        </main>
    </body>
</html>
