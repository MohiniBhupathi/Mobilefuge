// This roto design is an OpenSCAD clone of F.Lab's DIYBio rotor v2.
//
// Thomas Kircher <tkircher@gnu.org>



module main_rotor_body() {
    // Rotor base
    translate([0, 0, -3.4])
        cylinder(d = 10, h = 7, $fn = 300);
    
    // Rotor upper taper
    translate([0, 0, 3])
        cylinder(d1 = 10, d2 = 50, h = 20, $fn = 300);
    
    translate([0, 0, 23])
        cylinder(d = 50, h = 2, $fn = 300);
    
    }

module rotor_body_cutout() {
    // Rotor inner taper
    translate([0, 0, 11])
        cylinder(d1 = 20, d2 = 44, h = 15.1, $fn = 300);
    
    // Rotor mount hole
    translate([0, 0, -4])
        cylinder(d = 2.32, h = 20, $fn = 60);
    

    
}

// Eppendorf 1.5mL tubes are 10.7mm OD
module rotor_slot_cutout() {
    for(i = [0:1]) {
        rotate([0, 0, -180 * i]) translate([0, 41, -2])
            rotate([50, 0, 0])
                cylinder(d = 11.0, h = 35, $fn = 200);
    }
}

difference() {
    main_rotor_body();

    union() {
        rotor_body_cutout();
        rotor_slot_cutout();
    }
}