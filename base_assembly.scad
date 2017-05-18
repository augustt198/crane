include <constants.scad>
use <base.scad>
use <base_tri.scad>
use <mast_assembly.scad>
use <jib_assembly.scad>

linear_extrude(thickness) base();

for (rot = [0 : 90 : 270]) {
    rotate([0, 0, rot]) {
        translate([-5-1, 1, thickness])
            rotate([90, 0, 0])
                linear_extrude(thickness) base_tri();
        translate([-5-1, -1+thickness, thickness])
            rotate([90, 0, 0])
                linear_extrude(thickness) base_tri();
    }
}

translate([0, -1+thickness])
    mast_assembly();

translate([0, -1.5, 21])
    jib_assembly();

translate([-1.3, -6, 20.5])
cube([2.6, 7, 2]);

translate([0, 0, 20])
linear_extrude(0.5) circle(2, $fn=50);