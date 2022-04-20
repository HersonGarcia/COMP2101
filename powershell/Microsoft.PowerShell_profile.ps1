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

#Lab 4 - Loops WMI/CIM

##SYSTEM HARDWARE INFO##
function systemhardware {
"System Hardware:"
$syshardware = gwmi -class win32_computersystem |
   foreach {                                
    new-object -Typename psobject -Property @{
        Model = $_.Model
        Name = $_.Name
        Manufacturer = $_.Manufacturer
        TotalPhysicalMemory = $_.TotalPhysicalMemory
        }
    }   |
    format-list
    $syshardware
    }
    systemhardware
                        
##OPERATING SYSTEM INFO##
function operatingsystem {
"Operating System Info:"
$operatingsys = gwmi -class win32_operatingsystem |
   foreach {
    new-object -Typename psobject -Property @{
        "Operating System" = $_.caption
        Version = $_.version
        }
  }     | 
  format-list     
  $operatingsys 
  }
  operatingsystem
                  
##PROCESSOR INFO##
Function processor {
"Processor Info:"
$processor = gwmi -class win32_processor |
    foreach {                                         
    new-object -Typename psobject -Property @{
        Description = $_.Description
        Speed = $_.MaxclockSpeed
        "Number of cores" = $_.NumberofCores
        L2CacheSize = $_.L2CacheSize                                                                              
        L3CacheSize = $_.L3CacheSize
        }
    } 
$processor
    }
    processor 
            
## PHYSICAL MEMORY ##
function physicalmemory {
"Physical Memory Info:"
$totalcapacity = 0 
$phymemory = gwmi -class win32_physicalmemory |                                    
    foreach {
    new-object -Typename psobject -Property @{
        Description = $_.description
        Vendor = $_.manufacturer
        "Size(MB)" = $_.capacity/1mb
        Bank = $_.banklabel
        Slot = $_.devicelocator
        }
        $totalcapacity += $_.capacity/1mb
  " "
        "Total RAM: ${totalcapacity}MB "
    } |
    format-table -auto Vendor,
                       description,
                       "Size(MB)", 
                       Bank,                   
                       Slot
$phymemory 
    }
    physicalmemory
                                        
## DISK DRIVES INFORMATION ## 
 function diskinfo {
 "Disk Drive Info:"
 $diskdrives = Get-CimInstance cim_diskdrive
 $2logicaldisks = Get-CimInstance CIM_logicaldisk
 foreach ($disk in $diskdrives) {
        $partitions = $disk| Get-CimAssociatedInstance -ResultClassName cim_diskpartition
        foreach ($partition in $partitions) {
            $logicaldisks = $partition | get-cimassociatedinstance -resultclassname CIM_logicaldisk
            foreach ($logicaldisk in $logicaldisks) {
                new-object -typename psobject -property @{Manufacturer=$diskdrives.Manufacturer
                                                          Model=$diskdrives.Model
                                                          "Size(GB)"=$diskdrives.size / 1gb -as [int]
                                                          DiskDrives=$diskdrives.DeviceID
                                                          Partitions=$diskdrives.Partitions
                                                          "Logical Disks"=$2logicaldisks.DeviceID
                                                          "SizeLogicalDisks(GB)"=$logicaldisks.size / 1gb -as [int]
                                                          Freespace=$logicaldisks.FreeSpace
                                                          } |
    format-table -auto Manufacturer,
                       Model,
                       "Size(GB)",
                       DiskDrives,
                       Partitions,
                       "Logical Disks",
                       "SizeLogicalDisks(GB)",
                       Freespace 
                                                }
                                        }
                                 } 
                      }                
                      diskinfo
                                 
## LAB 3 REPORT ##
"Network Adapter Configuration:"
myipconf                                                                            
                    
                                                                                         
## VIDEO CARD INFO ##
function videocard {
"Video Card Info:"
$videocard = gwmi -class win32_videocontroller |                        
     foreach {                                         
    new-object -Typename psobject -Property @{Vendor = $_.VideoProcessor
                                              Description = $_.Description
                                              Horizontalpixels = $_.CurrentHorizontalResolution
                                              Verticalpixels= $_.CurrentVerticalResolution
                                              } |
                                       Format-list
                                                           
             } 
             
$videocard
}
videocard

#functions
systemhardware








