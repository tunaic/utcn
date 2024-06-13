@echo off
set xv_path=D:\\Xilinx\\Vivado\\2016.4\\bin
echo "xvhdl -m64 --relax -prj Test_Mode_vhdl.prj"
call %xv_path%/xvhdl  -m64 --relax -prj Test_Mode_vhdl.prj -log xvhdl.log
call type xvhdl.log > compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
