$(document).ready(function () {
    
    // create from secratch
    $("#scratch").click(function () {
        $("#alert_scratch").hide();
        $("#alert_template").show();
        $('#templates').show();
    });
        // show create from templates
    $("#template").click(function () {
        $("#alert_template").hide();
        $('#templates').hide();
        $("#alert_scratch").show();
    });

    // handel assign later
    
    $('#assignLater').click(function () {
        if ($(this).prop("checked") == true) {
           
            $('#assignTo').attr("disabled", "disabled");
           
        }
        else if ($(this).prop("checked") == false) {
            $('#assignTo').attr("disabled", false);
        }
    });

   
    // show sub time 
    $('#time_type').change(function(){
        $('.hours').hide();
        $('.' + $(this).val()).show();
    });
        // repeat every  
    $('#repeat-every').click(function(){ 
        $('.every-time').prop("disabled", false);
  
    });

     // repeat once  
    $('#repeat-once').click(function(){ 
        $('.every-time').prop("disabled", true);
  
    });

    // notify user befor 
    $('#check-dis').click(function(){ 
        $('.check_disa').toggle();
      
    });
   
}); // end of document ready