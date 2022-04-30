set sel [atomselect top "all"]
set com [measure center $sel weight mass]
set matrix [transaxis x 90]
$sel moveby [vecscale -1 $com]
$sel move $matrix
$sel moveby $com
$sel writepdb rotated.pdb
