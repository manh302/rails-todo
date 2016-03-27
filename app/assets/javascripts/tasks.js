$(document).ready(function() {
/*	$(".complete").click(function(){
		var targetId = $(this).attr("id");
		var id = targetId.split("complete_task_")[1];
		$.ajax({
			url:"./tasks/update/"+id,
			data:{is_use:"1"},
			type:"POST",
			success: function(data){
			}
		})
	});
*/
	$("body").on("click",".complete", function(e){
		var targetId = $(this).attr("id");
		var id = targetId.split("complete_task_")[1];
		console.log("/tasks/update/" + id+"?is_use=1");
		$("#complete_update_link").attr("href", "./tasks/update/" + id+"?is_use=1");
		$("#complete_update_link").trigger("click");
	});
});