$fa = 1;
$fs = 1;

h = 7.5;

# translate([0, 0, 5]) cylinder(40, 2.5, 2.5);

# cylinder(5, 0, 2.5);

translate([0, 0, h]) cylinder(3, 2.5, 25);
translate([0, 0, h+3]) cylinder(2, 25, 25);
translate([0, 0, h+5]) cylinder(3, 25, 2.5);

