# vivado -mode tcl -source pgmfpga.tcl

open_hw_manager

connect_hw_server
current_hw_target [get_hw_targets */xilinx_tcf/Digilent/*]
open_hw_target

set dev [lindex [get_hw_devices] 0]
current_hw_device $dev
refresh_hw_device -update_hw_probes false $dev

if {[info exists ::env(PROGRAM_TOP)]} {
   set top $::env(PROGRAM_TOP)
} else {
   set top cmod7
}
set_property PROGRAM.FILE ${top}.bit $dev
#set_property PROBES.FILE ${top}.ltx $dev

program_hw_devices $dev
refresh_hw_device $dev

puts "Device programmed."

quit
