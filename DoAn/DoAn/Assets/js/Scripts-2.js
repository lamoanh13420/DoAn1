function ShowImagePreview(imageUploader, previewIamge) {
    if (imageUploader.files && imageUploader.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(previewIamge).attr('src', e.target.result);
        }
        reader.readAsDataURL(imageUploader.files[0]);
    }
}