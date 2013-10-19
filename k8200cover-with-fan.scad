i = 32.5;

difference() {

	union() {
		import("C:/Users/marcha/Documents/GitHub/Printable/k8200boardcover.stl");
		translate([0,0,49]) cube([44,94,2], true);
	}

	translate([0,0,49]) {
		cylinder(2, 19, 19, true);
	}

	translate([-i/2,-i/2,49]) cylinder(2, 1.8, 1.8, true);
	translate([ i/2,-i/2,49]) cylinder(2, 1.8, 1.8, true);
	translate([-i/2, i/2,49]) cylinder(2, 1.8, 1.8, true);
	translate([ i/2, i/2,49]) cylinder(2, 1.8, 1.8, true);
	

}