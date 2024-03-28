module roundedPyramid(baseSize, height, topSize=[0,0], edgeR=2, center=true, topOffset=[0,0,0]){
    ml=min(baseSize[0], baseSize[1])/2;
    er=ml<edgeR ? ml:edgeR;
    bx=baseSize[0]/2-er<0?0:baseSize[0]/2-er;
    by=baseSize[1]/2-er<0?0:baseSize[1]/2-er;
    tx=topSize[0]/2-er<0?0:topSize[0]/2-er;
    ty=topSize[1]/2-er<0?0:topSize[1]/2-er;
    translate([center?0:baseSize[0]/2,center?0:baseSize[1]/2,center?-height/2:0])
    hull(){
        translate([bx, by, 0])sphere(r=er);
        translate([-bx, by, 0])sphere(r=er);
        translate([bx, -by, 0])sphere(r=er);
        translate([-bx, -by, 0])sphere(r=er);
        translate(topOffset){
        translate([tx, ty, height])sphere(r=er);
        translate([-tx, ty, height])sphere(r=er);
        translate([tx, -ty, height])sphere(r=er);
        translate([-tx, -ty, height])sphere(r=er);
    }
    }
}

roundedPyramid([20,20], 10,[10,10], 2, true,[5,0,0]);