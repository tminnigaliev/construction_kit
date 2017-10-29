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

//contact_node_cut();
//electric_board(5,5);
//rectangular_bar_alternating11_0(19, 10);
//translate([20,0,0]) rectangular_bar_alternating11_1(19, 10);
//node_cut();
//m4_square_nut_shell_inflated();
//rectangular_plate(1,5,10);
//ring_10_2();
//translate ([-40,0,0]) mirror([0,0,1]) rectangular_plate(3,4,10);
//bracket2(5,1,2,10);
square_nut_holder(10);
//node_and_node_section(10, 90);
//node_lock90(10);
//node_corner90(10);
