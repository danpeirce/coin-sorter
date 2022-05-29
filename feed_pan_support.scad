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


difference()
{
    translate([0, 0, -30]) cube([43+5, 63, 30+33]);
    translate([40, 60, 30])transform_top_board() translate([-110, -110, 0])  
            cube([110,110, 60]);
    translate([40, 60, 33])transform_top_board() translate([-110, -110, 0])  
            cube([130,130, 60]);
    translate([39, 55, -31]) cylinder(h=31, d=10.5, $fn=50);
    translate([7, 55, -31]) cylinder(h=31, d=10.5, $fn=50);
    translate([7, 8, -31]) cylinder(h=31, d=10.5, $fn=50);
    translate([39, 8, -31]) cylinder(h=31, d=10.5, $fn=50);
    translate([24, 32, -31]) cylinder(h=31, d=40, $fn=8);
}
    

