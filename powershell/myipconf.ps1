#Lab 3 Powershell Data

get-ciminstance win32_networkadapterconfiguration -filter ipenabled=true | 
Select-object description, 
              index, 
              ipaddress,
              @{n="submask";e={$_.ipsubnet}},
              dnsdomain,
              servicename |
format-table