$(document).ready(function () {

    $('#addCompany').click(function () {

        // TODO: Validate value
        var data = { "companyName": $('#newCompany').val() };
        
        $.post(ControllerActions.Settings.CompanyAdd, data, function (result) {
            if (result.ErrorMessage == null) {
                $('#companiesList').html(result);
                $('#newCompany').val('');

                adjustSize();
            }
            else {
                alert(result.ErrorMessage);
            }
        });
    });
    
    $('body').on('click', '.removeFile', function(e) {

        if (confirm("Are you sure?")) {

            var data = { "companyId": $(this).parent().data('id') };

            $.post(ControllerActions.Settings.CompanyDel, data, function(result) {
                if (result.ErrorMessage == null) {
                    $('#companiesList').html(result);
                    
                    adjustSize();
                } else {
                    alert(result.ErrorMessage);
                }
            });
        }
    });

    $('body').on('change', '.ci', function (e) {

        var input = $(this);
        var data = { "companyId": $(input).parent().data('id'), "companyName": $(input).val().trim() };

        $.post(ControllerActions.Settings.CompanyRename, data, function(result) {
            if (result) {
                $(input).data('old', $(input).val());
            } else {
                $(input).val($(input).data('old'));
            }
        });
    });

    $('body').on('change', '#startDates', function (e) {

        var input = $(this);
        var data = { "id": $(input).val() };

        $.post(ControllerActions.Settings.YearStartDateChange, data, function (result) {
            if (result) {
                $(input).data('old', $(input).val());
            } else {
                $(input).selectmenu("value", $(input).data('old'));
            }
        });
    });

    // Make main drop down nice
    $('.generalSettings  select').selectmenu();
});