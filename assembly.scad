include <constants.scad>
use <support_1.scad>



rotate([90, 0, 0])
    linear_extrude(thickness) support(0);

translate([1, 1-thickness, 0])
rotate([90, 0, 270])
    linear_extrude(thickness) support(1);

translate([0, 2-2*thickness, 0])
rotate([90, 0, -180])
    linear_extrude(thickness) support(0);

translate([-1, 1-thickness, 0])
rotate([90, 0, -270])
    linear_extrude(thickness) support(1);