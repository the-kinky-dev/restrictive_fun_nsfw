use <form/roundedSquare.scad>
//$fa = 1;
//$fs = 0.4;


//cube([10,4,20], true);
module roundedPolygon(points, height, edgeR=2){
    ml=min(size[0], size[1], size[2])/2;
    er=ml<edgeR ? ml:edgeR;
    x=size[0]/2-er;
    y=size[1]/2-er;
    z=size[2]/2-er;
    translate([center ? 0 : size[0]/2, center ? 0 : size[1]/2, center ? 0 : size[2]/2])
    hull(){
        translate([x,y,z])sphere(r=er);
        translate([-x,y,z])sphere(r=er);
        translate([x,-y,z])sphere(r=er);
        translate([-x,-y,z])sphere(r=er);
        translate([x,y,-z])sphere(r=er);
        translate([-x,y,-z])sphere(r=er);
        translate([x,-y,-z])sphere(r=er);
        translate([-x,-y,-z])sphere(r=er);
    }
}