# PHP-Web-API

first extract this zip in xamp htdocs
then run xam and on browser go to localhost/phpmyadmin
create a new database and click on import button now navigate to file to table.sql file import it and then at bottom click go
after that again go to import and navigate to the same folder import data.sql file
database setup is complete.


you can check api by hitting the url localhost/PHP-Web-API/api.php
you will have to provide 
mandatory parameters like
node_id
language only ['english','italian'];
optional parameter
page_num should be greater than 0
page_size should be greater than 100

you will recieve everything in json.

this api only support GET method any other method will give an error of method not supported
