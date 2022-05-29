board_primary_slope = 16;
board_secondary_slope = 15;
pocket_depth = 1.7;
echo (109.94-108.33);  //1.61

// Transformation: do the rotation.
module transform_top_board(lift_z=0) {
  translate([0, 0, lift_z]) {
    rotate(a=board_secondary_slope, v=[1, 0, tan(board_primary_slope)])
    rotate([0, -board_primary_slope, 0]) {
      children();
    }
  }
}

module untransform_top_board(lift_z=0) {
  rotate([0, board_primary_slope, 0])
  rotate(a=-board_secondary_slope, v=[1, 0, tan(board_primary_slope)]) {
    translate([0, 0, -lift_z]) {
      children();
    }
  }
}

module CAD_Sorter_basebox3_5()
{
    rotate(90, [1, 0, 0]) import("CAD-Sorter-basebox3-5.stl");
}

difference()
{
    untransform_top_board(-3.3) difference()
    {
        transform_top_board() translate([- 30, -40, -3.3] )   
        {
            union()
            {
                cube([110,110, 3.3+1.2]);
                hull()
                {
                    translate([0.5, 0.1, 3+1.2]) cube([109.3, 9, 6]);
                    translate([0.5, 8+0.1, 3+1.2]) cube([109.31, 3, 4.5]);
                    translate([0.52, 8+0.1, 3+1.2]) cube([109.32, 0.5, 12]);
                }
                translate([0,98.8,0]) hull()
                {
                    translate([0.5, 0.1, 3+1.2]) cube([109.3, 9, 6]);
                    translate([0.5, 8+0.1, 3+1.2]) cube([109.31, 3, 4.5]);
                    translate([0.52, 8+0.1, 3+1.2]) cube([109.32, 0.5, 12]);
                }
                translate([20.5, 40.9, 3+1.2]) rotate(-30, [0,0,1])cube([9, 22, 6]);
                translate([20.5+10, 40.9+14.5, 3+1.2])rotate(-3, [0,0,1])  cube([9, 54, 6.02]);
                hull()
                {
                    translate([101.6, 4, 3+1.2])  cube([9, 100, 6.02]);
                    translate([100+2, 7, 3+1.2])  cube([2, 100, 12.01]);
                }
                translate([20.5+10+2.7, 4+3, 3+1.2+2])  cube([3.4, 100, 9.6]);
            }
        }
        
        translate([-92.66-0.15,-30.58, -108-1]) linear_extrude(108+1+100)offset(delta=+0.3) projection(cut = false)  CAD_Sorter_basebox3_5();
        translate([-24, 15.3, -10.3])  cube([20.6, 40.6, 50]);
    }
    
}


//translate([-92.66-5,-30-5, -108]) CAD_Sorter_basebox3_5();
//translate([-92.66-5,-30-5, -108+pocket_depth]) CAD_Sorter_basebox3_5();
//rotate(90, [1, 0, 0]) import("CAD-Sorter-basebox3-5.stl");