$(document).ready(function() {
	$(".complete").click(function(){
		var targetId = $(this).attr("id");
		var id = targetId.split("complete_task_")[1];
		$.ajax({
			url:"./tasks/remove/"+id,
			type:"POST",
			success: function(data){
				$("#" + targetId).remove();
			}
		})
	})
});