
    $( document ).ready(function() {

        //projects
        $('#new_project').click(function(){
            $('#create_project_modal').modal({});
        });

        $('#documentType > a').click(function(elem){
            var alllinks = $('#documentType a');
            $.each(alllinks, function(index, value){
                $(alllinks[index]).removeClass("active");
            });
            $(this).addClass( "active" );
        });

        $('#save_document_changes').click(function(){
            $('#create_project_modal').modal('hide');
        })


        //documents
        $('#new_document').click(function(){
            $('#create_document_modal').modal({});
        });

        $('#documentType > a').click(function(elem){
            var alllinks = $('#documentType a');
            $.each(alllinks, function(index, value){
                $(alllinks[index]).removeClass("active");
            });
            $(this).addClass( "active" );
        });

        $('#create_document_start').click(function(){
            $('#create_document_modal').modal('hide');
            window.location = "/projects/1/doctype/1"
        })

        function updateProgressbar() {
            var val = $("#progress-bar").attr('aria-valuenow');
            var newval =  (Number(val) + 5);
            $("#progress-bar").html( newval + "%");
            $('#progress-bar').css('width', newval + "%");
            $("#progress-bar").attr('aria-valuenow', newval);
        }

        $('#mission').blur(function(){
            updateProgressbar();
        });

        $('#responsibleGoals').blur(function(){
            updateProgressbar();
        });

        $('#projectObjective').blur(function(){
            updateProgressbar();
        });

        $('#responsible').blur(function(){
            updateProgressbar();
        });

        $('#responsible2').blur(function(){
            updateProgressbar();
        });

        $('#projectGoals').blur(function(){
            updateProgressbar();
        });


        $('#projectRisks').blur(function(){
            updateProgressbar();
        });

        $('#resolveRisks').blur(function(){
            updateProgressbar();
        });

        $('#backupMoney').blur(function(){
            updateProgressbar();
        });

        $('#totalCosts').blur(function(){
            updateProgressbar();
        });

        $('#projectCosts').blur(function(){
            updateProgressbar();
        });
    });

