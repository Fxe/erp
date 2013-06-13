function add_dist() {
	var dist = $('#cmb_list_dist').val();
	if ( dist != -1) {
		//alert(dist);
		$.ajax({
			type: "GET",
			url: "http://localhost:8080/erp/main/addDist.ajax",
			data: "dist=" + dist,
			success: function(response) {
				//we have the response
				if (response.status = "SUCCESS") {
					if ( response == 'null') {
						$('#info').html("Duplicate Element");
					} else {
						$('#lst_point_group').append('<option>' + dist + '</option>');
						$('#info').html("LIST = " + response);
					}
				} else {
					errorInfo = "";
				}
			},
			error: function(e) {
				$('#erro').html("ERROR - " + e.responseText);
			}
	  });
	}
}