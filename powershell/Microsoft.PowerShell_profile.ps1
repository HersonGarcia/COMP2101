$env:path = "$env:path;c:/users/Herson/documents/github/comp2101/powershell"
new-item -path alias:np -value notepad | out-null
function welcome {
"Welcome to scripting!"
}
welcome
write-output "_____________________________________________"
write-output "CPU Information"

function model {
(get-ciminstance cim_processor).manufacturer
}

function manuf {
(get-ciminstance cim_processor).name
}

function curspeed {
(get-ciminstance cim_processor).currentclockspeed
}

function max {
(get-ciminstance cim_processor).maxclockspeed
}

function cores {
(get-ciminstance cim_processor).numberofcores
}

function get-cpuinfo {
write-output "Model : "
model
write-output "-------------------------"
write-output "Manufacturer : "
manuf
write-output "-------------------------"
write-output "Current speed : "
curspeed
write-output "-------------------------"
write-output "Maximum Speed : " 
max
write-output "-------------------------"
write-output "Number of Cores : "
cores
}
get-cpuinfo

# disk information
write-output "_____________________________________________"
write-output "Disk Information"

function disks {
(get-disk).disknumber
}

function model1 {
(get-disk).model
}

function sernum {
(get-disk).serialnumber
} 


function size1 {
(get-disk).size
}

function get-mydisks {
write-output "Number of Disk Drives : "
disks
write-output "-------------------------"
write-output "Model : "
model1
write-output "-------------------------"
write-output "Serial Number : " 
sernum
write-output "-------------------------"
write-output "Size : "
size1
}
get-mydisks

# Lab 3 Powershell Data
#run command: myipconf

get-ciminstance win32_networkadapterconfiguration -filter ipenabled=true | 
Select-object description, 
              index, 
              ipaddress,
              @{n="submask";e={$_.ipsubnet}},
              dnsdomain,
              servicename |
format-table


