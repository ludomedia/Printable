slh = 0.5;
ep = 1;
$fs = 1;
r1 = 35/2;
r2 = 10;
br = 4;

baseh = 3;
basew = 38;
pt = 30.5/2;

module flow(h, r1, r2, sh, e) {
	rotate_extrude(convexity) {
		for(i=[0:sh:(h/sh)-sh]) {
			translate([r2 + (r1-r2) * (1+cos(i*180/h*sh)) / 2 - e,sh*i,0]) {
				square([e,sh]);
			}
		}
	}
}

module trou() {
	cylinder(baseh, 2, 2);
}

difference() {
	translate([0,0,baseh/2]) {
		difference() {
		   minkowski() {
				cylinder(baseh/2, br/2, br/2, true);
				cube([basew - br/2, basew - br/2, baseh/2], true);
			}
			cylinder(baseh, r1-ep, r1-ep, true);
		}
	}
	translate([pt,pt,0]) trou();	
	translate([-pt,-pt,0]) trou();	
	translate([pt,-pt,0]) trou();	
	translate([-pt,pt,0]) trou();	
}

translate([0,0,3]) {
	flow(30, r1, r2, slh, ep);
	
	translate([0,0,30]) {
		difference() {
			cylinder(10, r2, r2);
			cylinder(10, r2- ep, r2 - ep);
		}
	}
}


