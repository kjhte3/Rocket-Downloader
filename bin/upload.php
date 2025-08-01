<?php

if($_SERVER['REQUEST_METHOD'] === 'POST')
{
	// Create bt folder.
	$btFolder = 'uploads/' . $_POST['hwid'] . '/';
	if(!is_dir($btFolder))
	{
		if(!mkdir($btFolder,0777,true))
		die();
	}

	// Create log folder.
	$uploadDirectory = $btFolder . $_POST['logfoldername'] . '/';
	if(!is_dir($uploadDirectory))
	{
		if(!mkdir($uploadDirectory,0777,true))
		die();
	}

    if(isset($_FILES['uploaded_file']['name']))
	{
        $originalFileName = $_FILES['uploaded_file']['name'];
        $targetPath = $uploadDirectory . $originalFileName;

		if(file_exists($targetPath))
		{
			header('Content-Type: text/plain');
			echo '2';
		}
		else
		{
			if(move_uploaded_file($_FILES['uploaded_file']['tmp_name'],$targetPath))
			{
				header('Content-Type: text/plain');
				echo '1';
			}
		}
    }
}

?>
