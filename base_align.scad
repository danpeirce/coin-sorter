pocket_depth = 1.7;

module footprint()
{
    translate([0, 0, 2])
        linear_extrude(5)offset(0.3) projection(cut = true) 
            translate([5,5,-1]) rotate([90, 0, 0])
            {
                import("CAD-Sorter-basebox1-2.stl");
                translate([81.1,0,0]) import("CAD-Sorter-basebox3-5.stl");
            }
}

module platform()
{
    difference()
    {
        cube([185,45, 2+ pocket_depth]);
        footprint();
    }
}

intersection()
{
    platform();
    translate([-1, -1,-1])cube([ 105+1, 45+1, 2+pocket_depth+1+1]);
}

translate([-105, 50, 0]) difference()
{
    platform();
    translate([-1, -1,-1])cube([ 105+1, 45+1, 2+pocket_depth+1+1]);
}