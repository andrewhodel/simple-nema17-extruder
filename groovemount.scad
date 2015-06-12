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

translate([30,-10,5]) fan_mount();
}

module fan_mount_L(k=2){
for ( i = [0 : k] )
{
difference(){
union(){
translate([5, 10*i,0]) rotate([90,0,0]) cylinder(r=5, h = 4.5, $fn=20, center= true);
difference()
{
translate([-5, 10*i,0]) cube([20,4.5,10], center=true);
translate([-20, 10*i,3]) rotate([0,-30,0]) cube([30,6,10], center=true);
}
}
translate([5, 10*i,0]) rotate([90,0,0]) cylinder(r=2, h = 7, $fn=20,center= true);
}
}
}

module fan_mount(k=2){
for ( i = [0 : k] )
{
difference(){
union(){
translate([0, 10*i,0]) rotate([90,0,0]) cylinder(r=5, h = 5, $fn=20, center= true);
translate([-10, 10*i,0]) cube([18,5,10], center=true);
}
translate([0, 10*i,0]) rotate([90,0,0]) cylinder(r=2, h = 7, $fn=20,center= true);
}
}
}

module groovemount_L(){

difference()
{
union(){
translate([0,-25,0])cylinder(h=6, r=10);
translate([0,25,0])cylinder(h=6, r=10);
translate([14,0,3]) cube([6,25,6], center=true);
translate([10,15,3]) rotate([0,0,45]) cube([6,15,6], center=true);
translate([10,-15,3]) rotate([0,0,-45]) cube([6,15,6], center=true);
}
//translate([-12,-35,0])cube(size=[29,70,10], center=false);


translate([0,-25,5])cylinder(h=20, r=5/2, center=true);
translate([0,25,5])cylinder(h=20, r=5/2, center=true);
}

translate([30,-10,5]) fan_mount_L();
}

groovemount();
