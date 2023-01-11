<p align="center"><img src="/docs/fastmap_icon.png" align="middle" alt="fastmap" /></p>

Fastmap is an efficient tool for linux made for network admins and analysts. It combines the power of nmap, tcpdump, snort and much more.

ANNOUNCEMENT: Due to some technical issues I have had to re-upload and remake this repository. The version history is gone but the current version is functional. Create an issue if there's any bugs. Thanks!

NOTE: Some code is going through refactoring hence some modules may/may not work. Create an issue if there are any problems and I shall get back to you as soon as I can.

# ADDED [`zmap`](https://github.com/FluffySnowman/fastmap/wiki/Usage#zmap) MODULE. CHECK WIKI FOR THE USAGE | GUI SUPPORT (GTK+). USE THE `GUI` COMMAND TO USE THE GUI FASTMAP INTERFACE. Working on: `mscn` (masscan) module.

### Check out the [wiki](https://github.com/FluffySnowman/fastmap/wiki) for a more detailed documentation.

# Installation with `git`

```bash
git clone https://github.com/FluffySnowman/fastmap.git
cd fastmap

#Installation

bash RUN.sh
```

# Installation through `wget`

Go to the [releases page](https://github.com/FluffySnowman/fastmap/releases) and download the latest version using the Download button or by running the following command:

For this example I will use the first release link. Replace the version number and alpha/beta with the release you choose download

```bash
wget https://github.com/FluffySnowman/fastmap/archive/refs/tags/fastmap-v0.9.5-alpha.zip
unzip fastmap-fastmap-v0.9-alpha.zip
cd https://github.com/FluffySnowman/fastmap/archive/refs/tags/fastmap-v0.9.5-alpha.zip



bash RUN.sh
```

<br>
<hr>
<br>

TO RUN THE `GP` (GRPAHICAL PINGING MODULE) YOU WILL HAVE TO INSTALL `gping` MANUALLY.

Either go to the site of gping and install it by following the steps [gping site](https://github.com/orf/gping)

Or for debian follow these instructions.

```bash
chmod +x gping_install.sh

./gping_install.sh
```

<br>

To use the `rustscan` moduel you will have to [install RustScan](https://github.com/RustScan/RustScan).

<br>

A python pip3 installation is required for the `pymap` module.

```
python3 -m pip install -r req.txt
```

You must have these libraries installed.

```
figlet curl jq lolcat nmap sudo tcpdump traceroute host mtr tmux aircrack-ng vnstat vnstati randtype speedtest-cli bash zenity libnotify-bin libpcap-dev bison flex snort zmap masscan
```

Install these with your prefered package manager for your linux distribution (apt, pacman, yum, dnf etc.).

Example- for debian distributions, the installation would look like this: 

```
xargs sudo apt-get install -y < requirements.txt
```

OR you could install it using the program `install.sh`. To run the install: `bash install.sh` OR `chmod +x install.sh && ./install.sh`.

To update, use the file `update.sh` by running the command `bash update.sh`

<hr>

# BINMAP INSTALLATION IS BROKEN. DO NOT USE

If you wish to install this program globally then you will have to change the mode and move it to your binaries folder (`/usr/bin`). To do this follow these steps-

```bash
git clone https://github.com/FluffySnowman/fastmap.git && cd fastmap/binmap && bash install.sh && chmod +x fastmap.sh && sudo cp * /usr/bin/
```

If you get an error related to the `docs` folder do not be alarmed. The `docs` folder has no important files related to the runtime of the program. Just images for the `README.md` file.

If you wish to install this program in the folder and keep it in `/usr/bin` too then you can run `bin_install.sh`.

```bash
bash bin_install.sh
```

# Running


https://user-images.githubusercontent.com/51316255/184296399-12e792f6-ce62-49c5-b8b2-5fc21bd1dd71.mp4



To run fastmap, use `bash` as a terminal and interpretrer for the shell script as fastmap is not stable or compatible with other shells such as `zsh`, `fish`, `ash`, `sh`.

The file that controls everything in fastmap is `fastmap.sh` however, I recently added a `RUN.sh` file which updates fastmap to the latest version when run and automatically executes the `fastmap.sh` file

```bash
bash RUN.sh

#OR IF YOU HAVE THE PACKAGES ALREADY INSTALLED AND UPDATED

bash fastmap.sh
```

# Usage

This command line application is very versatile and can run `x` amount of times depending on your requirements.
The first variable you will have to enter to start the program will be "i". This is the value of a number below 100 to which the program will loop and the value of "i" will increment till it reaches 100 after which the program will terminate.

This is what it should look like:

![i](/docs/i.png)

This will cause the program to loop from 80-100 (20 times). This value can be changed according to your needs but DO NOT go above 100.
Every time you return a commnand, the value of "i" will increment hence causing the application to terminate after the limit is reached.

# All Commands and Usage

`>>> help`: Displays help list

`>>> banner`: Prints the banner (fastmap) in a random figlet font

`>>> ping`: Opens ping modue

To use this module, follow the exmaple given below:

![pingexample](/docs/ping_example.png)

`>>> gp`: Pings specified host(s) in graphical cli format.

![gping_command](/docs/gping_0x1.png)
![gping_graph](/docs/gping_0x2.png)

`>>> fapi`: Opens Fing API calling module

To use this module you must configure your Fing API on your computer or any device on the network. Enter the Fing API url with key after the `?` as shown on the Fing app's local API page. Simple enter the Fing API url and follow the steps.

Next you will have an option to display all the raw `.json` data. ONLY enter `y` or `n` as the program does not have data verification in place at the moment.
If you do not wish to display the raw data enter `n` to the console and press enter. This will give you an option to parse the json data with jq.

jq is a command line json data parser. You can find the syntax manual/documentation for it [here](https://stedolan.github.io/jq/manual/)

`>>> netmap`: Opens netmap modue (extension of nmap tool)

Follow the steps: enter the IP you wish to scan and press enter. Then you will get an option to select the type of scan you wish to perform. 
There are multiple types of scans you can perform ranging from ARP scans to port scans.

Example:

![lpscan](/docs/lpscan.png)

The `lp` scan lists all the open ports with a count so that you don't need to go through all the salad of text that nmap throws into the terminal. 
Of course there is an option to do a normal port scan with triple verbosity as shown in the screenshot `port`. Simple type in the scan you wish to perform and the program will do the rest.

`>>> tpackets`: Opens tcp packet capturing module

To use this module, you will need to input the interface name that you want to capture packets on. After which the process will start. When you think you have captured enough packets, press cntl+c and they will be printed into the console. Alternatively you could press cntl+c and ignore the text in the console and open wireshark and read the packets manually from the `packets.pcap` file.

`>>> trace`: Traces the route of packets to a specified host (default 30 hops).

`>>> nsl`: Lookups nameservers of specified host.
![nslpic](/docs/nsl.png)

`>>> ss`: Shows all running ss process on LO and Network

`>>> gtrace`: Traces the route of packets to a specified host on a GUI (Graphcial User Interface). 

`>>> lhost`: Looks up host just like the nsl command but better :)
![LHOSTLOOKUP](/docs/lhost.png)

`>>> pymap`: Performs ARP scan on the specified network. This module uses python3 and the prerequisites will have to be install manually.

`>>> pyport`: Performs a port scan for the specified host. This module requires python3 and the prerequisites will have to be install manually.

![PyPort](/docs/pyport.png)

`>>> traffic`: Calculates traffic for the specified network interface. You will require vnstat and vnstati to run in the background and the program will collect that data and display it in a graph in the folder of fastmap. It should look like this:

![vnstatcmd](/docs/vnstatcmd.png)

![vnstatpi](/docs/vnstati_pi.png)

`>>> speed`: Runs speedtest-cli to test latency, upload speed and download speed to the nearest server.

`>>> snort`: Runs snort with configured constants set by the user when installing and performs it on the network (Given by the prompt of `gateway/netmask`) and sniffs for malicious traffic and intruisions on the network. 

`>>> zenmap`: Opens zenmap.
