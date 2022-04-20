                    "__________________________________________"
##SYSTEM HARDWARE INFO##
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
                    "__________________________________________"
##OPERATING SYSTEM INFO
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
                    "__________________________________________"
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
                    "__________________________________________"
##PHYSICAL MEMORY
function physmem {
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
                    "__________________________________________"
##DISK DRIVES INFORMATION## 
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



                    "__________________________________________"                                  
## LAB 3 REPORT ##
"Network Adapter Configuration:"
myipconf                                                                            
                    
                    "__________________________________________"                                                                     
## VIDEO CARD INFO ##
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
