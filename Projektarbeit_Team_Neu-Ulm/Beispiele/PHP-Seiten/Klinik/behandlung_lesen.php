<html>	
<head>	
	<?php include'menu.php'?>
</head>
<body>
<div id="scroller">
<div id="content">
		<h1>Behandlung betrachten</h1>
		<p>Suchen �ber folgenden Parameter</p>
		<table>
		<form name="ansehen_form" method="GET" action="view_treatment.php">
			<tr>
				<td>Name des Tieres</td>
				<td><input type ="text" length ="20" name="Name"></td>
			</tr>
			<tr>
				<td>Tier-ID</td>
				<td><input type ="text" length ="20" name="ID"></td>
			</tr>
			<tr>
				<td></td>
				<td align=right><input type ="submit" value="Suchen"></td>
			</tr>
		</table>
		
</div>
</div>
</body>
</html>