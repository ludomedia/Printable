$fa = 1;
$fs = 1;

// cube([20, 10, 10]);


difference() {
	union() {
		cylinder(15, 5, 0);
		translate([0, 0, 13]) sphere(2);
	}
	translate([0, 0, -1]) cylinder(15, 5, 0);
}

