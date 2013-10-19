t = 0.4;
r = 57.5;
ep = 4.5;
e = 1.5;
nsup = 16;
ntrou = 22;

fixflat = 10;
fixw = 10;
fixr = 2;
fixd = fixr * 2;
fixh = fixflat + fixr;

module fix() {
	translate([0, -fixw / 2, 0]) {
		difference() {
			union() {
				cube([fixd, fixw, fixflat]);
				translate([fixr, fixw/2, fixflat]) {
					rotate(90, [1, 0, 0])
					difference() {
					  cylinder(fixw, fixr, fixr, true);
					  cylinder(fixw, fixr - e, fixr - e, true);
					}
				}
			}
			translate([e, -0.1, 2])
			cube([fixd - 2 * e, fixw + 1, fixflat - 2]);
			translate([fixd/2, -0.1, 2])
			cube([fixd/2, fixw + 1, fixh - 2]);
		}
	}
}

module anneau() {

	difference() {
		cylinder(2, r+ep, r+ep);
		cylinder(2, r-ep, r-ep); 
	}


	for( i = [0 : nsup]) {
		if(i % (nsup/2) != 0) {
			rotate(5 + i * 360 / nsup, [0, 0, 1])
			translate([r + ep + 1.5 + e * 0.75, 0, 0])
			rotate(180, [0, 0, 1]) fix();
		}
	}
}

difference() {
	anneau();
}
