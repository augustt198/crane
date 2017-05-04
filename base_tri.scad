include <constants.scad>

$fn = 25;

tri_len = 5;
tri_height = 3;

offset_radius = -0.6;
fillet = 0.2;

module base_tri() {
    polygon([[0, 0], [tri_len, 0], [tri_len, tri_height]]);
}

difference() {
    base_tri();
    minkowski() {
        offset(r=offset_radius) base_tri();
        circle(fillet);
    }
}

for (i = [0 : 4]) {
    translate([i, -thickness])
        square([0.5, thickness]);
}