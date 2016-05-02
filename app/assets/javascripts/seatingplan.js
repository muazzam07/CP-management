function move (id) {
	var roll_num = prompt("Enter Roll Number. e.g. 15100245");
	if(roll_num != null)
	{
		document.getElementById(id).innerHTML = roll_num.fontsize(1);
	}
	var params = {};
	if (location.search) {
    	var parts = location.search.substring(1).split('&');
	 	for (var i = 0; i < parts.length; i++) {
        	var nv = parts[i].split('=');
        	if (!nv[0]) continue;
        	params[nv[0]] = nv[1] || true;
    	}
	}
	var c_id = params.course_id
	c_id = c_id.toString()
	var url = "/users/course/seatingplan?course_id="
	url = url.concat(c_id)
	var JSONObject =	{	roll_number: roll_num, id: id}
	$.ajax({
            type: "GET",
			url: url,
            cache: false,
            data: JSONObject
        });
}


function mark (id) {
	var params = {};
	if (location.search) {
    	var parts = location.search.substring(1).split('&');
	 	for (var i = 0; i < parts.length; i++) {
        	var nv = parts[i].split('=');
        	if (!nv[0]) continue;
        	params[nv[0]] = nv[1] || true;
    	}
	}
	var c_id = params.course_id
	c_id = c_id.toString()
	var url = "/users/course/markclass?course_id="
	url = url.concat(c_id)
	var JSONObject =	{ id: id}
	$.ajax({
            type: "GET",
			url: url,
            cache: false,
            data: JSONObject
        });
}