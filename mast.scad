include <constants.scad>

$fn=20;

cutout_width = 1.4;
support_thickness = 0.3;
width = 2;
height = 20;
fillet = 0.08;

tab_length = 0.5;

module cutout(i) {
    minkowski() {
        difference() {
            square([cutout_width, cutout_width], center=true);
            
            rotate([0, 0, 45 + (i%2)*90])
                square([cutout_width*2, support_thickness], center=true);
        }
        
        circle(fillet);
    }
}

module tabs(mode) {
    for (i = [0 : 20]) {
        translate([-width/2, (2*i-mode%2)*tab_length])
            square([thickness, tab_length]);
        translate([width/2-thickness, (2*i-mode%2)*tab_length])
            square([thickness, tab_length]);
    }
}

module support(tab_mode) {
    difference() {
        translate([-width/2, 0])
            square([width, height]);
        
        for (i = [0 : 10]) {
            translate([0, (cutout_width+fillet)*(i+0.5)+ (width-cutout_width)/2*(i+1)])
            cutout(i);
        }
        tabs(tab_mode);
    }
}

support(1);