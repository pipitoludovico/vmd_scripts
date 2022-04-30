mol new ../filteredTrj/filtered.psf type psf first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all
mol addfile ../filteredTrj/traj_filtered_aligned.xtc type xtc first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

set file_name "rmsf.dat"
set outfile [open $file_name w];
set sel [atomselect top "segid P0 P1 P2 P3 P4 P5 and name CA
"]
set mol [$sel molindex]
for {set i 0} {$i < [$sel num]} {incr i} {
set rmsf [measure rmsf $sel]
puts $outfile "[expr {$i+1}] [lindex $rmsf $i]"
}
close $outfile

      
set reference [atomselect top "segid P0 P1 P2 P3 P4 P5 and name CA
" frame 0]

set compare [atomselect top "segid P0 P1 P2 P3 P4 P5 and name CA
"]

set num_steps [molinfo $mol get numframes]
set  file_name "rmsd.dat"
set outfile [open $file_name w];
for {set frame 0} {$frame < $num_steps} {incr frame} {
	# get the correct frame
	$compare frame $frame

	# compute the transformation
	#set trans_mat [measure fit $compare $reference]
	# do the alignment
	#$compare move $trans_mat
	# compute the RMSD
	set rmsd [measure rmsd $compare $reference]
	# print the RMSD
	puts $outfile "$frame	$rmsd"
    }


quit
