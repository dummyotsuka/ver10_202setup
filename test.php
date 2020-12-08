<?php
    $connection = mysql_connect('localhost', 'root', '') or die('error(connect)');

    mysql_select_db('test', $connection) or die('error(select_db)');
    $data = mysql_query('select * from sampletable', $connection);

    echo '<ul sytle="list-style-type:square";>'."\n";

    while ($row = mysql_fetch_array($data)) {
    echo '<li>'.$row['id'].'.'. $row['name'] .'</li>'."\n";
    }
    echo '</ul>';

    mysql_close($connection);
?>
