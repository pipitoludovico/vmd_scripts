package require psfgen

topology /home/pipitoludovico/4_MD_utilities/toppar_c36_jul20/top_all36_cgenff.rtf
topology /home/pipitoludovico/4_MD_utilities/toppar_c36_jul20/top_all36_prot.rtf
topology /home/pipitoludovico/4_MD_utilities/toppar_c36_jul20/top_all36_carb.rtf
#topology GCA.top

segment A {
pdb com.pdb
}

coordpdb com.pdb A


regenerate angles dihedrals

guesscoord

writepsf com.psf
writepdb com_w.pdb
exit
