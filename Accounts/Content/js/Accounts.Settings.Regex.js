$(document).ready(function () {

    // Add new regex by clicking green 'Add' button
    $('body').on('click', '#addRegex', function (e) {

        // TODO: Validate value
        var data = { "regex": $('#regexAdd').val().trim(), "subtypeId": $(this).parent().prev().find('select').val() };

        $.post(ControllerActions.Settings.RegexAdd, data, function (result) {
            if (result.ErrorMessage == null) {
                $('#regexList').html(result);
                $('#regexAdd').val('');

                adjustSize();
            }
            else {
                alert(result.ErrorMessage);
            }
        });
    });

    // Change regex
    $('body').on('change', '.ri', function (e) {

        var input = $(this);
        var data = {
            "regexId": $(input).parent().parent().data('id'),
            "subtypeId": $(input).parent().next().find('select').val(),
            "regex": $(input).val().trim()
        };

        $.post(ControllerActions.Settings.RegexRename, data, function (result) {
            if (result) {
                $(input).data('old', $(input).val());
            } else {
                $(input).val($(input).data('old'));
            }
        });
    });

    // Change type for regex (changing a dropdown)
    $('body').on('change', '.subtypes', function (e) {
        
        var input = $(this);

        var data = {
            "regexId": $(input).parent().parent().data('id'),
            "subtypeId": $(input).val(),
            "regex": $(input).parent().prev(2).find('input').val().trim()
        };

        $.post(ControllerActions.Settings.RegexRename, data, function (result) {
            if (result) {
                $(input).data('old', $(input).val());
            } else {
                $(input).val($(input).data('old'));
            }
        });
    });

    // Delete regex handler
    $('body').on('click', '.removeFile', function (e) {

        if (confirm("Are you sure?")) {

            var data = { "regexId": $(this).parent().parent().data('id') };

            $.post(ControllerActions.Settings.RegexDelete, data, function (result) {
                if (result.ErrorMessage == null) {
                    $('#regexList').html(result);
                    
                    adjustSize();
                } else {
                    alert(result.ErrorMessage);
                }
            });
        }
    });
    
    adjustSize();
});