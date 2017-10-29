include<settings.scad>
use<node.scad>

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

