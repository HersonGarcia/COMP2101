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