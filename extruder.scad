filament_d = 1.75;
spring_d = 8;
countersink = true;
bearingH = 6;
bearingW = 16;
bearingShaftR = 2.5;
$fn = 200;

//!for (side = [0, 1]) mirror([0, side, 0]) translate([0, 16, 0])
!
mirror([1, 0, 0]) //uncomment for reverse
union() {
	translate([14, 6, 0]) rotate(30) idler();
	translate([-8, -6, 0]) base();
}

%translate([0, 6.5, 9.65]) union() {
	rotate([0, 180, 0]) import("MP1703-MK7-Filament-Drive-Block-Back.stl", convexity = 5);
	import("MP1794-MK7-Filament-Drive-Block-Front.stl", convexity = 5);
}
translate([0, 15.5, 0]) base();
translate([15.5, 15.5, 0]) {
	%translate([-15.5, -15.5, 0]) translate([10.56 / 2 + 5 + filament_d, 0, 7.7]) linear_extrude(height = 4, convexity = 5) difference() {
		circle(5);
		circle(1.5, $fn = 6);
	}

	translate([0, 0, 9.4 - 5]) rotate(-9) idler();
}
%translate([0, 0, 2]) difference() {
	linear_extrude(height = 11, convexity = 5) difference() {
		circle(6.3);
		circle(2.5);
	}
	translate([0, 0, 7.7]) rotate_extrude(convexity = 5, $fs = 0.5) translate([5 + 2.5, 0, 0]) circle(r = 2);
}

module idler() difference() {
	linear_extrude(height = 10.6, convexity = 5) difference() {
		union() {
			// circle which rounds pivot points
			circle(5);
			// circle at very end of idler, where bearing is
			translate([0, -18.5, 0]) circle(5);
			// between 2 circles immediatly above
			rotate(180) translate([-5, 0, 0]) square([10, 18.5]);
			// main shaft from pivot to opposite end of bearing
			rotate(60) translate([0, 0, 0]) square([5, 35]);
			rotate(60) translate([2.5, 35, 0]) {
				// rounded edge for lip
				circle(2.5);
				rotate(-30) {
					// lip on opposite side of bearing
					translate([-2.5, 0, 0]) square([5, 7]);
					translate([0, 7, 0]) circle(2.5);
				}
			}
			rotate(30) translate([-5, 0, 0]) square([5, 10]);
		}
		// hole for pivot point which connects to stepper motor
		circle(3 * 7/12, $fn = 6);
		// bearing shaft hole
		rotate(9) translate([-15.5 + 10.56 / 2 + 5 + filament_d, -15.5, 0]) circle(bearingShaftR, $fn = 6);
	}

	// this block represents the cutout for the bearing
	translate([0, 0, (bearingH/2)+((10.6-bearingH)/2)]) {
		rotate(9) translate([-15.5 + 10.56 / 2 + 5 + filament_d, -15.5, 0]) linear_extrude(height = bearingH, convexity = 5, center = true) difference() {
			// bearing slot width
			circle(bearingW-4);
			// spacer for bearing, cut out after print
			circle(bearingShaftR+.7, $fn = 6);
		}
		// no clue what these next 2 are, they seem to change nothing
		translate([10.56 / 2 + 1.5, 0, 0]) rotate([-90, 0, 9]) translate([-15.5, 0, -15.5]) cylinder(r = 2, h = 50, $fn = 6);
		translate([10.56 / 2 + 1.5, 0, 0]) rotate([-90, 0, 0]) translate([-15.5, 0, -15.5]) rotate([0, 0, 0]) cylinder(r = 2, h = 100, center = true, $fn = 6);
	}

	// countersink for pivot point bolt
	if (countersink) translate([0, 0, 10.6 - 4]) cylinder(r1 = 0, r2 = 8, h = 8, $fn = 6);
	// spring countersink
	translate([0, 0, 10.6 / 2]) rotate([90, 0, -30]) translate([-25, 0, -2]) cylinder(r = spring_d * 7/12, h = 10, $fn = 6);
}

module base() difference() {
	linear_extrude(height = 15, convexity = 5) difference() {
		union() {
			square([31, 10], center = true);
			translate([-15.5, 0, 0]) rotate(120) {
				translate([0, -5, 0]) square([5, 10]);
				translate([5, 0, 0]) circle(5);
				translate([5, 0, 0]) rotate(-150 - 9 / 2) square([15, 5]);			
			}
			for (side = [1, -1]) translate([side * 15.5, 0, 0]) circle(5);
		}
		for (side = [1, -1]) translate([side * 15.5, 0, 0]) circle(3 * 7/12, $fn = 6);
		translate([0, -15.5, 0]) circle(12);
	}
	translate([0, 0, 4.4]) linear_extrude(height = 15, convexity = 5) {
		translate([-15.5, 0, 0]) rotate(30) translate([0, 5, 0]) rotate(-60 - 9 / 2) translate([-5, 5, 0]) square(100);
		translate([0, -10, 0]) square(100);
	}
	if (countersink) translate([-15.5, 0, 15 - 4]) cylinder(r1 = 0, r2 = 8, h = 8, $fn = 6);
	translate([-15.5, 0, 4.4 + 10.6 / 2]) rotate([90, 0, 150 - 4.5]) translate([0, 0, 4]) cylinder(r = spring_d * 7/12, h = 10, $fn = 6);
}
