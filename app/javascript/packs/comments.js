$(".answerBtn").click((e) => {
	e.preventDefault()
	$("form[data-comment-id='"+$(e.currentTarget).data('commentId')+"']").toggleClass("d-none");
})