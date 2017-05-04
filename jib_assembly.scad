include <constants.scad>
use <jib.scad>
use <jib_triangle.scad>

cutout_width = 1.9;
fillet = 0.08;
gap = 0.5;

connector_length = 0.4;
connector_gap = 0.35;

for (i = [0 : 120 : 240])
    rotate([0, i+180, 0]) translate([0, 0, 0.65-thickness/2]) linear_extrude(thickness)
        jib();


    for (i = [0 : 2 : 10])
        translate([0, thickness+i*(gap+cutout_width*sqrt(2)/2+fillet)-connector_length/2])
rotate([-90, 0, 0]) linear_extrude(thickness)
    jib_triangle();
