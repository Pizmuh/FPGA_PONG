transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/simon/OneDrive/Namizje/school/4.\ letnik/Matura/FPGA/sheme/quartzus_pocitnice_v_decembru/VGA_prenizka_resolucija\ -\ Copy/FPGABlinkLED/ip/SYSTEM_PLL {C:/Users/simon/OneDrive/Namizje/school/4. letnik/Matura/FPGA/sheme/quartzus_pocitnice_v_decembru/VGA_prenizka_resolucija - Copy/FPGABlinkLED/ip/SYSTEM_PLL/SYSTEM_PLL.v}
vlog -sv -work work +incdir+C:/Users/simon/OneDrive/Namizje/school/4.\ letnik/Matura/FPGA/sheme/quartzus_pocitnice_v_decembru/VGA_prenizka_resolucija\ -\ Copy/FPGABlinkLED/projects/MKRVIDOR4000_template {C:/Users/simon/OneDrive/Namizje/school/4. letnik/Matura/FPGA/sheme/quartzus_pocitnice_v_decembru/VGA_prenizka_resolucija - Copy/FPGABlinkLED/projects/MKRVIDOR4000_template/MKRVIDOR4000_top.v}
vlog -sv -work work +incdir+C:/Users/simon/OneDrive/Namizje/school/4.\ letnik/Matura/FPGA/sheme/quartzus_pocitnice_v_decembru/VGA_prenizka_resolucija\ -\ Copy/FPGABlinkLED/projects/MKRVIDOR4000_template {C:/Users/simon/OneDrive/Namizje/school/4. letnik/Matura/FPGA/sheme/quartzus_pocitnice_v_decembru/VGA_prenizka_resolucija - Copy/FPGABlinkLED/projects/MKRVIDOR4000_template/telesto_vga.v}
vlog -sv -work work +incdir+C:/Users/simon/OneDrive/Namizje/school/4.\ letnik/Matura/FPGA/sheme/quartzus_pocitnice_v_decembru/VGA_prenizka_resolucija\ -\ Copy/FPGABlinkLED/projects/MKRVIDOR4000_template/db {C:/Users/simon/OneDrive/Namizje/school/4. letnik/Matura/FPGA/sheme/quartzus_pocitnice_v_decembru/VGA_prenizka_resolucija - Copy/FPGABlinkLED/projects/MKRVIDOR4000_template/db/system_pll_altpll.v}

