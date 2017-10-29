include<settings.scad>
include<node.scad>

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

