$fa = 1;
ep = 3;

module cercle(rext) {
	difference() {
		cylinder(ep, rext, rext, true);
		cylinder(ep, rext-1.5, rext-1.5, true);
	}
}

translate([0,0,ep/2]) {

//	cercle(26);

	for(i =[0:72:360]) {

		rotate(i, [0,0,1]) translate([8.5, 0, 0]) cercle(17.5);
	}

}