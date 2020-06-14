# Required items for installation of WSL for your Windows System:

- Access keys for your admin AIM user or ROOT
- Windows Terminal from Microsoft Store ( [windows terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab) )
  then pin it to the taskbar for easy access (will come in handy later)
- CentOS 7 WSL file ( [File Link](https://github.com/yuk7/CentWSL/releases/download/7.0.1907.3/CentOS7.zip) )
- Windows 10 version 1909 or higher ( [Guide](https://www.howtogeek.com/236195/how-to-find-out-which-build-and-version-of-windows-10-you-have/) )

# Installation:

1. First enable WSL feature on your machine, Search for PowerShell and run it as Administrator, then past this command
   `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
   and click enter to run the command and then restart your machine.

2. After restarting your machinve move the CentOS7.zip file to one of your Drives ( C:/ or D:/ Which ever one that has space), then create folder CentOS7 and extract files of CentOS7.zip into CentOS7 folder.

3. Go inside CentOS7 folder, then run file CentOS7.exe, when it is finished you can click enter to exit the program, Congratulations you have CentOS7 installed.

4. Launch your Windows Terminal Program and Click on the Downward Arrow right next to Plus icon and select CentOS7 and now you are inside CentOS terminal.

5. type `cd` command to get to your root home directory

6. Now you need to install wget ( `yum install wget -y` ) and then you can use `code` command to open files from your terminal into VSCod, for that type ( `code test.txt` ) that should install vscode then create and then open test.txt file in VSCode.

7. Now what is left to install AWS CLI, Python to install cfn-lint, and Ruby to install cfn-nag.
