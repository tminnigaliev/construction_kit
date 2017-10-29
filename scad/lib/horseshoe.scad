include<settings.scad>

module horseshoe(width, r_mm, n_links)
{
    step_n = 3.14 * r_mm / 10;
    step = 3.14 / step_n;
    for (j = [0:1:(n_links-1)])
    {
        alpha_deg = j * step * 180 / 3.14;
        rotate([0,0,alpha_deg]) translate([0,r_mm,0]) rotate([0,0,0])
        {
            node_corner90(width);
            translate([0,20,0])node(width);
        }
    }
}

