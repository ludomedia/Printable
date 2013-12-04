/* Tête de vis six pans
	d = distance plat à plat opposé. 
 	h = épaisseur de l'écrou 
*/
module sixpans(d, h) {

	for(i=[0:60:120]) 
	rotate(i+30, [0,0,1]) cube([d,d*tan(30),h], true);
}

/* Ovale plat (pour trous coulissants)
	d = diamètre du trou
   l = longueur du trou 
	h = épaisseur du trou
*/
module ovale(d, l, h) {
	translate([-(l-d)/2,0,0]) cylinder(h, d/2, d/2, true);
	translate([(l-d)/2,0,0])	cylinder(h, d/2, d/2, true);
	cube([l-d,d,h],true);
}

/* Trous pour un moteur Nama 17
	h = épaisseur des trous
	j = jeu de glissement
*/
module nema17(h, j) {
	translate([-15.5,-15.5,0]) ovale(3.5, 3.5 + j, h);
	translate([ 15.5,-15.5,0]) ovale(3.5, 3.5 + j, h);
	translate([-15.5, 15.5,0]) ovale(3.5, 3.5 + j, h);
	translate([ 15.5, 15.5,0]) ovale(3.5, 3.5 + j, h);
	ovale(24, 24 + j, h);
}

/* Vis six pans
	de = distance plat à plat opposé de la tête
 	he = épaisseur de la tête
	dv = diamètre de la vis
	l = longueur totale de la vis
*/
module vissixpans(de, he, dv, l) {
	translate([0,0,he/2]) sixpans(de, he);
	cylinder(l, dv/2,dv/2);
}

//vissixpans(6, 3, 3, 20);
//nema17(3, 2);
//ovale(5, 10, 3);
//sixpans(8, 3);