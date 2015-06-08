$fn=200;

difference() {
	// back side
	cube([8,78,40]);

	// screw holes for x-carriage
	translate([8-3.5,(78-64.5)/2,33]) rotate([0,90,0]) cylinder(r=3.5,h=4.5);
	translate([-1,(78-64.5)/2,33]) rotate([0,90,0]) cylinder(r=1.6,h=10);

	translate([8-3.5,(78-64.5)/2+64.5,33]) rotate([0,90,0]) cylinder(r=3.5,h=4.5);
	translate([-1,((78-64.5)/2)+64.5,33]) rotate([0,90,0]) cylinder(r=1.6,h=10);
}

difference() {
	union() {
		difference() {
			union() {
				// bottom plate
				cube([50,78,8]);
				// filament conduit
				translate([17+8-4.5,(78-6)/2,0]) cube([9,9,20]);
			}
			// filament opening
			translate([17+8,(78-6)/2+4.5,-1]) cylinder(r=2,h=22);
		}

		// middle plate
		translate([0,(78-6)/2+9,0]) cube([50,6,20]);
	}

	// center of nema circular notch
	translate([21+8,(78-6)/2+29,29]) rotate([90,0,0]) cylinder(r=22.5/2,h=20);

	// motor screws
	translate([8+5.5,(78-6)/2+8,8+5.5]) rotate([-90,0,0]) cylinder(r=1.6,h=8);
	translate([8+5.5+31,(78-6)/2+8,8+5.5]) rotate([-90,0,0]) cylinder(r=1.6,h=8);

	// hotend inset
	translate([17+8,(78-6)/2+4.5,-1]) cylinder(r=8,h=5.2);

	// hotend mount screws
	translate([17+8,(78-6)/2+4.5+(47/2),4.5]) cylinder(r = 4 / cos(180 / 6) + 0.05, h=4, $fn=6);
	translate([17+8,(78-6)/2+4.5+(47/2),-1]) cylinder(r=2,h=10);

	translate([17+8,(78-6)/2+4.5-(47/2),4.5]) cylinder(r = 4 / cos(180 / 6) + 0.05, h=4, $fn=6);
	translate([17+8,(78-6)/2+4.5-(47/2),-1]) cylinder(r=2,h=10);

}
