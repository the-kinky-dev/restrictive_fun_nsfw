$fa = 1;
$fs = 0.4;
module roundedCircle(d, w, hd=0, angle=360){
rotate_extrude(angle=angle)
    {
        if (hd!=0)translate([w/2+hd,0,0])circle(d=w);
        translate([d/2-w/2,0,0])circle(d=w);
        translate([hd==0 ? 0 :w/2+hd,-w/2,0])square([d/2-w-hd+(hd==0? w/2:0),w]);
    }
}
roundedCircle(20, 3, 0);