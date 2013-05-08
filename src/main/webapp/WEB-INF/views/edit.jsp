<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<style type="text/css">
.botao {
	float: right;
	margin-right: 30%;
}
.bottom {
}
</style>
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>

<body>
<div>
  <ul id="MenuBar1" class="MenuBarHorizontal">
    <li><a href="#">Info</a></li>
    <li><a href="edit.html">Editar</a></li>
    <li><a href="main.html">VRP</a></li>
    <li><a href="#">Fluxos</a></li>
  </ul>
  <br />
</div>
<div>
  <div>
    <form id="form1" name="form1" method="post" action="">
      <label><br />
        Nome
        <input name="textfield" type="text" id="textfield" size="40" maxlength="40" />
      </label>
      <input type="submit" name="button" id="button" value="Verificar Morada" />
      <label for="textfield2">Lat:</label>
      <input name="textfield2" type="text" id="textfield2" value="0.0" size="5" maxlength="5" readonly="readonly" />
      <label for="textfield3">Long:</label>
      <input name="textfield3" type="text" id="textfield3" value="0.0" size="5" maxlength="5" readonly="readonly" />
      <br />
      <label for="textfield4">Morada</label>
      <input name="textfield4" type="text" id="textfield4" size="38" maxlength="100" />
      <label for="textfield5">Distrito</label>
      <input name="textfield5" type="text" id="textfield5" size="12" maxlength="20" />
      <input type="submit" name="button2" id="button2" value="Salvar Ponto" />
      ... <br />
      <label for="textfield6">Código Postal</label>
      <input name="textfield6" type="text" id="textfield6" size="8" maxlength="8" />
      <label>
        <input type="checkbox" name="CheckboxGroup1" value="checkbox" id="CheckboxGroup1_0" />
        Ilha</label>
      <input type="checkbox" name="CheckboxGroup1_" value="checkbox" id="CheckboxGroup1_1" />
      <label>Inactivo</label>
      <label for="textfield7">Concelho</label>
      <input name="textfield7" type="text" id="textfield7" size="12" maxlength="20" />
      <input type="submit" name="button3" id="button3" value="Actualiza Rotas" />
      Erro:<br />
      <label for="textfield8">Obsr:</label>
      <input name="textfield8" type="text" id="textfield8" size="40" maxlength="140" />
      <label for="textfield9">Data de Contrato</label>
      <input name="textfield9" type="text" id="textfield9" value="DD.MM.AAAA" size="10" maxlength="10" />
      <br />
      <label for="textfield10">Nº PE</label>
      <input name="textfield10" type="text" id="textfield10" size="5" maxlength="5" />
      <label for="textfield11">Nº PE Lâmpadas</label>
      <input name="textfield11" type="text" id="textfield11" size="5" maxlength="5" />
      <br />
    </form>
  </div>
  <div id="bottom">
    <p><img src="MAPA.png" width="1000" height="556" class="bottom" /></p>
  </div>
</div>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
</body>
</html>
