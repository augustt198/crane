include <constants.scad>

$fn = 25;

tri_len = 5;
tri_height = 3;

offset_radius = -0.6;
fillet = 0.2;

module triangle() {
    polygon([[0, 0], [tri_len, 0], [tri_len, tri_height]]);
}

module hollowed() {
    difference() {
        triangle();
        minkowski() {
            offset(r=offset_radius) triangle();
            circle(fillet);
        }
    }
}

module base_tri() {
    difference() {
        union() {
            hollowed();
            for (i = [0 : 4]) {
                translate([i, -thickness])
                    square([tri_len/(5*2), thickness]);
            }
        }
        translate([0, -1]) square([1, 2]);
    }
}

base_tri();