$(document).ready(function () {

    // Collapse All link handler
    $('body').on('click', '#collapseAll', function (e) {

        var local = '.typesSettings .cls';
        var global = '#collapseAll';
        expandCollapse(local, global);

        adjustSize();
        e.preventDefault();
    });

    // Collapse specific type (left arrow) handlers
    $('body').on('click', '.cls', function (e) {

        if ($(this).hasClass('expand')) {

            $(this).removeClass('expand');
            $(this).addClass('collapse');

            $(this).parent().next().show();
            $(this).parent().next().next().show();
        }
        else if ($(this).hasClass('collapse')) {

            $(this).removeClass('collapse');
            $(this).addClass('expand');

            $(this).parent().next().hide();
            $(this).parent().next().next().hide();
        }

        adjustSize();
        e.preventDefault();
    });

    // Add new type handler
    $('#newType').change(function (e) {
            
            var vs = setViewState();

            var input = $(this);
            var data = { "typeName": $(input).val().trim() };

            $.post(ControllerActions.Settings.TypeAdd, data, function (result) {
                if (result.ErrorMessage == null) {
                    $('#typesList').html(result);
                    $(input).val('');
                    typesFromViewState(vs);

                    adjustSize();
                    addDragDropHandler();

                } else {
                    alert(result.ErrorMessage);
                }
            });

            e.preventDefault();
    });

    // Type updated
    $('body').on('change', '.typeInput', function (e) {

        var input = $(this);
        var data = { "typeId": $(input).parent().data('id'), "typeName": $(input).val().trim() };

        $.post(ControllerActions.Settings.TypeRename, data, function (result) {
            if (!result) {
                $(input).val($(input).data('old'));
            }
        });
    });

    // Clicking X to delete type
    $('body').on('click', '.typeDel', function (e) {

        var vs = setViewState();

        var input = $(this);
        var data = { "typeId": $(input).parent().data('id') };

        $.post(ControllerActions.Settings.TypeDelete, data, function (result) {
            if (result.ErrorMessage == null) {

                $('#typesList').html(result);
                typesFromViewState(vs);
                
                adjustSize();
                addDragDropHandler();
            } else {
                alert(result.ErrorMessage);
            }
        });
    });
    
    // Add new subtype handler
    $('body').on('change', '.subtypeAdd', function (e) {

        var vs = setViewState();

        var input = $(this);
        var data = { "subtypeName": $(input).val().trim(), "typeId": $(input).parent().parent().prev().data('id') };

        $.post(ControllerActions.Settings.SubtypeAdd, data, function (result) {

            if (result.ErrorMessage == null) {
                $('#typesList').html(result);
                $(input).val('');
                typesFromViewState(vs);
                
                adjustSize();
                addDragDropHandler();
            } else {
                alert(result.ErrorMessage);
            }
        });

        e.preventDefault();
    });

    // Subtype update
    $('body').on('change', '.subtypeInput', function (e) {

        var input = $(this);
        var data = {
            "subtypeId": $(input).parent().data('id'),
            "typeId": $(input).parent().parent().prev().prev().data('id'),
            "subtypeName": $(input).val().trim()
        };

        $.post(ControllerActions.Settings.SubtypeUpdate, data, function (result) {
            if (!result) {
                $(input).val($(input).data('old'));
            }
        });
    });

    // Clicking X to delete subtype
    $('body').on('click', '.subtypeDel', function (e) {

        var vs = setViewState();

        var input = $(this);
        var data = { "subtypeId": $(input).parent().data('id') };

        $.post(ControllerActions.Settings.SubtypeDelete, data, function (result) {
            if (result.ErrorMessage == null) {

                $('#typesList').html(result);
                typesFromViewState(vs);
                
                adjustSize();
                addDragDropHandler();
            } else {
                alert(result.ErrorMessage);
            }
        });
    });

    addDragDropHandler();
    
    if (!Modernizr.draganddrop) { alert('Your browser does not support drag and drop. Please update!'); }
});

function addDragDropHandler() {
    
    // Drag and Drop subtypes
    $('.dropme').sortable({
        connectWith: '.dropme', cursor: 'n-resize',
        stop: function (event, ui) {

            var previousTypeId = $(ui.item).data('typeid');
            var currentTypeId = $(ui.item).parent().prev().prev().data('id');

            if (previousTypeId != currentTypeId) {

                var subtypeId = $(ui.item).data('id');
                var subtypeName = $(ui.item).find('input').val();

                var data = { "subtypeId": subtypeId, "typeId": currentTypeId, "subtypeName": subtypeName };

                $.post(ControllerActions.Settings.SubtypeUpdate, data, function (result) {
                    if (!result) {
                        alert('Update failed');
                    }
                });
            }
        }
    });
}

function expandCollapse(local, global) {

    if ($(global).hasClass('exp')) {

        $(local).removeClass('expand');
        $(local).addClass('collapse');

        $(local).parent().next().next().show();
        $(local).parent().next().show();

        if ($(global).attr('id') == 'collapseAll') {
            $(global).text('collapse all');
        }

        $(global).removeClass('exp');
        $(global).addClass('col');
    }
    else if ($(global).hasClass('col')) {

        $(local).removeClass('collapse');
        $(local).addClass('expand');

        $(local).parent().next().next().hide();
        $(local).parent().next().hide();

        if ($(global).attr('id') == 'collapseAll') {
            $(global).text('expand all');
        }

        $(global).removeClass('col');
        $(global).addClass('exp');
    }
}

function setViewState() {
    var viewState = [];
    $('#typesList > div[data-id]').each(function (idx, obj) {
        var id = $(this).data('id');
        var isCollapsed = $(this).children('span.tr').hasClass('collapse');

        if (isCollapsed != null) {
            viewState[id] = isCollapsed;
        } else {
            var jk = 0;
        }
        
    });

    return viewState;
}

function typesFromViewState(viewState) {
    
    for (key in viewState) {
        var span = $('#typesList > div[data-id=' + key + '] > span.tr');
        
        if (viewState[key]) {
            $(span).removeClass('exp');
            $(span).addClass('col');

            $(span).parent().next().show();
            $(span).parent().next().next().show();
        }
        else {
            $(span).removeClass('collapse');
            $(span).addClass('expand');

            $(span).parent().next().hide();
            $(span).parent().next().next().hide();
        }
    }
}