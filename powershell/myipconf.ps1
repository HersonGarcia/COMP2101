#Lab 3 Powershell Data

get-ciminstance win32_networkadapterconfiguration -filter ipenabled=true | 
Select-object Description, 
              Index, 
              Ipaddress,
              @{n="Submask";e={$_.ipsubnet}},
              dnsdomain,
              Servicename |
format-table