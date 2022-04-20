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