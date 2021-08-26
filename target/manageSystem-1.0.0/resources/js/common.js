function fncAjaxPage(url, method, data, target){
	$.ajax({
		url: url,
		method: method,
		dataType: "html",
		data : data
	}).done(function(html) {
		$("#"+target).html(html)
	}).fail(function( jqXHR, textStatus, errorThrown ) {
		if(jqXHR.status == 403){
			fncLoginMsg();
		}else{
			alert("Error!", "Request failed: " + errorThrown, "error");
		}
	});
}

function fncAjax(url, method, data, success){
	$.ajax({
		url: url,
		method: method,
		data : data,
		success : success
	});
}