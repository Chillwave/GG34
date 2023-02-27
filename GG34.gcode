G28 ; home all axes
G0 X156 ; move X to 156 mm (Center the print head on the rail)
G0 Z230 F5000 ; move the print head up to 230 mm at a fast speed of 5000 mm/min
G0 Z234 F500 ; move the print head up to 234 mm at a slow speed of 500 mm/min (just before the GG34)
G4 S1 ; wait a sec
G0 Z242 F500 ; move the print head up to 242 mm at a slow speed of 500 mm/min (after the GG34, to align it)
G0 Z20 F5000 ; move the print head back down to 20 mm at a fast speed of 5000 mm/min
G28 ; home all axes