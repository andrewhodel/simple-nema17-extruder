$fn=100;

// diameter of the extruder gear
// subtract ~.5 for inset
extruderGearDiameter = 7;

// filament size
filamentDiameter = 1.75;

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
				translate([21+8-4.5-(extruderGearDiameter/2),(78-6)/2,0]) cube([9,9,20]);
			}
			// filament opening
			translate([21+8-(extruderGearDiameter/2),(78-6)/2+4.5,-1]) cylinder(r=(filamentDiameter/2)+.5,h=22);

			// angled outside edges
			translate([60,0,11/2]) rotate([0,0,45]) cube([50,50,11], center=true);
			translate([60,83,11/2]) rotate([0,0,45]) cube([50,50,11], center=true);

		}

		// middle plate
		translate([0,(78-6)/2+9,0]) cube([50,6,20]);
	}

	// center of nema circular notch
	translate([21+8,(78-6)/2+29,29]) rotate([90,0,0]) cylinder(r=22.5/2,h=20);

	// motor screws
	translate([8+5.5,(78-6)/2+8,8+5.5]) rotate([-90,0,0]) cylinder(r=1.6,h=8);
	translate([8+5.5+31,(78-6)/2+8,8+5.5]) rotate([-90,0,0]) cylinder(r=1.6,h=8);

	// hotend inset 5mm deep
	translate([21+8-(extruderGearDiameter/2),(78-6)/2+4.5,-1]) cylinder(r=8.25,h=6);

	// hotend mount screws 50 mm apart
	// nut shaped inset
	translate([21+8-(extruderGearDiameter/2),(78-6)/2+4.5+(50/2),4.5]) cylinder(r = 3.5 / cos(180 / 6) + 0.05, h=4, $fn=6);
	// actual hole
	translate([21+8-(extruderGearDiameter/2),(78-6)/2+4.5+(50/2),-1]) cylinder(r=2,h=10);

	translate([21+8-(extruderGearDiameter/2),(78-6)/2+4.5-(50/2),4.5]) cylinder(r = 3.5 / cos(180 / 6) + 0.05, h=4, $fn=6);
	translate([21+8-(extruderGearDiameter/2),(78-6)/2+4.5-(50/2),-1]) cylinder(r=2,h=10);

}
