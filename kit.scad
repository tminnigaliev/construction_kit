thickness = 4.0;

// http://rcpp-kvalitet.ru/catalog/
// http://tdm-neva.ru/nuts/din-562-nut.htm
// http://www.ebay.com/itm/172788788738
//у винтов М4
//внешний диаметр шляпки 6.5..7 мм
//внешний диаметр резьбы 3.8 мм
module m4_square_nut_shell(){
    translate([0,0,1.1])cube([6.65,6.65,1.2], center=true);
}

module m4_square_nut_shell_inflated(){
    translate([0,0,0.1]) cube ([6.5,6.5,2.4], center=true);
    translate([0,0,-1.1]) rotate([0,0,45]) cylinder(h=2.4, r1=4.55, r2=4.7, $fn=4);
}

module m4_square_nut(){
    difference(){
        m4_square_nut_shell();
        cylinder(r=2, h=3, center=true);
    }
}

module node(width) {
    difference(){
        cube([width, width, thickness], center=true);
        union(){
            translate([0,0,0.25]) m4_square_nut_shell_inflated();
            translate([0,0,1]) m4_square_nut_shell();        cylinder(r=2.3, h=8, center=true, $fn=60);
        }
    }
}

module node_cut(){
    intersection(){
        node(10);
        translate([-20,0,0]) cube([40,40,40], center=true);
    }
}

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

module electric_board(count_x, count_y){
     for (i = [0:1:(count_x-1)] )
     for (j = [0:1:(count_y-1)] )
     {
         translate([i*10,j*10,0])contact_node(width);
     }
}

module bracket1(count_x, count_y, count_z, width)
{
    union(){
        rectangular_plate(count_x, count_y, width);
        translate([(count_x-0.5)*width, 0, 0.5*width]) rotate([0,-90,0]) rectangular_plate(count_z, count_y, width);
        translate([(count_x-0.25)*width-0.5, -0.5*width, -0.25*width+0.5]) rotate([0,-90,0]) cube([width/4, width*count_y, width/4]);
        translate([-0.5*width, 0, (count_z-0.5)*width]) rotate([0,90,0])rectangular_plate(count_z, count_y, width);
        translate([-0.5*width+0.5, -0.5*width, -0.25*width+0.5]) rotate([0,-90,0]) cube([width/4, width*count_y, width/4]);
    }
}

module bracket2(count_x, count_y, count_z, width)
{
    union(){
        mirror([0,0,1]) rectangular_plate(count_x, count_y, width);
        translate([(count_x-0.5)*width, 0, 0.5*width]) rotate([0,-90,0]) rectangular_plate(count_z, count_y, width);
        translate([(count_x-0.25)*width-0.5, -0.5*width, -0.25*width+0.5]) rotate([0,-90,0]) cube([width/4, width*count_y, width/4]);
        translate([-0.5*width, 0, (count_z-0.5)*width]) rotate([0,90,0])rectangular_plate(count_z, count_y, width);
        translate([-0.5*width+0.5, -0.5*width, -0.25*width+0.5]) rotate([0,-90,0]) cube([width/4, width*count_y, width/4]);
    }
}

/*
module half_barrel1(height, r)
{
    for (i = [0:1:(height-1)] )
    {
        step = 3.14 * r / 10;
        for (alpha = [0:step:3.14]) {
            alpha_deg = aplpha * 180 / 3.14;
            rotate([0,0,alpha_deg]) translate([0,r,10*i]) rotate([90,0,0]) node(10);
        }
    }    
}
*/

/*
module bracket3(count_x, count_y, count_z, width)
{
    difference(){
        union(){
            mirror([0,0,1]) rectangular_plate(count_x, count_y, width);
            translate([(count_x-0.5)*width, 0, 0.5*width]) rotate([0,-90,0]) mirror([0,0,1]) rectangular_plate(count_z, count_y, width);
            translate([(count_x-0.25)*width-0.5, -0.5*width, -0.25*width+0.5]) rotate([0,-90,0]) cube([width/4, width*count_y, width/4]);
            translate([-0.5*width, 0, (count_z-0.5)*width]) rotate([0,90,0]) mirror([0,0,1]) rectangular_plate(count_z, count_y, width);
            translate([-0.5*width+0.5, -0.5*width, -0.25*width+0.5]) rotate([0,-90,0]) cube([width/4, width*count_y, width/4]);
        }
        
        union(){
            for (i = [0:1:(count_y-1)] ) {
                translate ([-width/2, width*i ,width/2]) rotate([0,90,0]) m4_square_nut_shell_inflated();
            }
            for (i = [0:1:(count_y-1)] ) {
                translate ([(count_x-0.5)*width, width*i ,width/2]) rotate([0,90,0]) m4_square_nut_shell_inflated();
            }
        }
    }
}
*/

