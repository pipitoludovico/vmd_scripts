#L. Pipitò
puts "I'm selecting each element of the system..."

set sele1 [atomselect top "all"]
set sele2 [atomselect top "not (protein or water or ion)"]
set sele3 [atomselect top "water"]
set sele4 [atomselect top "ion"]
set sele5 [atomselect top "protein"]

puts "done"

puts "calculating now the total mass...:"
proc total_mass {sele1} {
  set sum_1 0
  foreach mass [$sele1 get mass] {
    set sum_1 [expr {$sum_1 + $mass}]
  }
  return $sum_1
}

puts "calculating now cosolvent mass..."
proc cosolvent_mass {sele2} {
  set sum_2 0
  foreach mass [$sele2 get mass] {
    set sum_2 [expr {$sum_2 + $mass}]
  }
  return $sum_2
}

puts "calculating water mass..."
proc water_mass {sele3} {
  set sum_3 0
  foreach mass [$sele3 get mass] {
    set sum_3 [expr {$sum_3 + $mass}]
  }
  return $sum_3
}

puts "calculating ion mass..."
proc ion_mass {sele4} {
  set sum_4 0
  foreach mass [$sele4 get mass] {
    set sum_4 [expr {$sum_4 + $mass}]
  }
  return $sum_4
}

puts "calculating protein mass...\n\n"
proc protein_mass {sele5} {
  set sum_5 0
  foreach mass [$sele5 get mass] {
    set sum_5 [expr {$sum_5 + $mass}]
  }
  return $sum_5
}

set tm [total_mass $sele1]
set cosm [cosolvent_mass $sele2]
set watm [water_mass $sele3]
set ionm [ion_mass $sele4]
set prtm [protein_mass $sele5]

puts "Protein/All ratio:"
puts [expr ($prtm/$tm)*100]"

puts "\n\nCosolvent/All ratio:"
puts [expr ($cosm/$tm)*100]"

puts "\n\nWater/All ratio:"
puts [expr ($watm/$tm)*100]"

puts "\n\nIon/All ratio:"
puts [expr ($ionm/$tm)*100]"

puts "\n\nGetting cell size...:"

proc get_cell {{molid top}} {
 set all [atomselect $molid all]
 set minmax [measure minmax $all]
 set vec [vecsub [lindex $minmax 1] [lindex $minmax 0]]
 set center [measure center $all]
 puts "[lindex $vec 0] [lindex $vec 1] [lindex $vec 2]"
 $all delete
}

get_cell
