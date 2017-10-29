include<lib/settings.scad>
include<lib/wedge.scad>
include<lib/node.scad>
include<lib/horseshoe.scad>

module contact_node()
{
    union(){
        node(10);
        difference(){
            translate([0,0,-5]) cube([10,10,6], center=true);
            union(){
                #translate([0,0,-8.5]) cylinder(r=3.5, h=7, $fn=32);
            }
        }
    }
}

module contact_node_cut(){
    intersection(){
        contact_node(10);
        translate([-20,0,0]) cube([40,40,40], center=true);
    }
}

module rectangular_bar(count_x, width){
     for (i = [0:1:(count_x-1)] )
     {
         translate([0,i*width,0])node(width);
     }
}

module rectangular_bar_alternating11_0(count_x, width){
     for (i = [0:1:(count_x-1)] )
     {
         if (i%2) mirror([0,0,1]) translate([0,i*width,0])node(width);
         else  translate([0,i*width,0])node(width);
     }
}

module rectangular_bar_alternating11_1(count_x, width){
    for (i = [0:1:(count_x-1)] )
    {
        if (i%2) translate([0,i*width,0])node(width);
        else  mirror([0,0,1]) translate([0,i*width,0])node(width);
    }
}

module rectangular_plate(count_x, count_y, width){
     for (i = [0:1:(count_x-1)] )
     for (j = [0:1:(count_y-1)] )
     {
         translate([i*width,j*width,0])node(width);
     }
}

module rectangular_plate_plus(count_x, count_y, width){
     for (i = [0:1:(count_x-1)] )
     for (j = [0:1:(count_y-1)] )
     {
         translate([i*width,j*width,0])node_plus(width);
     }
}

module rectangular_plate_minus(count_x, count_y, width){
     for (i = [0:1:(count_x-1)] )
     for (j = [0:1:(count_y-1)] )
     {
         translate([i*width,j*width,0])node_minus(width);
     }
}

module electric_board(count_x, count_y){
     for (i = [0:1:(count_x-1)] )
     for (j = [0:1:(count_y-1)] )
     {
         translate([i*10,j*10,0])contact_node(width);
     }
}

module bracket1(count_x, count_y, count_z, width)
{
    difference(){
    
    union(){
        rectangular_plate_plus(count_x-2, count_y, width);
        translate([-width,0,0])rotate([0,0,90])node_corner90(width);
        translate([width*(count_x-2),0,0])rotate([0,0,90])mirror([0,1,0])node_corner90(width);

        translate([-width*(count_x-2+count_z-2),0,0])rectangular_plate_plus(count_z-1, count_y, width);
        translate([count_x*width,0,0])rectangular_plate_plus(count_z-1, count_y, width);
    }
    
    union(){
        rectangular_plate_minus(count_x-2, count_y, width);
        translate([-(count_x-2+count_z-2)*width, 0, 0])  rectangular_plate_minus(count_z-1, count_y, width);
        translate([(count_x)*width, 0, 0])  rectangular_plate_minus(count_z-1, count_y, width);
    }
    
    }
}

module bracket2(count_x, count_y, count_z, width)
{
    difference(){
    
    union(){
        translate([0,0,thickness_total]) mirror([0,0,1]) rectangular_plate_plus(count_x-2, count_y, width);
        translate([-width,0,0])rotate([0,0,90])node_corner90(width);
        translate([width*(count_x-2),0,0])rotate([0,0,90])mirror([0,1,0])node_corner90(width);

        translate([-width*(count_x-2+count_z-2),0,0])rectangular_plate_plus(count_z-1, count_y, width);
        translate([count_x*width,0,0])rectangular_plate_plus(count_z-1, count_y, width);
    }
    
    union(){
        translate([0,0,thickness_total]) mirror([0,0,1])rectangular_plate_minus(count_x-2, count_y, width);
        translate([-(count_x-2+count_z-2)*width, 0, 0])  rectangular_plate_minus(count_z-1, count_y, width);
        translate([(count_x)*width, 0, 0])  rectangular_plate_minus(count_z-1, count_y, width);
    }
    
    }
}

