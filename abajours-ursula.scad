$fa = 1;
$fs = 1;

rint1 = 3.7;
rint2 = 4.9;
rext2 = 22;
rext1 = rext2-2;

mint = rint1 + (rint2-rint1)/2;
mext = rext1 + (rext2-rext1)/2;
rdif =  mext - mint;

hext = 2;
hint = 8;

difference() {
	cylinder(hext, rext2, rext2);
	cylinder(hext, rext1, rext1);
}

difference() {
	cylinder(hint, rint2, rint2);
	cylinder(hint, rint1, rint1);
}

for(i=[0:90:270]) {
	rotate(i, [0,0,1]) {
		translate([mint + rdif/2, 0, hext/2]) {
			cube([rdif,2,hext], true);
		}
	}
}