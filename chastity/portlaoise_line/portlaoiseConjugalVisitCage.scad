include <../../personalDimensions.scad>
use <../../lib/form/roundedCube.scad>
use <../../lib/form/roundedPyramid.scad>
use <../../lib/lock/padLock.scad>
use <../../lib/logo.scad>
use <../../lib/form/roundedCircle.scad>
use <../../moduleConfig.scad>
use <lib/glansRing.scad>
use <lib/slit.scad>
use <portlaoiseRing.scad>

$fa = 2;
$fs = 0.6;

module portlaoiseConjugalVisitCage() {
    pd = penisFlacidDiameter;
    w = portlaoiseConjugalVisitCageConfig("wallWidth");
    innerLength = portlaoiseConjugalVisitCageConfig("innerLength");

    connector(6, -3);
    module cageHull() {
        difference() {
            union() {
                translate([ -innerLength + 1, 0, pd / 2 ]) smallRing(pd / 2 + 2.3);
                translate([ 0, 0, pd / 2 ]) rotate([ 0, -90, 0 ]) straight(innerLength, pd / 2, pd / 2 + 2);
            }
            if (portlaoiseConjugalVisitCageConfig("hasSlit")) translate([ -innerLength + slitConfig("length"), 0, -8 ]) color("blue") slitForm();
        }
        if (portlaoiseConjugalVisitCageConfig("hasSlit")) rotate([ 0, -1.5, 0 ]) translate([ -innerLength + slitConfig("length") + .4, 0, -1.3 ]) slitEdge();
    }
    module frontPlate(){
        fpw=6;
        fpr=pd / 2 + .5;
        difference(){
            translate([-1,0,3])scale([1.2,1,1])roundedCircle(2*fpr+6, fpw);
            translate([0,0,-1])cylinder(r=fpr-.5, h=fpw+2);
        }
         translate([ 0, 0, 0 ]) glansRing(fpr, penisNeckFlacidDiameter / 2 - 2, fpw);
    }
        difference()
        {
    translate([-14,0,17])rotate([0,90+portlaoiseRingConfig("flapAngle"),0])frontPlate();
    translate([0,-25,0]) cube([50,50,50]);
        }

    difference() 
    {
        cageHull();
    
    translate([9,0,5])rotate([ 0, -90 + portlaoiseRingConfig("flapAngle"), 0 ]) cylinder(d = 50, h = 20);
    }
//        translate([ -6, 0, pd / 2 ]) rotate([ 0, 90+roundFlappedRingConfig("flapAngle"), 0 ]) glansRing(pd / 2 + .5, penisNeckFlacidDiameter / 2 - 2, 6);

    module smallRing(r = pd / 2) { rotate([ 0, 90, 0 ]) rotate_extrude() translate([ r + w / 2, 0 ]) circle(d = w + 1); }

    module straight(l = 30, r1 = pd, r2 = pd) {
        linear_extrude(l, scale = r2 / r1) form();

        module form(d = pd) {
            difference() {
                circle(d = d + 2 * w);
                circle(d = d);
            }
        }
    }

    module connector(zoff, xoff) {
        translate([ -5 + xoff, 0, pd + w + 6 + zoff ]) {
            translate([ 0 - 2, 0, 1 ]) rotate([ 0, 0, -90 ]) mirror([ 1, 0, 0 ]) padLockConnectorStick(10, 4);
            difference() { translate([ 6, 0, -0.5 ]) roundedPyramid([ 4, 25 ],29, [ 4, 15 ], topOffset = [ 0, 0 ]); }
            translate([ 4, 0, 14 ]) roundedCube([ 8, 15, 3 ]);
        }
    }
}
translate([ 2.5, 0, 22.6 ]) rotate([ 0, 90, 0 ]) % portlaoiseRing();
rotate([ 0, 90-portlaoiseRingConfig("flapAngle"), 0 ])
 portlaoiseConjugalVisitCage();