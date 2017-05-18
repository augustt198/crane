include <constants.scad>

$fn=25;

section_1_width = 2;
section_1_height = 2.5;
section_2_width = 0.5;
section_2_height = 2.5;

offset_radius = 0.20;
truss_thickness = 0.2;

module base_shape() {
    polygon([
        [section_1_width/2, 0], [section_1_width/2, section_1_height],
        [-section_1_width/2+section_2_width, section_1_height+section_2_height],
        [-section_1_width/2, section_1_height+section_2_height],
        [-section_1_width/2, section_1_height], [-section_1_width/2, 0]
    ]);
}


difference() {
    base_shape();
    offset(-offset_radius) base_shape();
}

module truss() {
    intersection() {
        base_shape();
        union() {
            translate([0, 1])
                rotate([0, 0, 55]) translate([-6/2, 0]) square([6, truss_thickness]);

            translate([0, 1])
                rotate([0, 0, -55]) translate([-6/2, 0]) square([6, truss_thickness]);

            translate([-6/2, 2.25]) square([6, truss_thickness]);
            
            translate([0, 3.7])
                rotate([0, 0, 60]) translate([-6/2, 0]) square([6, truss_thickness]);
        }
    }
}

truss();