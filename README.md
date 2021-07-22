# fbiopenup.sh
bash script to be run to detect open tcp ports fopr reverse shells

Necessary factors: 
must have the ability to add files to victim's directory with PUT http request 

replace the victim's ip, ports you want to test and the attacker ip in the appropriate places

Its supposed to return "port $ is open" if its open and "port $ is closed" when it isnt however it is simply stating not found.
I suspect this is from improper error handling and will be worked on in future versions
