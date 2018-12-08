set fileName [lindex $argv 0]
catch {set fptr [open $fileName r]} ;
set contents [read -nonewline $fptr] ;#Read the file contents
close $fptr ;#Close the file since it has been read now
set splitCont [split $contents "\n"] ;#Split the files contents on new line
set freq 0 ;
foreach ele $splitCont {
	set freq 
}
