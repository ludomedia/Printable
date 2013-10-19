t = 0.4;
r = 57.5;
ep = 4.5;
e = 1.25;
nsup = 4;
ntrou = 22;

fixflat = 7 + 8;
fixw = 5;
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
			translate([e, -0.1, 0])
			cube([fixd - 2 * e, fixw + 1, fixflat]);
			translate([fixd/2, -0.1, 0])
			cube([fixd/2, fixw + 1, fixh]);
		}
	}
}

module anneau() {

	difference() {

		union() {
			difference() {
		
				difference() {
					cylinder(7, r+ep, r+ep);
					cylinder(7, r-ep, r-ep); 
				}

				translate([0, 0, 2]) {
					difference() {
						cylinder(5, r + ep - e, r + ep - e);
						cylinder(5, r - ep + e, r - ep + e); 
					}
				}

			}

			for( i = [0 : ntrou]) {
				rotate(5 + i * 360 / ntrou, [0, 0, 1]) {
					translate([r, 0, 0]) {
						cylinder(4, 4, 4);
					}
				}
			}

		}

		for( i = [0 : ntrou]) {
			rotate(5 + i * 360 / ntrou, [0, 0, 1]) {
				translate([r, 0, -2]) {
					# cylinder(12, 2.5 + t, 2.5 + t);
				}
			}
		}

	}

	for( i = [0 : nsup]) {
		rotate(5 + i * 360 / nsup, [0, 0, 1])
		translate([r + ep + e * 0.75, 0, 0])
		rotate(180, [0, 0, 1]) fix();
	}
}

difference() {
	anneau();
}
