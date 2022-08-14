# Note: Possible issues in all machines: the network interface name is different From what is written in the script (probably "Ethernet 2" instead of "Ethernet")



# DC1 CONFIGURATION  
1. The template should be uploaded to a resource-free group  
2. connect to DC-1 using rdp connection username: azureteadmin password: 432rfsedfr!aaA  
3. Run the script DC1-1.ps1  
4. During the running of the script, the rdp connection will disconnect for a few seconds and automatically reconnect due to a change of IP address  
5. The script will start installing the new domain environment for us  
6. In Safe Mode Administrator Password enter the password: 432rfsedfr!aaA and then choose yes to all  
7. The installation will continue  
8. after tha instellation The server will restart, Wait a few minutes and then reconnect to the server, The initial rise may take some time  
9. after the restarting plant the bulk_users1.csv file on C drive and run the script DC1-2.ps1  
10. choose yes to all  
11. The script will add the requested OU and the requested users including their settings  

# DC2 CONFIGURATION  
1. connect to DC-2 using rdp connection username: azureteadmin password: 432rfsedfr!aaA  
2. Run the script DC-2.ps1  
3. During the running of the script, the rdp connection will disconnect for a few seconds and automatically reconnect due to a change of IP address  
4. The installation will begin  
5. enter the password: 432rfsedfr!aaA  
6. In Safe Mode Administrator Password enter the password: 432rfsedfr!aaA and then choose yes to all  
7. The installation will continue  
8. The server will restart and then come up again as a secondary domain controller  

# WIN1 CONFIGURATION  
1. connect to WIN-1 using rdp connection username: azureteadmin password: 432rfsedfr!aaA  
2. Run the script win-1.ps1  
3. During the running of the script, the rdp connection will disconnect for a few seconds and automatically reconnect due to a change of IP address  
4. Enter a username: azureteadmin and password: 432rfsedfr!aaA  
5. The machine will reboot and when we log back in the machine will be connected to our domain  

# WIN2 CONFIGURATION  
1. connect to WIN-2 using rdp connection username: azureteadmin password: 432rfsedfr!aaA  
2. Run the script win-2.ps1  
3. During the running of the script, the rdp connection will disconnect for a few seconds and automatically reconnect due to a change of IP address  
4. Enter a username: azureteadmin and password: 432rfsedfr!aaA  
5. The machine will reboot and when we log back in the machine will be connected to our domain  
