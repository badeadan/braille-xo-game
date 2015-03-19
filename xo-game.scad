use <braille-letter.scad>

spacing = 2.5;
distance = 5 + spacing;     
plate_height = 14;
plate_thickness = 2;
border = 2;
border_h = 3;

l = ((plate_height+0.4)*3 + 4*border)/3;
w = ((distance+0.2)*3 + 4*border)/3;

module xo_base() {
	difference() {
		cube([l*3,w*3,plate_thickness+border_h]);
		translate([border,border,plate_thickness])
			cube([l*3-2*border,w*3-2*border,border_h]);
	}

	translate([l*1-border/2,0,0]) cube([border,w*3,plate_thickness+border_h]);
	translate([0,w*1-border/2,0]) cube([l*3,border,plate_thickness+border_h]);

	translate([l*2-border/2,0,0]) cube([border,w*3,plate_thickness+border_h]);
	translate([0,w*2-border/2,0]) cube([l*3,border,plate_thickness+border_h]);
}

xo_base();

translate([0,w*3+16,plate_height])
	rotate([90,90,0])
	braille_str("00000");

translate([(distance+spacing)*5-spacing,w*3+10,plate_height])
	rotate([90,90,180])
	braille_str("11111");

