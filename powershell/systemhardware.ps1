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