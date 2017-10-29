include<settings.scad>
include<node.scad>

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

