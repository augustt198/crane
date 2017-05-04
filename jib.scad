include <constants.scad>

$fn = 20;

width = 2;

cutout_width = 1.9;
fillet = 0.08;
gap = 0.5;

connector_length = 0.4;
connector_gap = 0.35;

//length = 18;
length = 10*(gap+cutout_width*sqrt(2)/2+fillet)-connector_length/2;
    
module cutout() {
    translate([(cutout_width*sqrt(2)-0.0*fillet)/4, cutout_width*sqrt(2)/2+fillet])
    minkowski() {
        difference() {
            rotate([0, 0, 45])
                square([cutout_width, cutout_width], center=true);
            translate([0, -cutout_width])
                square([cutout_width, cutout_width*2]);
        }
        circle(fillet);
    }
}

module connector_base() {
    translate([-width/2, 0])
        square([width, connector_length]);
}

module connector_slits() {
    for (i = [-2 : 2]) {
        translate([connector_gap*i, connector_length/2])
            square([0.2, thickness], center=true);
    }
}

module jib() {
    difference() {
        union() {
            difference() {
                translate([-width/2, 0])
                    square([width, length]);

                for (i = [-1 : 10])
                    translate([0, gap+i*(gap+cutout_width*sqrt(2)/2+fillet)])
                    rotate([0, (i%2)*180, 0])
                    cutout();
            }
            for (i = [0 : 2 : 10])
                translate([0, i*(gap+cutout_width*sqrt(2)/2+fillet)-connector_length/2])
                    connector_base();
        }
        for (i = [0 : 2 : 10])
                translate([0, i*(gap+cutout_width*sqrt(2)/2+fillet)-connector_length/2])
                    connector_slits();
    }
}

//linear_extrude(thickness) jib();
jib();