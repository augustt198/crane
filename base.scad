include <constants.scad>

tri_len = 5;

module base_shape() {
    difference() {
        square([13, 13], center=true);
        for (i = [45 : 90 : 45+90*3]) {
            rotate([0, 0, i])
            translate([-10, 7])
            square([20, 20]);
        }
    }
}

module slits() {
    for (i = [0 : 3]) {
        translate([i+0.5, -thickness])
            square([tri_len/(5*2), thickness]);
    }
}

module base() {
    difference() {
        base_shape();
        union() {
            //square([2, 2], center=true);
            for (rot = [0 : 90 : 270]) {
                rotate([0, 0, rot]) {
                    translate([1, 1])
                        slits();
                    translate([1, -1+thickness])
                        slits();
                }
            }
        }
    }
}

//linear_extrude(thickness)
base();