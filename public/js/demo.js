
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
    });

