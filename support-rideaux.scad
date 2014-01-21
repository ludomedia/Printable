include <util.scad>;

$fa = 1;
$fs = 1;

h = 20;
e = 6;
ez = 3;
d = 28.5;
ec = 4;

difference() {

	translate([0,0,h/2]) {
		difference() {
			ovale(d+e, d+ec, h);
			translate([0,0,ez/2]) {
				ovale(d, d+ec-e, h-ez);
			}
			translate([ ( (d+e)/2+ec )/2 + 1,0,ez/2]) {
				cube([(d+e)/2,d+e,h-ez], true);
			}
		}
	}
	translate([5,0,0]) {
		cylinder(ez, 2, 2);
		translate([0,0,ez/2]) {
			# cylinder(ez/2, 2, 4);
		}
	}
}
