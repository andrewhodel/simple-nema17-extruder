// fan screw
S_d = 3;

// fan
F_size = 40;
F_d = 32;
F_hs = 32; // hole spacing

// mount
M_height = 4;

// duct
D_thickness = 1.5;
D_width = 15 + D_thickness*2;
D_deep = 25 + D_thickness*2;
D_length = 25;
D_shift = 10; // modify if needed to direct flow more/less to the upper part of the hotend
D_translate_X = 0;
D_translate_Y = 0;

// set to true only have the top part of the duct and mount with 2 screws
twoScrewMount = true;

// mount
module mount()
{
  difference() {
	union(){
    translate([0,0,0]) cube([F_size+2, F_size+2, M_height], center=true);
	 duct();
	}
    translate([F_hs/2, F_hs/2, 0]) color("red") screw_hole();
    translate([F_hs/2, -F_hs/2, 0]) color("red") screw_hole();
    translate([-F_hs/2, -F_hs/2, 0]) color("red") screw_hole();
    translate([-F_hs/2, F_hs/2, 0]) color("red") screw_hole();
    translate([0,0,0]) cylinder(h=M_height, r=F_d/2, center = true, $fn=100);
    if (twoScrewMount == true) {
    	translate([15,0,0]) cube([F_size+6, F_size+6, (M_height+D_length)*2], center=true);
    }
   }
}

// duct
module duct()
{
	translate([0,0,0]) rotate ([0,0, 180])  difference() {
    hull() 
{
      cylinder(h=0.1, r=F_size/2 - 2.5, center = true, $fn=100);
      translate([D_translate_X, D_translate_Y/2, D_length]) 
        cube([D_width, D_deep, 0.1], center=true);
    }
    hull() {
      cylinder(h=0.1, r=F_d/2, center = true, $fn=100);
       translate([D_translate_X, D_translate_Y/2, D_length])
       cube([D_width-D_thickness*2, F_size-D_shift-D_thickness*2, 1], center=true);
    }
}
}

// screw 
module screw_hole()
{
  cylinder(h=20, r=S_d/2, center = true, $fn=100);
}

module fan_mounts(){
for ( i = [0 : 3] )
{
difference(){
union(){
translate([0, 10*i,0]) rotate([90,0,0]) cylinder(r=5, h = 4.5, $fn=20, center= true);
difference()
{
translate([-7, 10*i,0]) cube([13,4.5,10], center=true);
translate([-20, 10*i,3]) rotate([0,-30,0]) cube([30,6,10], center=true);
}
}
translate([0, 10*i,0]) rotate([90,0,0]) cylinder(r=2, h = 7, $fn=20,center= true);
}
}
}

translate([0,0,M_height/2]) mount();
translate([-35,15,5]) rotate([0,0,180]) fan_mounts();

