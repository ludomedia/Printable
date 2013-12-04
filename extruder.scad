include <util.scad>;

//$fa = 1;
//$fs = 1;

sx = 53;
sy = 70;
sz = 34;

my = 20;
mx = 5;
mz = 5;

/* passage de la grosse visse */
ax = 31;
ay = my/2;

/* passage du filament */
fy = ay - 4;
fz = sz / 2;
fr = 2.5;

entre_axes = 36;

module fixation(l) {
	translate([-13, 8, 0]) vissixpans(7, 5, 4.5, l);
	translate([-13,-8, 0]) vissixpans(7, 5, 4.5, l);
	translate([ 13,-8, 0]) vissixpans(7, 5, 4.5, l);
	translate([ 13, 8, 0]) vissixpans(7, 5, 4.5, l);
}

module fixtube(b1, b2, tr) {
	translate([-5.3/2, -fy,  -10.5/2]) {
		cube([5.3, fy + 6, 10.5]);
	}
	// translate([-b1,-fy,-tr]) cube([b1,fy,tr*2]);
	// translate([5.3/2,-fy,-tr]) cube([5,fy,tr*2]);
	rotate(90, [0,1,0]) cylinder(b2 + 5.3/2, tr, tr);
	rotate(270, [0,1,0]) cylinder(b1, tr, tr);
}

difference() {
	cube([sx,sy,sz]);
	translate([mx,my,mz]) {
		cube([sx-mx,sy-my,sz-mz]);
	}
	translate([ax,ay,0]) {
		cylinder(sz, 7, 7);
		cylinder(5, 8.2, 8.2);
		translate([0,0,sz-5]) cylinder(5, 8.2, 8.2);
	}
	translate([ax,my+0.1,sz/2]) rotate(90,[1,0,0]) fixation(my+0.2);
	translate([0,fy,fz]) rotate(90,[0,1,0]) # cylinder(sx, fr, fr);
	translate([ax,fy - 8,fz]) cylinder(8, 12, 12, true);
	translate([10, fy, fz]) fixtube(11, 12, 3.3);
 	translate([ax,ay + entre_axes,mz/2]) rotate(90, [0,0,1]) nema17(mz, 2);
}


