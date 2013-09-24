$fs = 1;
r = 57.5;
ep = 9;
h = 7;

module forme(e, h) {
	translate([-h,0,0]) circle(r = e/2);
	translate([-h/2, 0, 0]) square ([h,e],center = true);
}

//forme(ep, h);

difference() {

   rotate_extrude(convexity = 10)
	translate([r, 0, 0]) rotate(-90,[0,0,1]) forme(ep, h);

	rotate_extrude(convexity = 10)
	translate([r, 0, 0]) rotate(-90,[0,0,1]) forme(ep-4, h-2);

}