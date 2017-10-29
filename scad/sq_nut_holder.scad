include<lib/settings.scad>
include<lib/wedge.scad>
include<lib/node.scad>
include<lib/horseshoe.scad>
include<lib/ring.scad>
include<lib/bracket.scad>
include<lib/rectangular_plate.scad>
include<lib/rectangular_bar.scad>
include<lib/electric.scad>

module square_nut_holder(width)
{
    difference(){
        union(){
            rectangular_plate_plus(3, 1, 10);
            translate([0,0,thickness_total])cylinder(r1=2.45, r2=2, h=thickness_total+0.01, center=true, $fn=60);
            translate([width*2,0,thickness_total])cylinder(r1=2.45, r2=2, h=thickness_total+0.01, center=true, $fn=60);
        }
        translate([width,0,0])rectangular_plate_minus(1,1,10);

    }
}

square_nut_holder(10);

