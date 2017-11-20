include<settings.scad>

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
    thickness = thickness_total - thickness_bottom;
    thickness1 = thickness-thickness_top;
    //#translate([0,0,0.01+thickness_bottom+thickness/2]) cube ([6.45,6.45,thickness], center=true);
    translate([0,0,thickness_bottom+0.01]) rotate([0,0,45]) cylinder(h=thickness1, r1=4.55, r2=4.75, $fn=4);
}

module m4_square_nut(){
    difference(){
        m4_square_nut_shell();
        cylinder(r=2, h=3, center=true);
    }
}

module node_plus(width){
        translate([0,0,thickness_total/2])
            cube([width, width, thickness_total], center=true);
}

module node_minus(width){
    translate([0,0,0.01])
    union(){
        m4_square_nut_shell_inflated();
        //translate([0,0,1]) m4_square_nut_shell();
        translate([0,0,thickness_total/2-0.05])cylinder(r=2.3, h=thickness_total+0.01, center=true, $fn=60);
    }
}

/* элемент, из которого строятся все детали */
module node(width) {
    difference(){
        node_plus(width);
        node_minus(width);
    }
}

/* node в разрезе */
module node_section(){
    intersection(){
        node(10);
        translate([-20,0,0]) cube([40,40,40], center=true);
    }
}

module node_lock90(width)
{
    angle=90;
    difference(){
        node_plus(width);
        union(){
            
            translate([width/2+0.05,width/2-thickness_total,0.3]) rotate([0,-90,0]) cube([20,15,width/4+0.05]);
            translate([0,width/2-thickness_total,0.3]) rotate([0,-90,0]) cube([20,15,width/4+0.05]);

            translate([width/4+0.5,width/2-0.3,0.3]) rotate([0,-90,0]) cube([20,15,20]);

            translate([-width/2-1,width/2-2,thickness_total/2])rotate([0,90,0]) cylinder(r=1.75/2, h=width+2, $fn=60);
        }
    }
}

module node_lock90_assim(width)
{
    angle=90;
    difference(){
        node(width);
        translate([width/2+0.025,width/2-thickness_total,0.3]) rotate([0,-90,0]) cube([20,15,width+0.05]);
    }
}

module node_corner90(width)
{
    union()
    {
        node_lock90(width);
        translate([0,width,0]) rotate([0,0,180]) node_lock90(width);
    }
}

module node_corner90_assim(width)
{
    difference(){
        union()
        {
            node_lock90_assim(width);
            translate([0,width,0]) rotate([0,0,180]) node_plus(width);
        }
        translate([0,width/2,width/2]) rotate([-90,0,0]) node_minus(width);
    }
}

module node_corner90_assim1(width)
{
    difference(){
        union()
        {
            node_lock90_assim(width);
            translate([0,width,0]) rotate([0,0,180]) node_plus(width);
        }
        union(){
            translate([0,width/2,width/2]) rotate([-90,0,0]) node_minus(width);
            translate([0,width,0]) node_minus(width);
        }
    }
}

//node_corner90_assim(10);