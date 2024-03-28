$fa = 1;
$fs = 0.4;

module roundedSquare(size, radius=0, center=false){
    a=len(size)==2?size[0]:size;
    b=len(size)==2?size[1]:size;
    min=min(a,b);
    r= radius==0 ? min/4 : radius;
    translate([center?-a/2:0, center?-b/2:0])
    hull(){
        translate([r,r]) circle(r=r);
        translate([r,b-r]) circle(r=r);
        translate([a-r,b-r]) circle(r=r);
        translate([a-r,r]) circle(r=r);
    }
}
color("blue") roundedSquare([10,5], center=true, radius=1);