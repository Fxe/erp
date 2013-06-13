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
function initialize() {
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(-34.397, 150.644),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
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
        <li><a href="${pageContext.servletContext.contextPath}/edit/">Editar</a></li>
        <li><a href="${pageContext.servletContext.contextPath}/main/">VRP</a></li>
        <li><a href="${pageContext.servletContext.contextPath}/flux/">Fluxos</a></li>
</ul>
      <p>&nbsp;</p>
    </div>
    <div class="tabs">
      <div id="TabbedPanels1" class="TabbedPanels">
        <ul class="TabbedPanelsTabGroup">
          <li class="TabbedPanelsTab" tabindex="0">Mapa</li>
          <li class="TabbedPanelsTab" tabindex="0">DirecÃ§Ãµes</li>
          <li class="TabbedPanelsTab" tabindex="0">Custos (â¬/Km)</li>
          <li class="TabbedPanelsTab" tabindex="0">Velocidade MÃ©d</li>
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
          <div class="TabbedPanelsContent">            
          	<p><strong>Custo para OL de Km percorrido por dia (€/Km)</strong></p>
            <table width="933" border="1" class="tabela">
              <tr>
                <td colspan="2" class="tabela"><strong>Viatura: Conjunto articulado 40 ton PB</strong></td>
                <td colspan="2" class="tabela"><strong>Combustível</strong></td>
              </tr>
              <tr>
                <td width="223" class="tabela">(1) Estimativa Km/ano da viatura</td>
                <td width="256" class="tabela"><input name="textfield11" type="text" id="textfield10" value="84004.8" size="15" maxlength="22" /></td>
                <td width="204" class="tabela">Preço (€/litro)</td>
                <td width="284" class="tabela"><input name="textfield17" type="text" id="textfield16" value="0.8" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Percentagem anual kms vendidos</td>
                <td class="tabela"><input name="textfield12" type="text" id="textfield11" value="90" size="15" maxlength="22" />%</td>
                <td class="tabela">Taxa de IVA</td>
                <td class="tabela"><input name="textfield18" type="text" id="textfield18" value="0.2" size="15" maxlength="22" />
                %</td>
              </tr>
              <tr>
                <td class="tabela">Dias úteis de trabalho anual</td>
                <td class="tabela"><input name="textfield13" type="text" id="textfield12" value="215" size="15" maxlength="22" /></td>
                <td class="tabela">(3) Preço sem IVA (€/litro)</td>
                <td class="tabela"><input name="textfield19" type="text" id="textfield19" value="0.6667" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Horas normais de trabalho anual</td>
                <td class="tabela"><input name="textfield14" type="text" id="textfield13" value="1720" size="15" maxlength="22" /></td>
                <td class="tabela">Consumo médio (litros/100km)</td>
                <td class="tabela"><input name="textfield20" type="text" id="textfield20" value="15" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Velocidade média (km/h)</td>
                <td class="tabela"><input name="textfield15" type="text" id="textfield14" value="48.84" size="15" maxlength="22" /></td>
                <td class="tabela">Custo/km (€)</td>
                <td class="tabela"><input name="textfield21" type="text" id="textfield21" value="0.1" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">(2) Km/dia assumidos</td>
                <td class="tabela"><input name="textfield16" type="text" id="textfield15" value="390" size="15" maxlength="22" /></td>
                <td colspan="2" class="tabela">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="4" class="tabela"><div align="center"><strong>----Fórmulas usadas----</strong></div></td>
              </tr>
              <tr>
                <td colspan="2" class="tabela">(1) Velocidade média (km/h) <strong>x</strong> Horas normais de trabalho anual</td>
                <td colspan="2" class="tabela">(3) Preço (€/litro) <strong>/</strong> (1 - Preço sem IVA (€/litro))</td>
              </tr>
              <tr>
                <td colspan="2" class="tabela">(2) Estimativa km/ano da viatura <strong>/</strong> Dias úteis de trabalho anual</td>
                <td colspan="2" class="tabela">(4) Preço sem IVA (€/litro) <strong>x</strong> Consumo médio (litros/100km) <strong>/</strong> 100</td>
              </tr>
            </table>
            <p class="tabela">&nbsp;</p>
            <table width="978" class="tabela">
              <tr>
                <td width="272">Taxa de inflação (% face a Fev - 08)</td>
                <td width="114"><input name="textfield23" type="text" id="textfield68" size="15" maxlength="22" />                </td>
                <td width="576"><input name="textfield23" type="text" id="textfield69" size="15" maxlength="22" />                </td>
              </tr>
              <tr>
                <td colspan="3">(Indice de preços no consumidor / Taxa de inflação (% face a Fev - 08)) - 1</td>
              </tr>
            </table>
            <table width="979">
              <tr class="tabela">
                <td colspan="4"><strong>Síntese de custos variáveis e fixos de operação da viatura</strong></td>
              </tr>
              <tr>
                <td class="tabela">Rubrica</td>
                <td class="tabela">(5) €/Km</td>
                <td class="tabela">(6) €/Ano</td>
                <td class="tabela">(7) % do Total</td>
              </tr>
              <tr>
                <td class="tabela">Gasóleo</td>
                <td class="tabela"><input name="textfield24" type="text" id="textfield24" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield25" type="text" id="textfield25" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield26" type="text" id="textfield26" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Pneus (0.0256)</td>
                <td class="tabela"><input name="textfield27" type="text" id="textfield27" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield28" type="text" id="textfield28" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield29" type="text" id="textfield29" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Óleo (0.0044)</td>
                <td class="tabela"><input name="textfield30" type="text" id="textfield30" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield31" type="text" id="textfield31" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield32" type="text" id="textfield32" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Manutenção (0.0734)</td>
                <td class="tabela"><input name="textfield33" type="text" id="textfield33" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield34" type="text" id="textfield34" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield35" type="text" id="textfield35" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Trânsitos (0.0572)</td>
                <td class="tabela"><input name="textfield36" type="text" id="textfield36" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield37" type="text" id="textfield37" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield38" type="text" id="textfield38" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Salários e encargos (0.02)</td>
                <td class="tabela"><input name="textfield39" type="text" id="textfield39" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield40" type="text" id="textfield40" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield41" type="text" id="textfield41" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Total custos variáveis</td>
                <td class="tabela"><input name="textfield42" type="text" id="textfield42" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield43" type="text" id="textfield43" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield44" type="text" id="textfield44" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Salários e encargos</td>
                <td class="tabela">&nbsp;</td>
                <td class="tabela"><input name="textfield45" type="text" id="textfield45" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield46" type="text" id="textfield46" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Seguros</td>
                <td class="tabela">&nbsp;</td>
                <td class="tabela"><input name="textfield47" type="text" id="textfield47" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield48" type="text" id="textfield48" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Impostos</td>
                <td class="tabela">&nbsp;</td>
                <td class="tabela"><input name="textfield49" type="text" id="textfield49" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield50" type="text" id="textfield50" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Amortizações</td>
                <td class="tabela">&nbsp;</td>
                <td class="tabela"><input name="textfield51" type="text" id="textfield51" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield52" type="text" id="textfield52" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Juros</td>
                <td class="tabela">&nbsp;</td>
                <td class="tabela"><input name="textfield53" type="text" id="textfield53" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield54" type="text" id="textfield54" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Total custos fixos</td>
                <td class="tabela"><input name="textfield55" type="text" id="textfield55" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield56" type="text" id="textfield56" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield57" type="text" id="textfield57" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">Total custos var e fix</td>
                <td class="tabela"><input name="textfield58" type="text" id="textfield58" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield59" type="text" id="textfield59" value="0" size="15" maxlength="22" /></td>
                <td class="tabela"><input name="textfield60" type="text" id="textfield60" value="0" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td class="tabela">(8) Custos gerais</td>
                <td class="tabela"><input name="textfield61" type="text" id="textfield61" value="0" size="15" maxlength="22" /></td>
                <td class="tabela">&nbsp;</td>
                <td class="tabela">&nbsp;</td>
              </tr>
              <tr>
                <td class="tabela">(9) Total Custos</td>
                <td class="tabela"><input name="textfield62" type="text" id="textfield62" value="0" size="15" maxlength="22" />
                  €/Km</td>
                <td class="tabela">&nbsp;</td>
                <td class="tabela">&nbsp;</td>
              </tr>
              <tr>
                <td class="tabela">Margem (% dos custos)</td>
                <td class="tabela"><input name="textfield63" type="text" id="textfield63" value="0" size="15" maxlength="22" />
                  %</td>
                <td class="tabela">&nbsp;</td>
                <td class="tabela">&nbsp;</td>
              </tr>
              <tr>
                <td class="tabela">Margem Proposta Agressiva</td>
                <td class="tabela"><input name="textfield64" type="text" id="textfield64" value="0" size="15" maxlength="22" />
                  %</td>
                <td class="tabela">&nbsp;</td>
                <td class="tabela">&nbsp;</td>
              </tr>
              <tr>
                <td class="tabela">Margem Proposta Conservadora</td>
                <td class="tabela"><input name="textfield65" type="text" id="textfield65" value="0" size="15" maxlength="22" />
                  %</td>
                <td class="tabela">&nbsp;</td>
                <td class="tabela">&nbsp;</td>
              </tr>
              <tr>
                <td class="tabela">(10) Custo</td>
                <td class="tabela"><input name="textfield66" type="text" id="textfield66" value="0" size="15" maxlength="22" />
                  €/Km</td>
                <td class="tabela">&nbsp;</td>
                <td class="tabela">&nbsp;</td>
              </tr>
              <tr>
                <td class="tabela">(11) Preço de venda</td>
                <td class="tabela"><input name="textfield67" type="text" id="textfield67" value="0" size="15" maxlength="22" />
                  €/Km</td>
                <td class="tabela">&nbsp;</td>
                <td class="tabela">&nbsp;</td>
              </tr>
            </table>
            <p>&nbsp;</p>
          </div>
          <table width="823">
            <tr>
              <td width="223">Estimativa Km/ano/viatura</td>
              <td width="113"><span class="tabela">
                <input name="textfield22" type="text" id="textfield22" value="84000" size="15" maxlength="22" />
              </span></td>
              <td width="465">&nbsp;</td>
            </tr>
            <tr>
              <td>Dias úteis de trabalho anual</td>
              <td width="113"><span class="tabela">
                <input name="textfield22" type="text" id="textfield22" value="215" size="15" maxlength="22" />
              </span></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>Horas normais de trabalho anual</td>
              <td width="113"><span class="tabela">
                <input name="textfield22" type="text" id="textfield22" value="1720" size="15" maxlength="22" />
              </span></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>Horas normais de trabalho diárias</td>
              <td width="113"><span class="tabela">
                <input name="textfield22" type="text" id="textfield22" value="8" size="15" maxlength="22" />
              </span></td>
              <td class="letrap"> (Horas normais de trabalho anual <strong>/ </strong>Dias úteis de trabalho anual)</td>
            </tr>
            <tr>
              <td>Hora almoço</td>
              <td width="113"><span class="tabela">
                <input name="textfield22" type="text" id="textfield22" value="1" size="15" maxlength="22" />
              </span></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>Horas de deslocações anuais</td>
              <td width="113"><span class="tabela">
                <input name="textfield22" type="text" id="textfield22" value="1505" size="15" maxlength="22" />
              </span></td>
              <td class="letrap">(Dias úteis de trabalho anual <strong>x</strong> Horas em deslocações diárias)</td>
            </tr>
            <tr>
              <td>Velocidade média (Km/h)</td>
              <td width="113"><span class="tabela">
                <input name="textfield22" type="text" id="textfield22" value="55" size="15" maxlength="22" />
              </span></td>
              <td class="letrap">(Estimativa Km/ano/viatura <strong>/</strong> Horas de deslocações anuais)</td>
            </tr>
          </table>
          <table width="997">
            <tr>
              <td width="99"><strong>Inputs</strong></td>
              <td width="104">&nbsp;</td>
              <td width="164">&nbsp;</td>
              <td width="230"><strong>Outputs</strong></td>
              <td width="130">&nbsp;</td>
              <td width="242">&nbsp;</td>
            </tr>
            <tr>
              <td>Capacidade do camião (Kg)</td>
              <td><input name="textfield69" type="text" id="textfield70" value="0" size="10" maxlength="10" /></td>
              <td>&nbsp;</td>
              <td>(1) Nº total de PE visitados</td>
              <td><input name="textfield70" type="text" id="textfield71" value="0" size="10" maxlength="10" /></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>Custo €/Km do transporte</td>
              <td><input name="textfield68" type="text" id="textfield23" value="0" size="10" maxlength="10" /></td>
              <td>&nbsp;</td>
              <td>(2) Recolha total estimada (Kg)</td>
              <td><input name="textfield71" type="text" id="textfield72" value="0" size="10" maxlength="10" />
                vs</td>
              <td><input name="textfield76" type="text" id="textfield77" value="0" size="10" maxlength="10" />
                Capacidade do camião</td>
            </tr>
            <tr>
              <td colspan="3">&nbsp;</td>
              <td>(3) Custo total (€)</td>
              <td><input name="textfield73" type="text" id="textfield74" value="0" size="10" maxlength="10" /></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="letrap"><div align="center">Distrito dos PE</div></td>
              <td class="letrap"><div align="center">Nº de PE visitados</div></td>
              <td class="letrap"><div align="center">Recolha média mensal estimada por local</div></td>
              <td>(4) Custo por tonelada (€/ton)</td>
              <td><input name="textfield74" type="text" id="textfield75" value="0" size="10" maxlength="10" /></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><div align="center">
                <input name="textfield72" type="text" id="textfield73" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield77" type="text" id="textfield78" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield78" type="text" id="textfield79" value="0" size="10" maxlength="10" />
              </div></td>
              <td colspan="3" class="letrap"><div align="center">----------Fórmulas usadas----------</div></td>
            </tr>
            <tr>
              <td><div align="center">
                <input name="textfield72" type="text" id="textfield73" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield77" type="text" id="textfield78" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield78" type="text" id="textfield79" value="0" size="10" maxlength="10" />
              </div></td>
              <td colspan="3" class="letrap">(1) SOMA (Nº de PE visitados)</td>
            </tr>
            <tr>
              <td><div align="center">
                <input name="textfield72" type="text" id="textfield73" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield77" type="text" id="textfield78" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield78" type="text" id="textfield79" value="0" size="10" maxlength="10" />
              </div></td>
              <td colspan="3" class="letrap">(2) SOMA (Nº de PE visitados x Recolha média estimada por local) + Recolha estimada</td>
            </tr>
            <tr>
              <td><div align="center">
                <input name="textfield72" type="text" id="textfield73" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield77" type="text" id="textfield78" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield78" type="text" id="textfield79" value="0" size="10" maxlength="10" />
              </div></td>
              <td colspan="3" class="letrap">(3) SOMA (Nº de PE visitados x Custo dos pontos Electrão por distrito) + Custo da rota (deslocação entre distritos e CR) + Distância extra percorrida (Km) x Custo (€/Km)</td>
            </tr>
            <tr>
              <td><div align="center">
                <input name="textfield72" type="text" id="textfield73" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield77" type="text" id="textfield78" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield78" type="text" id="textfield79" value="0" size="10" maxlength="10" />
              </div></td>
              <td colspan="3" class="letrap">(4) Custo total (€) / (Recolha total estimada (Kg) / 1000)</td>
            </tr>
            <tr>
              <td><div align="center">
                <input name="textfield72" type="text" id="textfield73" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield77" type="text" id="textfield78" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield78" type="text" id="textfield79" value="0" size="10" maxlength="10" />
              </div></td>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td><div align="center">
                <input name="textfield72" type="text" id="textfield73" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield77" type="text" id="textfield78" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield78" type="text" id="textfield79" value="0" size="10" maxlength="10" />
              </div></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><div align="center">
                <input name="textfield72" type="text" id="textfield73" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield77" type="text" id="textfield78" value="0" size="10" maxlength="10" />
              </div></td>
              <td><div align="center">
                <input name="textfield78" type="text" id="textfield79" value="0" size="10" maxlength="10" />
              </div></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td colspan="6"><table width="463">
                <tr>
                  <td width="227">Distância extra percorrida (Km)</td>
                  <td width="220">Recolha estimada (Kg)</td>
                </tr>
                <tr>
                  <td><input name="textfield89" type="text" id="textfield90" value="0" size="10" maxlength="10" /></td>
                  <td><input name="textfield89" type="text" id="textfield91" value="0" size="10" maxlength="10" /></td>
                </tr>
                <tr>
                  <td>Custo da recolha extra (€/ton)</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><input name="textfield89" type="text" id="textfield92" value="0" size="10" maxlength="10" /></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>Custo dos pontos nos distritos</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><span class="letrap">Escolha a distância calculada:</span></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2"><span class="letrap">Média: Distância percorrida de acordo com a média de reclha de todos os PE</span></td>
                </tr>
                <tr>
                  <td colspan="2"><span class="letrap">Máximo: Distância percorrida caso todos os PEs estivessem cheios</span></td>
                </tr>
                <tr>
                  <td colspan="2"><span class="letrap">Mínimo: Distância percorrida de acordo com as médias de recolha de cada PE</span></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>Distância</td>
                  <td><input name="textfield89" type="text" id="textfield93" value="0" size="10" maxlength="10" />
                    Km</td>
                </tr>
                <tr>
                  <td>(1) Custo total transporte</td>
                  <td><input name="textfield89" type="text" id="textfield94" value="0" size="10" maxlength="10" />
                    €</td>
                </tr>
                <tr>
                  <td>(2) Custo por local</td>
                  <td><input name="textfield89" type="text" id="textfield95" value="0" size="10" maxlength="10" />
                    €</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>Custo de esvaziar um PE</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>Custo anual de um motorista</td>
                  <td><input name="textfield89" type="text" id="textfield96" value="0" size="10" maxlength="10" />
                    €</td>
                </tr>
                <tr>
                  <td>(3) Custo mensal</td>
                  <td><input name="textfield89" type="text" id="textfield97" value="0" size="10" maxlength="10" />
                    €</td>
                </tr>
                <tr>
                  <td>(4) Salário/minuto</td>
                  <td><input name="textfield89" type="text" id="textfield98" value="0" size="10" maxlength="10" />
                    €</td>
                </tr>
                <tr>
                  <td>Tempo de descarga</td>
                  <td><input name="textfield89" type="text" id="textfield99" value="0" size="10" maxlength="10" />
                    min</td>
                </tr>
                <tr>
                  <td>(5) Custo por mês</td>
                  <td><input name="textfield89" type="text" id="textfield100" value="0" size="10" maxlength="10" />
                    €</td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2"><div align="center"><span class="letrap">----------Fórmulas usadas----------</span></div></td>
                </tr>
                <tr>
                  <td colspan="2"><span class="letrap">(1) Distância x Preço por Km</span></td>
                </tr>
                <tr>
                  <td colspan="2"><span class="letrap">(2) Custo total de transporte / Nº de PE + Custo de esvaziar um PE + Custo por mês</span></td>
                </tr>
                <tr>
                  <td colspan="2"><span class="letrap">(3) Custo anual de um motorista / 12</span></td>
                </tr>
                <tr>
                  <td colspan="2"><span class="letrap">(4) Custo mensal (20*80*60)</span></td>
                </tr>
                <tr>
                  <td colspan="2"><span class="letrap">(5) Salário / minuto x Tempo de descarga (min)</span></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
            </tr>
          </table>
          <p>&nbsp;</p>
          <p>TESTE</p>
          <div class="TabbedPanelsContent">
            <table width="723" class="tabela">
              <tr>
                <td width="231">Estimativa Km/ano/viatura</td>
                <td width="476"><input name="textfield3" type="text" id="textfield17" value="84000" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td>Dias úteis de trabalho anual</td>
                <td><input name="textfield4" type="text" id="textfield3" value="215" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td>Horas normais de trabalho anual</td>
                <td><input name="textfield5" type="text" id="textfield4" value="1720" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td>Horas normais de trabalho diárias</td>
                <td><input name="textfield6" type="text" id="textfield5" value="8" size="15" maxlength="22" /> 
                  <span class="letrap">(Horas normais de trabalho anual <strong>/</strong>Dias úteis de trabalho anual)</span></td>
              </tr>
              <tr>
                <td>Hora almoço</td>
                <td><input name="textfield7" type="text" id="textfield6" value="1" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td>Horas em deslocações diárias</td>
                <td><input name="textfield8" type="text" id="textfield7" value="7" size="15" maxlength="22" /></td>
              </tr>
              <tr>
                <td>Horas em deslocações anuais</td>
                <td><input name="textfield9" type="text" id="textfield8" value="1505" size="15" maxlength="22" /> 
                  <span class="letrap">(Dias úteis de trabalho anual <strong>x</strong> Horas em deslocações diárias)</span></td>
              </tr>
              <tr>
                <td>Velocidade média (km/h)</td>
                <td><input name="textfield10" type="text" id="textfield9" value="55" size="15" maxlength="22" /> 
                  <span class="letrap">(Estimativa Km/ano/viatura<strong> / </strong>Horas de deslocações anuais)</span></td>
              </tr>
            </table>
          </div>
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
