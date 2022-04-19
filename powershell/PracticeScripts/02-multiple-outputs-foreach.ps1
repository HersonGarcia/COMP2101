$totalcapacity = 0 

Get-WmiObject -class win32_physicalmemory |
    foreach {
    new-object -Typename psobject -Property @{
        Description = $_.description
        Manufacturer = $_.manufacturer
        "Speed (MHz)" =$_.speed
        "Size(MB)" = $_.capacity/1mb
        Bank = $_.banklabel
        Slot = $_.devicelocator
        }
        $totalcapacity += $_.capacity/1mb
    } |
    format-table -auto description, 
                       Manufacturer,
                       "Size(MB)",
                       "Speed(MHz)", 
                       Bank,                   
                       Slot

    "Total RAM: ${totalcapacity}MB "
                  