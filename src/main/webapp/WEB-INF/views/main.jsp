<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<script src="<s:url value='/resources/SpryAssets/SpryMenuBar.js' />" type="text/javascript"></script>
<script src="<s:url value='/resources/SpryAssets/SpryTabbedPanels.js' />" type="text/javascript"></script>
<link href="<s:url value='/resources/SpryAssets/SpryMenuBarHorizontal.css' />" rel="stylesheet" type="text/css" />
<link href="<s:url value='/resources/SpryAssets/SpryTabbedPanels.css' />" rel="stylesheet" type="text/css" />
    <style>
      html, body, #map-canvas {
        margin: 0;
        padding: 0;
        height: 500px;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
var map;

function readPoints(){
	var latitude = JSON.stringify(${latitude})
	var longitude = JSON.stringify(${longitude})
	var array_latitude = JSON.parse(latitude)
	var array_longitude = JSON.parse(longitude)
	var latlng_array = new Array();
	var size = 2;
	
	for(var i = 0; i < size; i++)
	{
		latlng_array[i] = new google.maps.LatLng(array_latitude.array[i],array_longitude.array[i]);
	}
	return latlng_array;
}

function markPoints(map,latlng_array)
{
	  var marker_array = new Array()
	  var size = latlng_array.length
	  
	  for(var i = 0; i < size; i++)
		{
			 marker_array[i] = new google.maps.Marker({
				position: latlng_array[i],
				map: map, 
				title:""
			}); 
		}
	  return marker_array
}


function initialize() {
	
	
	var size = 2;
	
		
	var latlng_array = readPoints();
	
  	var mapOptions = 
  	{
   	 	zoom: 2,
    	center: new google.maps.LatLng(-34.397, 150.644),
    	mapTypeId: google.maps.MapTypeId.ROADMAP
  	};
  
  
  	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  
  	var marker_array = markPoints(map,latlng_array);
  	

  
}


google.maps.event.addDomListener(window, 'load', initialize);

    </script>
<script type="text/javascript">
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
</script>
</head>

<body>
<div class="fundo">
  <div class="botoes">
    <div class="botoes">
      <ul id="MenuBar1" class="MenuBarHorizontal">
        <li><a href="#">Info</a>        </li>
        <li><a href="edit.html">Editar</a></li>
        <li><a href="main.html">VRP</a></li>
        <li><a href="#">Fluxos</a></li>
</ul>
      <p>&nbsp;</p>
    </div>
    <div class="tabs">
      <div id="TabbedPanels1" class="TabbedPanels">
        <ul class="TabbedPanelsTabGroup">
          <li class="TabbedPanelsTab" tabindex="0">Mapa</li>
          <li class="TabbedPanelsTab" tabindex="0">Direcções</li>
          <li class="TabbedPanelsTab" tabindex="0">Custos (€/Km)</li>
          <li class="TabbedPanelsTab" tabindex="0">Velocidade Méd</li>
          <li class="TabbedPanelsTab" tabindex="0">Custos Transp / Ton</li>
        </ul>
        <div class="TabbedPanelsContentGroup">
          <div class="TabbedPanelsContent">
            <div class="barra_lateral">
              <form name="form" id="form">
                <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)">
                  <option>- Operador Log&#237;stico -</option>
                  <core:forEach items="${opList }" var="opName">
                  	<option>${opName }</option>
                  </core:forEach>
                </select>
                <br />
                <p>
                  <label>
                    <input type="radio" name="RadioGroup1" value="radio" id="RadioGroup1_0" />
                    PE</label>
                  <label>
                    <input type="radio" name="RadioGroup1" value="radio" id="RadioGroup1_1" />
                    Distrito</label>
                  <br />
                  <select name="jumpMenu2" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)">
                    <option>- Nenhum Filtro Seleccionado -</option>
                    <option>Hello World !</option>
                  </select>
                  <br />
                  <label>M&#237;nimo
                    <input name="textfield" type="text" id="textfield" size="5" maxlength="5" />
                  </label>
                  <label>M&#225;ximo
                    <input name="textfield2" type="text" id="textfield2" size="5" maxlength="5" />
                  </label>
                  <br />
                </p>
                <hr size="20" />
                <p>
                  <select name="jumpMenu3" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)">
                    <option selected="selected">- Distrito -</option>
                    <core:forEach items="${distritoList }" var="distName">
                  		<option>${distName }</option>
                  	</core:forEach>
                  </select>
                  <br />
                  <input type="submit" name="button" id="button" value="+" />
                  <input type="submit" name="button2" id="button" value="-" />
                  <br />
                  <br />
                  <select name="jumpMenu4" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)">
                    <option>- Concelho -</option>
                    <core:forEach items="${concelhoList }" var="concName">
                  		<option>${concName }</option>
                  	</core:forEach>
                  </select>
                  <br />
                  <input type="submit" name="button3" id="button" value="+" />
                  <input type="submit" name="button4" id="button" value="-" />
                </p>
                <p>
                  <textarea name="textarea" id="textarea" cols="30" rows="18"></textarea>
                </p>
              </form>
            </div>
            <div id="map-canvas"></div>
          </div>
          <div class="TabbedPanelsContent">Content 2</div>
          <div class="TabbedPanelsContent">Content 3</div>
          <div class="TabbedPanelsContent">Content 4</div>
          <div class="TabbedPanelsContent">Content 5</div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
</body>
</html>
