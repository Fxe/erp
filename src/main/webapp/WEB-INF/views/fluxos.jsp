<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Untitled Document</title>
<script src="<s:url value='/resources/SpryAssets/SpryMenuBar.js' />" type="text/javascript"></script>
<link href="<s:url value='/resources/SpryAssets/SpryMenuBarHorizontal.css' />" rel="stylesheet" type="text/css" />
<style type="text/css">
.botao {
	float: right;
	margin-right: 30%;
}
.bottom {
}
</style>
</head>
<div class="fundo">
  <ul id="MenuBar1" class="MenuBarHorizontal">
        <li><a href="#">Info</a>        </li>
        <li><a href="${pageContext.servletContext.contextPath}/edit/">Editar</a></li>
        <li><a href="${pageContext.servletContext.contextPath}/main/">VRP</a></li>
        <li><a href="${pageContext.servletContext.contextPath}/flux/">Fluxos</a></li>
  </ul>
  <br />
</div>
<div class="fundo">
  <div>
    <form id="form1" name="form1" method="post" action="">
      <table width="939" class="tabela">
        <tr>
          <td colspan="3">Nome
  <input name="textfield12" type="text" id="textfield12" size="70" maxlength="70" /></td>
        </tr>
        <tr>
          <td width="341"><label for="textfield12">Morada</label>
          <input name="textfield13" type="text" id="textfield12" size="38" maxlength="100" /></td>
          <td width="237"><label for="textfield17">Distrito</label>
             <input name="textfield17" type="text" id="textfield17" size="15" maxlength="22" /></td>
          <td width="345"><input type="submit" name="button4" id="button4" value="Verificar Morada" />
            <label for="textfield23">Lat:</label>
            <input name="textfield21" type="text" id="textfield23" value="0.0" size="5" maxlength="5" readonly="readonly" />
            <label for="textfield24">Long:</label>
          <input name="textfield21" type="text" id="textfield24" value="0.0" size="5" maxlength="5" readonly="readonly" /></td>
        </tr>
        <tr>
          <td><label for="textfield13">Código Postal</label>
            <input name="textfield14" type="text" id="textfield13" size="8" maxlength="8" />
          <label>
            <input type="checkbox" name="CheckboxGroup1_2" value="checkbox" id="CheckboxGroup1_2" />
            <span class="letrap">Ilha</span></label>
          <input type="checkbox" name="CheckboxGroup1_2" value="checkbox" id="CheckboxGroup1_3" />
          <label><span class="letrap">Inactivo</span></label>
          <span class="letrap">
          <label></label>
          </span></td>
          <td><label for="textfield18">Concelho</label>
            <input name="textfield18" type="text" id="textfield18" size="12" maxlength="20" /></td>
          <td><input type="submit" name="button5" id="button5" value="Salvar Ponto" />
... </td>
        </tr>
        <tr>
          <td><label for="textfield15">Obsr:</label>
          <input name="textfield15" type="text" id="textfield15" size="40" maxlength="140" /></td>
          <td><label for="textfield19">Data de Contrato</label>
            <input name="textfield19" type="text" id="textfield19" value="DD.MM.AAAA" size="10" maxlength="10" /></td>
          <td><input type="submit" name="button6" id="button6" value="Actualiza Rotas" />
Erro:</td>
        </tr>
        <tr>
          <td><label for="textfield16">Nº PE</label>
          <input name="textfield16" type="text" id="textfield16" size="5" maxlength="5" /></td>
          <td><label for="textfield20">Nº PE Lâmpadas</label>
            <input name="textfield20" type="text" id="textfield20" size="5" maxlength="5" /></td>
          <td>&nbsp;</td>
        </tr>
  </table></form></div>
  <div id="bottom">
    <p><img src="MAPA.png" width="1000" height="556" class="bottom" /></p>
  </div>
</div>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
</body>
</html>