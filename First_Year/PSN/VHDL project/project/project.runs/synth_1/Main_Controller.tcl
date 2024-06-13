# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {D:/VHDL project/project/project.cache/wt} [current_project]
set_property parent.project_path {D:/VHDL project/project/project.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:basys3:part0:1.2 [current_project]
set_property ip_output_repo {d:/VHDL project/project/project.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {D:/VHDL project/project/project.srcs/sources_1/new/Test_Mode.vhd}
  {D:/VHDL project/project/project.srcs/sources_1/new/Seven_Segment_Display.vhd}
  {D:/VHDL project/project/project.srcs/sources_1/new/Manual_Mode.vhd}
  {D:/VHDL project/project/project.srcs/sources_1/new/Auto_Mode.vhd}
  {D:/VHDL project/project/project.srcs/sources_1/new/led_dimmer.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/VHDL project/Basys-3-Master.xdc}}
set_property used_in_implementation false [get_files {{D:/VHDL project/Basys-3-Master.xdc}}]


synth_design -top Main_Controller -part xc7a35tcpg236-1


write_checkpoint -force -noxdef Main_Controller.dcp

catch { report_utilization -file Main_Controller_utilization_synth.rpt -pb Main_Controller_utilization_synth.pb }
