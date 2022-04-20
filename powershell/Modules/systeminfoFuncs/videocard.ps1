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