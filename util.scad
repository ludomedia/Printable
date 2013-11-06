$fa = 1;
$fs = 1;

module sixpans(d, h) {

	for(i=[0:60:120]) 
	rotate(i, [0,0,1]) cube([d,d*tan(30),h], true);
}

module ovale(d, l, h) {
	translate([-(l-d)/2,0,0]) cylinder(h, d/2, d/2, true);
	translate([(l-d)/2,0,0])	cylinder(h, d/2, d/2, true);
	cube([l-d,d,h],true);
}

ovale(5, 10, 3);
//sixpans(8, 3);