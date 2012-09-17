{{ php }}

header('Content-type: application/json');

$path_to_theme = "./themes/publication_2/theme_1/";

$folders = array("_css","_js","_css/webfonts");

$data = array();
$data["files"] = array();



foreach ($folders as $folder)
{
	$files = scandir($path_to_theme.$folder);
	foreach ($files as $file)
	{
		if ($file=="." || $file==".." || $file=="webfonts") continue;
		$dfile = array();
		$dfile["url"] = "/".$path_to_theme.$folder."/".$file;
		$dfile["time"] = filemtime($path_to_theme.$folder."/".$file);
		$data["files"][] = $dfile;
	}
}

$json = json_encode($data);

$json = str_replace('\\','',$json);

echo $json; 

{{ /php }}