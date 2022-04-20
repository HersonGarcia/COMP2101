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