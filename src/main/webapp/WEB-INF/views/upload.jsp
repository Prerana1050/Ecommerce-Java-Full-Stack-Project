<!DOCTYPE html>
<html>
<head>
<title>Upload File</title>
</head>
<body>
    <h2>Upload Image/Video</h2>
    <form action="uploadFile" method="post" enctype="multipart/form-data">
        <input type="file" name="file" accept="image/*,video/*"/>
        <button type="submit">Upload</button>
    </form>
    
    <a href="files">View Uploaded Files</a>
</body>
</html>
