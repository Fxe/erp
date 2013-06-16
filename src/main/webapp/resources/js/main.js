

/*
 * points referes to a list of points without any meaning between them.
   routes referes to a list of points that below to a given route.
 */ 


function readPoints2(response)
{
	var points = JSON.stringify(response);	// Conver string to Json
	var array_points = $.parseJSON(points);	
	var latlng_array = new Array();
	var size = 0;
	
	// {K1:[P1,P2,P3], K2:[P1,P2,P3]... KN:...}
	for (key in array_points)
	{
		size = array_points[key].length;
	
		// For each group of points mark them on the map
		for(var i = 0; i < size; i+=2)
		{
			latlng_array[i] = new google.maps.LatLng(array_points[key][i],array_points[key][i+1]);
		}
	}
	return latlng_array;
}

function markPoints2(map,latlng_array)
{
	  var marker_array = new Array();
	  var size = latlng_array.length;
	  
	  for(var i = 0; i < size; i++)
		{
			 marker_array[i] = new google.maps.Marker({
				position: latlng_array[i],
				map: map, 
				title:"",
			}); 
		}
	  return marker_array;
}

















function add_dist(map) {
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
						var latlng_array = readPoints2(response);	// Get array of Points to mark on the map
						var marker_array = markPoints2(map,latlng_array);	// Mark points on the map
						
						$('#lst_point_group').append('<option>' + dist + '</option>');
						$('#info').html("LIST = " + response);
						alert(response)
						
						
						
						
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