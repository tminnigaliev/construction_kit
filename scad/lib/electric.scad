
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

module contact_node_cross_section(){
    intersection(){
        contact_node(10);
        translate([-20,0,0]) cube([40,40,40], center=true);
    }
}

module electric_board(count_x, count_y){
     for (i = [0:1:(count_x-1)] )
     for (j = [0:1:(count_y-1)] )
     {
         translate([i*10,j*10,0])contact_node(width);
     }
}
