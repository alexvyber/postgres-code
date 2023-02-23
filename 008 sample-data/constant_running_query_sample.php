<?php
error_reporting(E_ALL);
ini_set('display_errors', 0);

error_reporting(0);

set_time_limit(0);

$dbhost 	= 'localhost';            
$dbusername = 'postgres';             
$dbpassword = 'welcome';              
$dbname 	= 'hr';

global $link, $dbtype, $dbhost, $dbusername, $dbpassword, $dbname;
		
$link = pg_connect("host=$dbhost port=5432 dbname=$dbname user=$dbusername password=$dbpassword") or die ("Could not connect to server\n");

$loop_number = 1000;

for ($i=0; $i < $loop_number; $i++)
{
	$q ="SELECT * FROM employees";	

	$qlist = pg_query($link, $q);										
	$numrows = pg_num_rows($qlist);
	if ($numrows > 0) 
	{
		while ($data=pg_fetch_array($qlist))	
		{
			echo "Employee Name : ".$data['first_name']. " , ".$data['last_name']."\n";
		}	
	}		
	echo "Sleeping..".$i." \n";
	sleep(5);
}

pg_close($link);

?>