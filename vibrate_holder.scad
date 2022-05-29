
module vibrate_holder()
{
    union()
    {
        difference()
        {
            cube([20, 40, 70]);
            translate([2, 2, -1]) cube([20-2*2, 40-2*2, 70+5]);
        }
        translate([1, -15+5, 0.001]) cube([18, 16-5, 30]);
    }
}

translate([0, 0, -30]) vibrate_holder();