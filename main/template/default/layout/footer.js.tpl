<script>
    $("form").on("click", ' .advanced_parameters', function() {
        /*var id = $(this).attr('id') + '_options';
        console.log(id);
        $("#"+id).toggleClass('active');
        var button = $(this);
        $("#"+id).toggle(function() {
            $("#"+id).toggleClass('active');
        });*/
    });

    /* Makes row highlighting possible */
    $(document).ready( function() {
        // Date time settings.
        moment.locale('{{ locale }}');
        $.datepicker.setDefaults($.datepicker.regional["{{ locale }}"]);
        $.datepicker.regional["local"] = $.datepicker.regional["{{ locale }}"];

        // Bootstrap tabs.
        $('.tab-wrapper a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');

            //$('#tabs a:first').tab('show') // Select first tab
        });

        // Fixes bug when loading links inside a tab.
        $('.tab-wrapper .tab-pane a').unbind();

        /**
         * Advanced options
         * Usage
         * <a id="link" href="url">Advanced</a>
         * <div id="link_options">
         *     hidden content :)
         * </div>
         * */
        $(".advanced_options").on("click", function(event) {
            event.preventDefault();
            var id = $(this).attr('id') + '_options';
            var button = $(this);
            button.toggleClass('active');
            $("#"+id).toggle();
        });

        /**
         * <a class="advanced_options_open" href="http://" rel="div_id">Open</a>
         * <a class="advanced_options_close" href="http://" rel="div_id">Close</a>
         * <div id="div_id">Div content</div>
         * */
        $(".advanced_options_open").on("click", function(event) {
            event.preventDefault();
            var id = $(this).attr('rel');
            $("#"+id).show();
        });

        $(".advanced_options_close").on("click", function(event) {
            event.preventDefault();
            var id = $(this).attr('rel');
            $("#"+id).hide();
        });

        // Chosen select
        $(".chzn-select").chosen({
            disable_search_threshold: 10,
            width: "100%"
        });

        // Adv multi-select search input.
        $('.select_class_filter').on('focus', function() {
            var inputId = $(this).attr('id');
            inputId = inputId.replace('-filter', '');
            $("#"+ inputId).filterByText($("#"+inputId+"-filter"));
        });

        $(".jp-jplayer audio").addClass('skip');

        // Mediaelement
        jQuery('video:not(.skip), audio:not(.skip)').mediaelementplayer(/* Options */);

        // Table highlight.
        $("form .data_table input:checkbox").click(function() {
            if ($(this).is(":checked")) {
                $(this).parentsUntil("tr").parent().addClass("row_selected");

            } else {
                $(this).parentsUntil("tr").parent().removeClass("row_selected");
            }
        });

        /* For non HTML5 browsers */
        if ($("#formLogin".length > 1)) {
            $("input[name=login]").focus();
        }

        /* For IOS users */
        $('.autocapitalize_off').attr('autocapitalize', 'off');

        // Tool tip (in exercises)
        var tip_options = {
            placement : 'right'
        };
        $('.boot-tooltip').tooltip(tip_options);
    });

    // @todo move in a chamilo.js js lib.

    jQuery.fn.filterByText = function(textbox) {
        return this.each(function() {
            var select = this;
            var options = [];
            $(select).find('option').each(function() {
                options.push({value: $(this).val(), text: $(this).text()});
            });
            $(select).data('options', options);

            $(textbox).bind('change keyup', function() {
                var options = $(select).empty().data('options');
                var search = $.trim($(this).val());
                var regex = new RegExp(search,"gi");

                $.each(options, function(i) {
                    var option = options[i];
                    if(option.text.match(regex) !== null) {
                        $(select).append(
                            $('<option>').text(option.text).val(option.value)
                        );
                    }
                });
            });
        });
    };
</script>