/*
module bracket3(count_x, count_y, count_z, width)
{
    union(){
        mirror([0,0,1]) rectangular_plate(count_x, count_y, width);
        translate([(count_x-0.5)*width, 0, 0.5*width]) rotate([0,-90,0]) mirror([0,0,1]) rectangular_plate(count_z, count_y, width);
        translate([(count_x-0.25)*width-0.5, -0.5*width, -0.25*width+0.5]) rotate([0,-90,0]) cube([width/4, width*count_y, width/4]);
        translate([-0.5*width, 0, (count_z-0.5)*width]) rotate([0,90,0]) mirror([0,0,1]) rectangular_plate(count_z, count_y, width);
        translate([-0.5*width+0.5, -0.5*width, -0.25*width+0.5]) rotate([0,-90,0]) cube([width/4, width*count_y, width/4]);
    }
}
*/

module bracket3(count_x, count_y, count_z, width)
{
    difference(){
        union(){
            mirror([0,0,1]) rectangular_plate(count_x, count_y, width);
            translate([(count_x-0.5)*width, 0, 0.5*width]) rotate([0,-90,0]) mirror([0,0,1]) rectangular_plate(count_z, count_y, width);
            translate([(count_x-0.25)*width-0.5, -0.5*width, -0.25*width+0.5]) rotate([0,-90,0]) cube([width/4, width*count_y, width/4]);
            translate([-0.5*width, 0, (count_z-0.5)*width]) rotate([0,90,0]) mirror([0,0,1]) rectangular_plate(count_z, count_y, width);
            translate([-0.5*width+0.5, -0.5*width, -0.25*width+0.5]) rotate([0,-90,0]) cube([width/4, width*count_y, width/4]);
        }
        
        union(){
            for (i = [0:1:(count_y-1)] ) {
                translate ([-width/2, width*i ,width/2]) rotate([0,90,0]) m4_square_nut_shell_inflated();
            }
            for (i = [0:1:(count_y-1)] ) {
                translate ([(count_x-0.5)*width, width*i ,width/2]) rotate([0,90,0]) m4_square_nut_shell_inflated();
            }
        }
    }
}

module bracket4(count_x, count_y, count_z, width)
{
    difference(){
        union(){
            rectangular_plate(count_x, count_y, width);
            translate([(count_x-0.5)*width, 0, 0.5*width]) rotate([0,-90,0]) mirror([0,0,1]) rectangular_plate(count_z, count_y, width);
            translate([(count_x-0.25)*width-0.5, -0.5*width, -0.25*width+0.5]) rotate([0,-90,0]) cube([width/4, width*count_y, width/4]);
            translate([-0.5*width, 0, (count_z-0.5)*width]) rotate([0,90,0]) mirror([0,0,1]) rectangular_plate(count_z, count_y, width);
            translate([-0.5*width+0.5, -0.5*width, -0.25*width+0.5]) rotate([0,-90,0]) cube([width/4, width*count_y, width/4]);
        }
        
        union(){
            for (i = [0:1:(count_y-1)] ) {
                translate ([-width/2, width*i ,width/2]) rotate([0,90,0]) m4_square_nut_shell_inflated();
            }
            for (i = [0:1:(count_y-1)] ) {
                translate ([(count_x-0.5)*width, width*i ,width/2]) rotate([0,90,0]) m4_square_nut_shell_inflated();
            }
        }
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
//node(10);
rectangular_plate(1,5,10);
//half_barrel1(4, 20);
//translate ([-40,0,0]) mirror([0,0,1]) rectangular_plate(3,4,10);
//bracket4(5,8,2,10);