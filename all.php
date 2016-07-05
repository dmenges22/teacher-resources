<html>
	<head>
	<title>Locations</title>
	<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
	<meta name="ProgId" content="FrontPage.Editor.Document">
	<meta name="viewport" content="width=device-width"/>\
	</head>

	<body>
		<table border=1>
		<tr><th>Name</th><th>Description</th><th>URL</th><th>Image</th><th>Why Teachers Like It</th><th>Teaching Environment</th><th>Pricing Model</th><th>Rating</th></tr>
		<?php
			include 'db.inc.php';
			$hostName = "localhost:/usr/cis/var/triton.sock";
			$databaseName = "lngo3db";
			$username = "lngo3";
			$password = "Cosc*4h29";
			if (!($connection = @ mysql_connect($hostName, $username,
			  $password))){
			  showerror();
			}
			if (!mysql_select_db($databaseName, $connection)){
			  showerror();
			}
			$query = "SELECT nameOfSite, description, linkToSite, image, altImageURL, comment, teachingEnvironment, pricingModel
			FROM ResourceInfo, SubjectInfo, Rating, TeacherComments, Keyword WHERE resourceInfoID = SubjectInfoID AND ratingID = resourceInfoID AND teacherCommentsID = resourceInfoID";
			if (!($result = @ mysql_query ($query, $connection)))
			showerror();
		
			if(altImageURL = null){
				$usedImage = image;
			}else
				$usedImage = imageURL;
		
			while ($row = @ mysql_fetch_array($result))
			{
				echo "<tr>
				<td>{$row["nameOfSite"]}</td>
				<td>{$row["description"]}</td>
				<td>{$row["linkToSite"]}</td>
				<td>{$row["usedImage"]}</td>
				<td>{$row["comment"]}</td>
				<td>{$row["teachingEnvironment"]}</td>
				<td>{$row["pricingModel"]}</td>
				</tr>";
			}
		?>
		</table>

	</body>
</html>
