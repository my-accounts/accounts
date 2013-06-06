function setPopupHandlers() {
    $('.popupHandler1').click(function (e) {

        showPopup(true,1);
        e.preventDefault();
    });

    $('body').on('click', '.popupHandler2', function (e) {

        var id = $(this).parent().parent().data('id');
        $('#addNew').data('id', id);

        $('#addNewFilterMessage').text('');

        var regex = $('tr[data-id=' + id + '] td.reference > div').text();
        $('#addNewFilterPattern').val(regex);

        var position = $(this).position();
        $('.popup2').css('top', position.top + 31);
        $('.popup2').css('left', position.left - 155);

        showPopup(true, 2);
        e.preventDefault();
    });

    $('.overlay').click(function (e) {

        showPopup(false);
        e.preventDefault();
    });


    $('#addNewCancel').click(function (e) {

        showPopup(false, 2);
        e.preventDefault();
    });
    
    $('#addNewFilterPattern').keypress(function (e) {
        if (e.which == 13) {
            submitPopup();
        }
    });

    $('#addNewSubmit').click(function (e) {

        e.preventDefault();
        submitPopup();
    });
}

function submitPopup() {
    
    var val = $('#addNewFilterPattern').val().trim();
    var subtypeId = $('#addNew select.subtypes').val();

    var ids = [];
    $('tr:has(td.reference > div:contains("' + val.toUpperCase() + '"))').each(function () {

        // Add only those that have with -= Unknown =- subtype.
        if ($(this).find('td > select').val() < 1) {
            ids.push($(this).data('id'));
        }
    });

    if (ids.length == 0) {

        setModalPopupError(StaticData.Errors.InvalidFilter);
        return;
    }

    // Create ViewModel object with required server parameters
    var viewModel = { RegexId: $('#addNew').data('id'), SubtypeId: subtypeId, Name: val, Ids: ids };

    // Add a new regex to collection
    $.post(ControllerActions.Home.NewRegexForRecord, viewModel, function (result) {

        if (result.Result) {

            // Hide dialog box for adding new regex
            showPopup(false, 2);

            // Update DOM (both types and subtypes !!!)
            for (var i = 0; i < ids.length; i++) {

                // Remove green 'adding' badge  - we do not need it aanymore
                $('.addCategory').hide();

                // Update subtype select box with new value
                $('tr[data-id=' + ids[i] + '] td select').val(subtypeId);

                // Update type with new value. Get it from current optgroup's label.
                var type = $('tr[data-id=' + ids[i] + '] td select option[value=' + subtypeId + ']').parent().attr('label');
                $('tr[data-id=' + ids[i] + '] td.type').text(type);
            }
        }
        else {
            // TODO: Instead of CustomErrorMessage receive new ErrorMessage object from controller
            setModalPopupError(result.CustomErrorMessage);
        }
    });
}

function setModalPopupError(text) {
    $('#addNewFilterMessage').text(text);
}

function showPopup(show, id) {

    var visibility = show ? 'visible' : 'hidden';
    var opacity = show ? 1 : 0;

    $('.overlay').css('visibility', visibility);
    $('.overlay').css('opacity', opacity);

    if (id == 1) {
        $('.popup').css('visibility', visibility);
        $('.popup').css('opacity', opacity);
    }
    if (id == 2) {
        $('.popup2').css('visibility', visibility);
        $('.popup2').css('opacity', opacity);
    }
    
    if (!show) {
        $('.popup').css('visibility', visibility);
        $('.popup2').css('visibility', visibility);
        $('.popup').css('opacity', opacity);
        $('.popup2').css('opacity', opacity);
        return;
    }
}
