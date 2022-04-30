package require psfgen
resetpsf

readpsf protein_autopsf.psf
readpsf ligandrm.psf

coordpdb protein_autopsf.pdb
coordpdb ligandrm.pdb

writepsf all.psf
writepdb all.pdb

puts "merging complete!!!"

quit