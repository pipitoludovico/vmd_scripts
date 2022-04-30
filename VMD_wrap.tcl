pbc join res -ref "protein" -molid 0 -now -sel all

pbc unwrap -first now

animate write dcd wrapped.dcd
