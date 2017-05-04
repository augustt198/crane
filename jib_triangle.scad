include <constants.scad>

$fn = 20;

// I was too lazy to work out the math, so there
// are a lot of constants found by trial and error

connector_length = 0.4;
connector_gap = 0.35;


fillet = 0.1;

module connector_slits() {
    for (i = [-2 : 2]) {
        translate([connector_gap*i, 0])
            square([0.2, thickness], center=true);
    }
}

module triangle_slits() {
for (i = [0 : 120 : 240])
    rotate([0, 0, i]) {
        translate([0, 0.65]) {
            connector_slits();

            // uncomment to visualize how jig panels will fit
            //translate([-1, 0-thickness/2]) square([2, thickness]);
        }
    }
}

module triangle_outer() {
    rotate([0, 0, -90]) circle(1.18, $fn=3);    
}

module triangle_inner() {
    minkowski() {
        rotate([0, 0, -90]) circle(0.65, $fn=3);
        circle(fillet);
    }
    
}

module jib_triangle() {
    difference() {
        union() {
            triangle_outer();
            triangle_slits();
        }
        triangle_inner();
    }
}

jib_triangle();
