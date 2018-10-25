
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Picture Upload</title>
        <link rel="stylesheet" href="./css/upload.css">
        <link rel="stylesheet" href="./css/styles.css">
        <script src="FileUpload.js"></script>
        <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    </head>

    <body>
        <header>
            <a href="${pageContext.request.contextPath}"><img src="./res/101_0.jpg" alt="home"/> </a>
            <a href="${pageContext.request.contextPath}\upload.jsp"><img src="./res/arrow.png" alt="upload"/> </a>
            Welcome to PictureRate
        </header>

        <form action="uploaddata" method="post" enctype="multipart/form-data">

            <div class="file-upload">
                <input class="file-upload-text" type="text" name="name">
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

                <table style="width: 100%; margin-top: 20px ">
                    <tr>
                        <td style="width: 50%;"><input class="file-upload-submit" type="submit" value="Upload"></td>
                        <td style="width: 50%;"><input class="file-upload-submit" type="reset" value="Reset"></td>
                    </tr>
                </table>

            </div>
        </form>
    </body>
</html>
