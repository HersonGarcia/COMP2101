function myfunc {
    [cmdletbinding()]
    param ($path)

    write-verbose "The path variable contains '$path'"
    write-error "something is wrong"
}

myfunc 
#-debug will give a programmer more infor
#write-debug
#-verbose will give a user more information
#write-error "something is wrong" 