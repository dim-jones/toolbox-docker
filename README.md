# A toolbox 
The goal of this toolbox is to provide a set of tools to help you in your daily work. These tools are designed to be used in a terminal. Some of them are used for network analysis, others for file manipulation, and so on.

## Description 
Based on the small alpine Linux distribution, this toolbox embeds these tools:
- **bash** : to improve the UI of the terminal with the better completion and history management.
- **curl** : you can do whatever you want as request with this tool. It's more powerful than you can image, and obviously must have.
- **wget** : another tool to download files from the web. It's less powerful than curl, but easier to use.
- **vim** : the best text editor ever. It could be possible to add specific configuration to improve the user experience and to have your powerful editor everywhere.
- **nano** : a simple text editor. It's easier to use than vim but less powerful.
- **htop** : to monitor the system. 
- **tcpdump** : to capture network packets. It's a must-have for network analysis.
- **nmap** : to scan the network. It's also a must-have for network analysis.
- **git** : to manage your code, clone, push, pull, etc. You can add your own configuration to use it with your own git account.
- **jq** : to parse json files. It's a must-have for json analysis.
- **netcat** : to send and receive data over the network and a lot of other features.
- **bind-tools** : to use dig, nslookup, etc. 
- **traceroute** : to trace the route of a packet.

## How to use it
### curl 
```
docker run --rm -it dimjones/toolbox curl https://www.google.com
```

### wget
For example, to down a file from the web in the host machine : 
```
docker run --rm -it -v "$(pwd):/tmp" dimjones/toolbox wget -P /tmp https://www.google.com
```

Downloading a file with verbose mode :
```
docker run --rm -it -v "$(pwd):/tmp" dimjones/toolbox wget -P /tmp -v https://www.google.com
```

### vim
Edit a file in the host machine (Linux and also Windows and Mac) with vim :
 ``` 
docker run -it --rm -v "${PWD}:/tmp" dimjones/toolbox vim /tmp/tmpfile.txt
```

### nano
Edit a file in the host machine with nano :
```
docker run --rm -it -v "$(pwd):/tmp" dimjones/toolbox nano /tmp/yourfile
```

### htop
```
docker run --rm -it --pid=host dimjones/toolbox htop
```

### tcpdump
The tcpdump command is very powerful and can be used in many ways. Here is an example to capture all the packets on the network interface eth0 and to write the output in a file:
``` 
docker run --rm -it --net=host dimjones/toolbox tcpdump -i eth0 -w /tmp/capture.pcap
```
Notice that you will need to use the `--net=host` option to capture the packets on the host network interface.

### nmap
Nmap could be used in different ways. Here are some examples to scan the network and to find the active hosts :
```
docker run --rm -it --net=host dimjones/toolbox nmap 192.168.1.0/24
docker run --rm -it --net=host dimjones/toolbox nmap -F IP
docker run --rm -it --net=host dimjones/toolbox nmap -O IP
```

### git
Use git with your own configuration (get in mind to copy the .gitconfig file in your container during the build process) :
``` 
docker run --rm -it -v ~/.gitconfig:/root/.gitconfig dimjones/toolbox git clone
```

### jq
Use jq to parse a json file :
```
docker run -it --rm -v "$(pwd)/file.json:/tmp/file.json" dimjones/toolbox jq . /tmp/file.json
```

### netcat
Netcat could be used in many different ways. Here is an example to check a specific port is opened :
```
docker run -it --rm dimjones/toolbox nc -zv IP PORT
```

### bind-tools
Use dig to get the IP address of a domain name :
```
docker run --rm -it dimjones/toolbox dig www.google.com
```

### traceroute
Use traceroute to trace the route of a packet :
```
docker run --rm -it dimjones/toolbox traceroute www.google.com
```
## The antivirus version
The antivirus version  embeds the ClamAV antivirus to scan files. It's a good way to scan files without installing the antivirus on your machine. 
```
docker run -it --rm -v "$(pwd):/toscan" dimjones/toolbox:antivirus bash
89e3b57cdd08:/# freshclam
89e3b57cdd08:/# clamscan -r /toscan
```

### Licence
This toolbox is under the MIT licence. You can use it as you want. If you want to improve it, feel free to do it and to share it with the community. 

### source code
https://gitlab.com/dim-jones/toolbox-docker