module bracket3(count_x, count_y, count_z, width)
{
    difference(){

    union(){
        translate([0,0,thickness_total])mirror([0,0,1])rectangular_plate_plus(count_x, count_y, width);
        translate([(count_x-0.5)*width-thickness_total, 0, 0.5*width]) rotate([0,-90,0]) mirror([0,0,1])rectangular_plate_plus(count_z, count_y, width);
        translate([-0.5*width+thickness_total, 0, (count_z-0.5)*width]) rotate([0,90,0]) mirror([0,0,1])rectangular_plate_plus(count_z, count_y, width);
    }

    union(){
        translate([width,0,thickness_total])mirror([0,0,1])rectangular_plate_minus(count_x-2, count_y, width);
        rectangular_plate_minus(1, count_y, width);
        translate([width*(count_x-1),0,0])rectangular_plate_minus(1, count_y, width);

        translate([(count_x-0.5)*width, 0, 0.5*width]) rotate([0,-90,0]) rectangular_plate_minus(1, count_y, width);  
        translate([(count_x-0.5)*width-thickness_total, 0, 1.5*width]) rotate([0,-90,0]) mirror([0,0,1])rectangular_plate_minus(count_z-1, count_y, width);

        translate([-0.5*width, 0, 0.5*width]) rotate([0,90,0]) rectangular_plate_minus(1, count_y, width);
        translate([-0.5*width+thickness_total, 0, (count_z-0.5)*width]) rotate([0,90,0]) mirror([0,0,1])rectangular_plate_minus(count_z-1, count_y, width);
    }
    }
}

module bracket4(count_x, count_y, count_z, width)
{
    difference(){

    union(){
        rectangular_plate_plus(count_x, count_y, width);
        translate([(count_x-0.5)*width-thickness_total, 0, 0.5*width]) rotate([0,-90,0]) mirror([0,0,1])rectangular_plate_plus(count_z, count_y, width);
        translate([-0.5*width+thickness_total, 0, (count_z-0.5)*width]) rotate([0,90,0]) mirror([0,0,1])rectangular_plate_plus(count_z, count_y, width);
    }
    union(){
        rectangular_plate_minus(count_x, count_y, width);
        //translate([(count_x-0.5)*width-thickness_total, 0, 0.5*width]) rotate([0,-90,0]) mirror([0,0,1])rectangular_plate_minus(count_z, count_y, width);
        //translate([-0.5*width+thickness_total, 0, (count_z-0.5)*width]) rotate([0,90,0]) mirror([0,0,1])rectangular_plate_minus(count_z, count_y, width);
        translate([(count_x-0.5)*width, 0, 0.5*width]) rotate([0,-90,0]) rectangular_plate_minus(1, count_y, width);  
        translate([(count_x-0.5)*width-thickness_total, 0, 1.5*width]) rotate([0,-90,0]) mirror([0,0,1])rectangular_plate_minus(count_z-1, count_y, width);

        translate([-0.5*width, 0, 0.5*width]) rotate([0,90,0]) rectangular_plate_minus(1, count_y, width);
        translate([-0.5*width+thickness_total, 0, (count_z-0.5)*width]) rotate([0,90,0]) mirror([0,0,1])rectangular_plate_minus(count_z-1, count_y, width);
    }
    }
}

/*
ring10_20: 10 mm размер элемента
           20 элементов по периметру кольца
*/
module ring_10_20()
{
    horseshoe(10, 31.85, 20);    
}

module ring_10_18()
{
    horseshoe(10, 28.65, 18);    
}

module ring_10_16()
{
    horseshoe(10, 25.45, 16);    
}

module ring_10_14()
{
    horseshoe(10, 22.25, 14);    
}

module ring_10_12()
{
    horseshoe(10, 19.05, 12);    
}

module ring_10_10()
{
    horseshoe(10, 15.85, 10);    
}

module ring_10_8()
{
    horseshoe(10, 12.65, 8);    
}

module ring_10_6()
{
    horseshoe(10, 9.45, 6);    
}

module ring_10_4()
{
    horseshoe(10, 6.37, 4);    
}

module ring_10_3()
{
    horseshoe(10, 4.78, 3);    
}

module ring_10_2()
{
    horseshoe(10, 3.185, 2);    
}

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

/*
module corner_in_in(count_x, count_y, count_z, width){
     for (k = [0:1:(count_z-1)])
     {
         translate()    
     }
}
*/

//contact_node_cut();
//electric_board(5,5);
//rectangular_bar_alternating11_0(19, 10);
//translate([20,0,0]) rectangular_bar_alternating11_1(19, 10);
//node_cut();
//m4_square_nut_shell_inflated();
//rectangular_plate(1,5,10);
ring_10_2();
//translate ([-40,0,0]) mirror([0,0,1]) rectangular_plate(3,4,10);
//bracket2(5,1,2,10);
//square_nut_holder(10);
//node_and_node_section(10, 90);
//node_lock90(10);
//node_corner90(10);
