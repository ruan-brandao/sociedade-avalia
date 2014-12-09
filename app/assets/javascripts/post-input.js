$(document).ready(function(){
    $('#post-button').attr('disabled',true);
    $('#post-input').keyup(function(){
        if($(this).val().length !=0)
            $('#post-button').attr('disabled', false);            
        else
            $('#post-button').attr('disabled',true);
    })
});