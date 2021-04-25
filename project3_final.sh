#!/bin/bash
trap '' 2
while true
do
  clear
  echo "$(date)"
  echo "------------------------------------"
  echo "   Main Menu"
  echo "------------------------------------"
  echo "1. Operating system info"
  echo "2. Hostname and DNS info"
  echo "3. Network info"
  echo "4. Who is online"
  echo "5. Last logged in users"
  echo "6. My IP address"
  echo "7. My disk usage"
  echo "8. My home file-tree"
  echo "9. Process operations"
  echo "10. Exit"
  echo -e "\n"
  echo -e "Enter your choice [1 - 10] \c"
  read answer

  case "$answer" in
    "1")
      echo "--------------------------------------------------"
      echo "System Information"
      echo "--------------------------------------------------"
      echo "Operating system: $(uname)"
      echo "$(lsb_release -a)"
      ;;
    "2")
      echo "--------------------------------------------------"
      echo "Hostname and DNS information"
      echo "--------------------------------------------------"
      echo "Hostname: $(hostname)"
      echo "DNS domain: $(domainname)"
      echo "Fully qualified domain name: $(hostname -f)"
      echo "Network address (IP): $(hostname -i)"
      echo "DNS name servers (DNS IP): $(domainname -i)"
      ;;
    "3")
      echo "--------------------------------------------------"
      echo "Network information"
      echo "--------------------------------------------------"
      echo "Total network interfaces found: $(ls -A /sys/class/net | wc -l)"
      echo "*** IP Addresses Information ***"
      echo   "$(ip addr show)"
      echo "*********************"
      echo "***Network routing***"
      echo "*********************"
      echo "$(route)"
      echo "***********************************"
      echo "***Interface traffic information***"
      echo "***********************************"
      echo "$(netstat -i)"
      ;;
    "4")
    echo "--------------------------------------------------"
    echo "Who is online"
    echo "--------------------------------------------------"
    echo "$(who -H)"
      ;;
    "5")
    echo "--------------------------------------------------"
    echo "List of last logged in users"
    echo "--------------------------------------------------"
      echo "$(lastlog -b 0 -t 100)"
      ;;
    "6")
    echo "--------------------------------------------------"
    echo "Public IP information"
    echo "--------------------------------------------------"
    echo "$(curl -s http://checkip.amazonaws.com)"
      ;;
    "7")
    echo "--------------------------------------------------"
    echo "Disk Usage Info"
    echo "--------------------------------------------------"
    echo "$(df | awk '{print $5,$6}')"
      ;;
    "8")

      homeDIR=$(eval echo ~$USER)
      #echo $homeDIR
      sh ./script2_original.sh $homeDIR filetree.html
      echo "File tree generated!"
      ;;
    "9")
      echo "UNDER CONSTRUCTION"
      ;;
    "10")
      echo "Exiting - Goodbye!"
      exit
      ;;
    *) echo "invalid option $REPLY";;
  esac
  echo -e "Enter return to continue \c"
  read input
done
