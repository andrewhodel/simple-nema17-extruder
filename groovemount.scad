module groovemount(){

	difference(){
		translate([-12,-35,0])cube(size=[29,70,10], center=false);


		translate([-10,0,5])cube(size=[20,12.5,15], center=true);
		translate([-10,0,5+4.4])cube(size=[20,16.5,10], center=true);

		cylinder(h=20, r=12.5/2);
		translate([0,0,4.4])cylinder(h=20, r=16.5/2);
		translate([0,-25,0])cylinder(h=20, r=5/2);
		translate([0,25,0])cylinder(h=20, r=5/2);
	}

}

module fan_mount() {

	translate([0,-20,0]) difference() {
		cube([10,40,3]);
		translate([20+6,20,0]) cylinder(r=20,h=4);
		translate([6,4,0]) cylinder(r=1.5,h=4);
		translate([6,4+32,0]) cylinder(r=1.5,h=4);
	}

}

translate([17,0,7]) rotate([0,-45,0]) fan_mount();
groovemount();
