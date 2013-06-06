$(document).ready(function() {

    // 'older' link click handler
    $('body').on('click', '.older', function () {
        $('.panel').show();
        $(this).hide();

        adjustSize();
    });

    adjustSize();

    // enumerates all the files on the second line after 'BROWSE' button clicked
    $('body').on('change', "input[type='file']", function () {

        var label = "File(s): ";
        for (var i = 0; i < $(this)[0].files.length; i++) {
            label += $(this)[0].files[i].name + ';';
        }
        $('.uploaderSecond').text($(this)[0].files.length + ' file(s) for upload');
    });


    // Expanders / collapsers for history panels
    $('body').on('click', '.panel', function (e) {

        var span = $(this).find('span');

        if ($(span).hasClass('expand')) {

            $(span).removeClass('expand');
            $(span).addClass('collapse');
            $(this).next().show();
        }
        else if ($(span).hasClass('collapse')) {

            $(span).removeClass('collapse');
            $(span).addClass('expand');
            $(this).next().hide();
        }

        e.preventDefault();
    });

    // Change company for all records within one UploadFile
    $('body').on('change', '.children select', function () {

        var selectBox = $(this);
        var data = { "uploadFileId": $(selectBox).parent().data('id'), "companyId": $(selectBox).val() };

        $.post(ControllerActions.Upload.UploadChangeCompany, data, function (result) {
            if (result) {
                // TODO: display nice checkbox right hand side from selectBox
            }
            else {
                $(selectBox).val($(selectBox).data('old'));
            }
        });
    });

    // Delete records within one UploadFile
    $('body').on('click', '.children .removeFile', function () {

        var row = $(this).parent();
        var data = { "uploadFileId": $(row).data('id')};

        $.post(ControllerActions.Upload.UploadFileDelete, data, function (result) {
            if (result) {

                var parent = $(row).parent();
                var grandParent = $(parent).parent();
                
                $(row).remove();

                // in no more rows left - delete upload itself
                if ($(parent).children().length == 0) {
                    $(parent).prev().remove();
                    $(parent).remove();

                    if ($(grandParent).children('.panel').length == 0) {
                        refreshHistoryPanel();
                    }
                }
            } else {
                alert(StaticData.Errors.DeletingUploadFault);
            }
        });
    });

    // Make main drop down nice
    $('.header select').selectmenu();
    
    // Disable upload button if we do not have any company set up so far
    if ($('#company').val() == null) {
        $('.uploadButton').attr("disabled", "disabled");
    } else {
        $('.uploadButton').removeAttr("disabled"); 
    }
});


// Initializes drag'n'drop uploader
$(function () {
    var fileTemplate = "<div id=\"{{id}}\">";
    fileTemplate += "<div class=\"progressbar\"></div>";
    fileTemplate += "<div class=\"filename\">{{filename}}</div>";
    fileTemplate += "</div>";

    function slugify(text) {
        text = text.replace(/[^-a-zA-Z0-9,&\s]+/ig, '');
        text = text.replace(/-/gi, "_");
        text = text.replace(/\s/gi, "-");
        return text;
    }

    $(".icon").html5Uploader({
        name: "myfile",
        postUrl: ControllerActions.Upload.DragDropUpload,

        onClientLoadStart: function (e, file) {
            var upload = $(".uploaderSecond");
            if (upload.is(":hidden")) { upload.show(); }

            var count = parseInt($('#uploadCount').val());
            $('#uploadCount').val(++count);
            $(upload).html(count + ' files uploaded');
        },
        onClientLoad: function (e, file) {
            $("#" + slugify(file.name)).find(".preview").append("<img src=\"" + e.target.result + "\" alt=\"\">");
        },
        onServerLoadStart: function (e, file) {
            $("#" + slugify(file.name)).find(".progressbar").progressbar({ value: 0 });
        },
        onServerProgress: function (e, file) {
            if (e.lengthComputable) {
                var percentComplete = (e.loaded / e.total) * 100;
                $("#" + slugify(file.name)).find(".progressbar").progressbar({ value: percentComplete });
            }
        },
        onServerLoad: function (e, file) {
            $("#" + slugify(file.name)).find(".progressbar").progressbar({ value: 100 });
        },
        onSuccess: function (e, file, response) {

            // confirmation
            var fn = $('.uploaderSecond div#' + file.name.replace('.', '') + ' .filename');
            $(fn).text($(fn).text() + ' --> Successfully uploaded.');
            
            refreshHistoryPanel();
        },
        onServerError: function (e, file) {
            alert("Could not upload file: " + file.name);
        }
    });
});

// update files panel - whole hierarchy
function refreshHistoryPanel() {
    $.get(ControllerActions.Upload.UploadItems, function (data) {
        $('#history').html(data);
    });
}