; point6 nozzle pre-print gCode fore Prusa

M117 Preparing... ;Put printing message on LCD screen
M300 S2500 P100; Beep
M204 T1250 ; sets acceleration (P, T) and retract acceleration (R), mm/sec^2
M221 S{if layer_height<0.075}100{else}100{endif} ; Set flow
M104 S140 ; set extruder temp
M140 S[first_layer_bed_temperature] ; set bed temp

; GG34 Dual Z alignment
M117 Dual Z Align... ;Put printing message on LCD screen
G28 ; home all axes
g90 ; absolute positioning
G0 X156 ; move X to 156 mm (Center the print head on the rail)
G0 Z230 F5000 ; move the print head up to 230 mm at a fast speed of 5000 mm/min
G0 Z234 F500 ; move the print head up to 234 mm at a slow speed of 500 mm/min (just before the GG34)
G4 S1 ; wait a sec
G0 Z242 F500 ; move the print head up to 242 mm at a slow speed of 500 mm/min (after the GG34, to align it)
G0 Z20 F5000 ; move the print head back down to 20 mm at a fast speed of 5000 mm/min

;G1 Z50 ; this is a good start heating position

G28 X Y; Home X Y
G1 Y10 ; this is a good start heating position
M84 ; disable motors

M109 S140; wait for extruder temp

; Auto Leveling
M117 Level Bed... ;Put printing message on LCD screen
M280 P0 S160 ; BLTouch alarm release
G4 P100 ; delay for BLTouch
G28 ; home
G29 ; auto bed leveling ONLY UNCOMMENT THIS IF BED LEVELING WITH BLTOUCH REMOVE
M500 ; ONLY UNCOMMENT THIS IF BED LEVELING WITH BLTOUCH REMOVE
;M420 S1 ; Load Saved Eeprom From Auto Level

M104 S[first_layer_temperature] ; set extruder temp

; Start of print

G21; metric values
G90 ; absolute positioning
M83 ; use relative distances for extrusion

; You may want to adjust the X and Y here so the nozzle is really above the bed!
G1 X0 Y0 F7200 ; Move to a position in the left front of the bed
G1 Z0.6; Move nozzle above 0.6 mm of the bed
G91 ; Use relative mode

M109 S[first_layer_temperature] ; wait for extruder temp
M190 S[first_layer_bed_temperature] ; wait for bed temp

; Print a line of filament to prepare extrusion
G1 F1800 E3
G1 Y40 E20 F1000 ; prints a line in the front
G1 Y40 E20 F800 ; prints a line in the front

; Begin printing
G92 E0 ; Set extrusion distance to 0
G90 ; switch back to absolute mode
M117 Printing... ;Put printing message on LCD screen
; Start of actual GCode for the print
