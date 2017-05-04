$fn = 50;

fin_len = 4;
fin_width = 1.5;

slit_len = 3;
slit_width = 0.5;

module fins_base() {
    union() {
        for (deg = [0 : 60 : 60])
            rotate([0, 0, deg])
            difference() {

                translate([-fin_width/2, 0]) square([fin_width, fin_len]);
                
                polygon(points=[[slit_width/2, fin_len], [fin_width/2, fin_len], [fin_width/2, fin_len-(fin_width-slit_width)/2]]);
                polygon(points=[[-slit_width/2, fin_len], [-fin_width/2, fin_len], [-fin_width/2, fin_len-(fin_width-slit_width)/2]]);
            }
    };
}

module fins_slits() {
    union() {
        for (deg = [0 : 60 : 240])
            rotate([0, 0, deg])
            translate([-slit_width/2, fin_len-slit_len]) square([slit_width, slit_len]);
    };
}

difference() {
    union() {
        fins_base();
        circle(0.75, center=true);
    }
    fins_slits();
};



