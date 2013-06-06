$(document).ready(function () {

    // Set ON all the checkboxes first time when load
    $('input[type=checkbox]').prop('checked', true);
    
    // Searchbox
    $('#searchBox').keyup(function () {

        // TODO: Do search request only after 2-3 characters entered, as doing for each does timing and server load. Ignore some special characters
        refreshData();
    });

    // Adds attachment - fires immediately after a file has been chosen
    $('body').on('change', 'input[type="file"]', function() {

        if ($(this).val() == '') { return; }

        var id = $(this).parent().parent().parent().data('id');

        var data = new FormData();
        data.append('id', id);
        data.append('file', $(this)[0].files[0]);


        $.ajax({
            url: ControllerActions.Home.AttachmentAdd, data: data, cache: false, contentType: false, processData: false, type: 'POST',
            success: function (res) {
                if (res.length > 0) {

                    $('tr[data-id=' + id + '] td.attach').html(res);
                }
            }
        });
    });

    // Removes attachment
    $('body').on('click', '.removeFile', function() {

        var id = $(this).parent().parent().data('id');
        var data = new FormData();
        data.append('id', id);

        $.ajax({
            url: ControllerActions.Home.AttachmentDel, data: data, cache: false, contentType: false, processData: false, type: 'POST',
            success: function (res) {
                if (res) {
                    $('tr[data-id=' + id + '] td.attach').html('<div class="fileContainer hand"><div class="addFile"></div><input type="file"/></div>');
                }
            }
        });

        return false;
    });

    // Clear Searchbox by clicking X event handler
    $('body').on('click', '.clearSearch', function (e) {

        $(this).parent().find('input').val('');
        e.preventDefault();

        // In case it was searchbox
        if ($(this).parent().attr('id') == "search") {
            refreshData();
        }
            // in case it was X button from comments column
        else if ($(this).parent().parent().is('td') && $(this).parent().parent().hasClass('comment')) {
            var id = $(this).parent().parent().parent().data('id');
            updateRecord(id);
        }
        // .. otherwise it was X from .popup2 modal window - just ignore then
    });

    // Sorting expanders/ collapsers
    $('body').on('click', '.sortable', function () {
        
        $('#sortingColumn').val($(this).attr('id'));

        var dir = 'desc';
        var val = $('#sortingDirection').val();

        if (val.length > 0) {
            if (val == "desc") dir = "asc";
            if (val == "asc") dir = "desc";
        }

        $('#sortingDirection').val(dir);

        refreshData();
    });

    // Set change event handler for subtupe
    $('body').on('change', 'td select.subtypes', function () {
        var id = $(this).parent().parent().data('id');
        updateRecord(id);
    });

    // Comment updater: works after 'ENTER' and if text has not been changed
    $('body').on('change', 'td.comment input[type=text]', function () {

        if ($(this).val() != $(this).attr('title')) {

            var id = $(this).parent().parent().parent().parent().data('id');
            updateRecord(id);
        }
    });

    // Displays tooltip with long texts that did not fit reference column and cut by css ellipsis
    $('body').on('mouseenter', 'td.reference > div', function () {

        var $this = $(this);
        if (this.offsetWidth < this.scrollWidth && !$this.attr('title')) {
            $this.attr('title', $this.text().trim());
        }
    });

    // Download CVS link handler
    $('.down').click(function() {
        $.download(ControllerActions.Home.Csv, getParameters(), 'post');
    });

    // Initial data request
    refreshData();
});

function refreshData() {

    $('.spinner').show();

    // Request the data asyncronously
    $.post(ControllerActions.Home.RefreshData, getParameters(), function (result) {
        if (result.length > 0) {

            if (result.startsWith('<!DOCTYPE')) {
                window.location.replace(rootPath + "User/Login?ReturnUrl=%2fAccounts%2fHome%2fRefreshData");
            }

            // Update DOM with new data and set event handlers
            afterDataRefreshed(result);
            
            $('.spinner').hide();
        }
        else {
            alert('Something went went wrong'); return false;
        }
    });
}

// gets parameters for /Home/RefreshData request
function getParameters() {

    var param = {
        Companies: [],
        Subtypes: [],
        Years: [],
        SortingColumn: $('#sortingColumn').val().length > 0 ? $('#sortingColumn').val() : "date",
        SortingDirection: $('#sortingDirection').val().length > 0 ? $('#sortingDirection').val() : "asc",
        SearchFilter: $('#searchBox').val()
    };

    $('#left input:checkbox').each(function (i, o) {

        if ($(o).is(':checked')) {
            var _id = $(o).attr('id');

            if (_id.match("^_account")) { param.Companies.push(parseInt(_id.substring(8))); }
            else if (_id.match("^_subtype")) { param.Subtypes.push(parseInt(_id.substring(8))); }
            else if (_id.match("^_year")) { param.Years.push(parseInt(_id.substring(5))); }
        }
    });

    return param;
}

function afterDataRefreshed(result) {

    // Apply resulting markup to our table container
    $('#tableAndTotal').html(result);

    $('#totalRecords').text(result.length-1);

    //Filling IN / OUT total values in the header
    $('#totalInBox').text($('#totalIn').val());
    $('#totalOutBox').text($('#totalOut').val());

    // Creates nice drop-down in the modal windows for Add New Filter
    $('.popup2 select').selectmenu();

    // Re-calculate the height
    adjustSize();
}



function updateRecord(id) {

    var typeSelector = 'tr[data-id=' + id + '] td.type';
    var subtypeSelector = 'tr[data-id=' + id + '] td select.subtypes';
    var inputSelector = 'tr[data-id=' + id + '] td.comment input[type=text]';
    var addNewRegexButtonHtml = '<div class="addCategory popupHandler2 bglgr hand"></div>';

    var subtypeVal = $(subtypeSelector).val();
    var comVal = $(inputSelector).val();

    var record = { "RecordId": id, "SubtypeId": subtypeVal, "Comment": comVal };

    $.post(ControllerActions.Home.UpdateRecord, record, function (result) {
        if (result.length > 0) {
            $(typeSelector).text(result);

            // Add or remove 'Add new filter' icon, depending on subtype selected
            var val = parseInt($(subtypeSelector).val());
            var td = $(subtypeSelector).parent().next();
            $(td).html(val > 0 ? '' : addNewRegexButtonHtml);
        }
        else {
            // Restore to previous comment and subtupe from 'data-old' and 'tooltip' attributes
            $(inputSelector).val($(inputSelector).attr('title'));
            $(subtypeSelector).val($(subtypeSelector).data('old'));
        }
    });
}

