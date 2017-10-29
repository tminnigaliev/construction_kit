include<settings.scad>
use<node.scad>

/* элемент, из которого строятся все детали */
module node_flex(width, x_channels, y_channels) {
    difference(){
        node_plus(width);
        union(){
            node_minus(width);
            if (x_channels) {
                translate([-width/2-1,width/2-1.3,thickness_total/2])rotate([0,90,0]) 
            cylinder(r=0.65, h=width+2, $fn=60);
                translate([-width/2-1,-width/2+1.3,thickness_total/2])rotate([0,90,0]) 
            cylinder(r=0.65, h=width+2, $fn=60);
            }
            if (y_channels) {
                translate([width/2-1.3, -width/2-1,thickness_total/2])rotate([-90,0,0]) 
            cylinder(r=0.65, h=width+2, $fn=60);
                translate([-width/2+1.3,-width/2-1,thickness_total/2])rotate([-90,0,0]) 
            cylinder(r=0.65, h=width+2, $fn=60);
            }
        }
    }
}

//node_flex(10,1,1);