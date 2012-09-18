{{ php }}

header('Content-type: application/json');

$path_to_theme = "themes/publication_2/theme_1/";

$folders = array("_css","_js","_css/webfonts","_img");

$data = array();
$data["files"] = array();



foreach ($folders as $folder)
{
	$files = glob($path_to_theme.$folder."/*.*");
	foreach ($files as $file)
	{
		$dfile = array();
		$dfile["url"] = "/".$file;
		$dfile["time"] = filemtime($file);
		$data["files"][] = $dfile;
	}
}

$json = json_encode($data);

$json = str_replace('\\','',$json);

echo $json; 

{{ /php }}