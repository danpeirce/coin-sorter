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
    translate([-92.66-5,-30-5, -108+pocket_depth]) linear_extrude(108)offset(delta=+5) projection(cut = false)  CAD_Sorter_basebox3_5();
    translate([-5+0.3, 0, 0]) scale([1.2,1,1]) translate([-92.66-0.3,-30-5, -108-1]) linear_extrude(108+1)offset(delta=+0.3) projection(cut = false)  CAD_Sorter_basebox3_5();
    transform_top_board() translate([-30-92.66,-60,0]) cube([200,90,50]);
    translate([-90-40, -55, -110]) cube([40,60,120]);
}
//translate([-92.66-5,-30-5, -108+pocket_depth]) CAD_Sorter_basebox3_5();
//rotate(90, [1, 0, 0]) import("CAD-Sorter-basebox3-5.stl");