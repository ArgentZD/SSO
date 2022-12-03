#! /usr/bin/bash

OS=`cat /etc/os-release`
detect=`rpm -q clamav`
detectU=`clamscan --version`

#Detect linux distribution
if echo "$OS" | grep  "centos"; 
then
    	echo "CentOS detected!"
      
      #Install or uninstall clamav
      if echo  "$detect" | grep -m 1 "package clamav is not installed";
	    then
                echo "INSTALLING CLAMAV"
                sudo yum install clamav -y
        else
            	  echo "REINSTALLING CLAMAV"
                sudo yum remove clamav -y
                sudo yum install clamav -y
        fi
        #Install EPEL repository
	      echo "REPEL INSTALLATION"
        sudo yum -y install epel-release
        yum repo list
        sudo yum --disablerepo="*" --enablerepo="epel" list available
        #Update repos
	      echo "UPDATE"	
        sudo yum update -y

elif echo "$OS" | grep "ubuntu";
then
       echo "Ubuntu detected!"
       #Clamav
       if echo  "$detect2" | grep -m 1 "no such file or directory";
        then
               echo "installing clamav"
                sudo apt-get install clamav -y
        else
                echo "REMOVING CLAMAV"
                sudo apt-get remove clamav clamav-daemon -y
		            sudo apt-get autoremove clamav clamav-daemon -y
		            echo "INSTALLING CLAMAV"
                sudo apt-get install clamav clamav-daemon -y
        fi
			  echo "SYSTEM UPDATE"
			  sudo apt-get update -y
fi
