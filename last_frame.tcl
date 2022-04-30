mol load psf run_1/structure.psf xtc run_1/postDocking_wrapped.xtc
set final [atomselect top "not (water or ions or resid 1216)" frame last]
set path [file tail [pwd]]
$final writepdb last_frame_$path.pdb
puts "finished!"

quit
