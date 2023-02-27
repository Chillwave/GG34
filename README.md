# GG34 Bump stop for Ender 3 Printers

[In Action](https://www.youtube.com/watch?v=F19--b2xTzk)

The GG34 Bump stop is a mechanically minimally invasive part that allows an Ender 3 series printer to easily align it's X-axis by ramming itself onto a fixed position which will allow the Z motors the skip the X-axis into alignment.

This accounts for the Dual Z rod holders which cap some of the Z range and the little lip for the X-gantry on the right.

I printed all this on a 0.8 nozzle so it will work with a 0.4 mm nozzle.

It is remixed from Khyam's design: https://www.thingiverse.com/thing:4376394

For the Ender 3, I am using Willsside's mechanical endstop design to give the part a place to stop on: https://www.thingiverse.com/thing:4924870/files

Used "With_Rail_M4". I went with this variation as I had extra long M4 screws laying around and the way this design works is by sliding into the rail from the side by removing the plastic then pressing into place by torquing down the screw.

You could probably use an M4 t-nut to lock it in place, but it's gonna have to be under the rail line, I'd recommend printing a mechanical endstop as well to slide into the top channel for fixed support.

It is held into place by using a rubber band that is connected through any screw that is placed through the middle hole. I used spare M4 screws as rubber band holders here and for the top rail I am using the M4 screws all they way through to keep them in place.

This code can be used before starting a print (through OctoPrint or your slicer of choice) to ensure that your X axis is aligned.

G28 ; home all axes G0 X156 ; move X to 156 mm (Center the print head on the rail) G0 Z230 F5000 ; move the print head up to 230 mm at a fast speed of 5000 mm/min G0 Z234 F500 ; move the print head up to 234 mm at a slow speed of 500 mm/min (just before the GG34) G4 S1 ; wait a sec G0 Z242 F500 ; move the print head up to 242 mm at a slow speed of 500 mm/min (after the GG34, to align it) G0 Z20 F5000 ; move the print head back down to 20 mm at a fast speed of 5000 mm/min G28 ; home all axes

This has allowed my bed to stay level after an auto tram, even after multiple prints.
