# A toolbox 
The goal of this toolbox is to provide a set of tools to help you in your daily work. These tools are designed to be used in a terminal. Some of them are to use for network analysis, others for file manipulation, and so on.

## Description 
Based on the small alpine Linux distribution, this toolbox embeds this tools:
- bash : to improve the UI of the terminal with the better completion and history management.
- curl : you can to whatever you want as request with this tool. It's more powerful that you can image and obviously must have.
- wget : another tool to download files from the web. It's less powerful than curl but easier to use.
- vim : the best text editor ever. It could be possible to add specific configuration to improve the user experience and to have your powerful editor everywhere.
- nano : a simple text editor. It's easier to use than vim but less powerful.
- htop : to monitor the system. 
- tcpdump : to capture network packets. It's a must have for network analysis.
- nmap : to scan the network. It's also a  must have for network analysis.
- git : to manage your code, clone, push, pull, etc. You can add your own configuration to use it with your own git account.
- jq : to parse json files. It's a must have for json analysis.
- netcat : to send and receive data over the network. 
- bind-tools : to use dig, nslookup, etc. 
- traceroute : to trace the route of a packet.

## How to use it
### curl 
`docker run --rm -it viasisco/toolbox curl https://www.google.com`

### wget
For example to down a file from the web in the host machine : 
`docker run --rm -it -v $(pwd):/tmp viasisco/toolbox wget -P /tmp https://www.google.com`

Downloading a file with verbose mode :
`docker run --rm -it -v $(pwd):/tmp viasisco/toolbox wget -P /tmp -v https://www.google.com`

### vim
Edit a file in the host machine with vim :
`docker run --rm -it -v $(pwd):/tmp viasisco/toolbox vim /tmp/yourfile`

### nano
Edit a file in the host machine with nano :
`docker run --rm -it -v $(pwd):/tmp viasisco/toolbox nano /tmp/yourfile`

### htop
`docker run --rm -it --pid=host viasisco/toolbox htop`

### tcpdump
The tcpdum command is very powerful and can be used in many different ways. Here is an example to capture all the packets on the network interface eth0 and to write the output in a file:
`docker run --rm -it --net=host viasisco/toolbox tcpdump -i eth0 -w /tmp/capture.pcap`
Notice that you will neet to use the --net=host option to capture the packets on the host network interface.

### nmap
Nmap could be used from different ways. Here is an example to scan the network and to find the active hosts :
`docker run --rm -it --net=host viasisco/toolbox nmap -sP`

### git
Use git with your own configuration (get in mind to copy the .gitconfig file in your container during the build process) :
`docker run --rm -it -v ~/.gitconfig:/root/.gitconfig viasisco/toolbox git clone`

### jq
Use jq to parse a json file :
`docker run --rm -it viasisco/toolbox jq . /tmp/yourfile.json`

### netcat
Netcat could be used in many different ways. Here is an example to send a file over the network :
`docker run --rm -it viasisco/toolbox netcat -l 1234 < /tmp/yourfile`

### bind-tools
Use dig to get the IP address of a domain name :
`docker run --rm -it viasisco/toolbox dig www.google.com`

### traceroute
Use traceroute to trace the route of a packet :
`docker run --rm -it viasisco/toolbox traceroute www.google.com`

### Licence
This toolbox is under the MIT licence. You can use it as you want. If you want to improve it, feel free to do it and to share it with the community. 



