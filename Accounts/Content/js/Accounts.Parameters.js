$(function () {

    initTristate(true); // if false then all nodes will be closed

    function initTristate(visible) {

        if (visible) {

            // Open all nodes first
            $('.tri-state span.tr').next().show();
            $('.tri-state span.tr').addClass('collapse');
            
            // Then сlose last nodes (those having subtypes) 
            $('.tri-state span.typeExpander').next().hide();
            $('.tri-state span.typeExpander').removeClass('collapse').addClass('expand');
        } else {
            $('.tri-state span.tr').next().hide();
            $('.tri-state span.tr').addClass('expand');
        }
    }

    // Checkboxes click handler
    $('input[type="checkbox"]').change(function (e) {
        var checked = $(this).prop("checked"),
            container = $(this).parent(),
            siblings = container.siblings();

        container.find('input[type="checkbox"]').prop({ indeterminate: false, checked: checked });
        container.find('input[type="checkbox"] + label').after().removeClass("undefined");

        function checkSiblings(el) {
            var parent = el.parent().parent(),
                all = true;

            el.siblings().each(function () {
                return all = ($(this).children('input[type="checkbox"]').prop("checked") === checked);
            });

            if (all && checked) {
                parent.children('input[type="checkbox"]').prop({ indeterminate: false, checked: checked });
                parent.children('input[type="checkbox"] + label').after().removeClass("undefined");

                checkSiblings(parent);
            } else if (all && !checked) {

                // Please be aware of closure error, if you put (parent.find('input[type="checkbox"]:checked').length > 0) into separate variable in current scope

                parent.children('input[type="checkbox"]').prop("checked", checked);
                parent.children('input[type="checkbox"]').prop("indeterminate", (parent.find('input[type="checkbox"]:checked').length > 0));

                if (parent.find('input[type="checkbox"]:checked').length > 0) {
                    
                    parent.children('input[type="checkbox"] + label').after().addClass("undefined");
                }
                else {
                    
                    parent.children('input[type="checkbox"] + label').after().removeClass("undefined");
                }

                checkSiblings(parent);
            } else {
                el.parents("div").children('input[type="checkbox"]').prop({ indeterminate: true, checked: false });
                el.parents("div").children('input[type="checkbox"] + label').after().addClass("undefined");
            }
        }

        checkSiblings(container);
        
        refreshData();
    });
    
    // Left panel collapse / expande triangles click
    $('#left .tr').on('click', function (e) {

        $(this).parent().children('div').first().toggle();

        //var height = $(this).parent().children('div').first().height();

        if ($(this).hasClass('expand')) {

            $(this).removeClass('expand');
            $(this).addClass('collapse');
        }
        else if ($(this).hasClass('collapse')) {

            $(this).removeClass('collapse');
            $(this).addClass('expand');
        }

        e.preventDefault();
    });
});
