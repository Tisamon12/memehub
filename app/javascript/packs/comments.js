$(".answerBtn").click((e) => {
	e.preventDefault()
	$("form[data-comment-id='"+$(e.currentTarget).data('commentId')+"']").removeClass("d-none");
	console.log($("form[data-comment-id='"+$(e.currentTarget).data('commentId')+"']"))
})