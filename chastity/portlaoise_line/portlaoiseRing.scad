include <../../personalDimensions.scad>
use <../../moduleConfig.scad>
use <../../lib/form/roundedCube.scad>
use <../../lib/lock/padLock.scad>
use <../../lib/logo.scad>

$fa = 2;
$fs = 0.8;

module portlaoiseRing() {
    d = penisFlacidDiameter + 6;
    y = d / 2 + 12;
    co = 12;
    ch = d + 2 * co;
    r1 = portlaoiseRingConfig("flapRadius1");
    r2 = portlaoiseRingConfig("flapRadius2");
    l = portlaoiseRingConfig("flapLength");
    maxPhi1 = 180 * l / r1 / PI;

    {
        difference() {
            baseRing();
            translate([ -20, -5, ch / 2 - 9 ]) rotate([ 0, -portlaoiseRingConfig("flapAngle"), 0 ]) cube([ 40, 10, 10 ]);
        }
//        translate([ -4, 0, -ch / 2 - 4 ]) rotate([ 0, -portlaoiseRingConfig("flapAngle"), 0 ]) flap();
    }
    //    flap();
    echo(r2 / r1);

    module baseRing() {
        y = d / 2 + 10;
        upperPart();
        lowerPart();

        module upperPart() {
            translate([ -4, 0, 0 ]) rotate([ 90, -6, 90 ]) rotate_extrude(angle = 168) translate([ d / 2 + 9, 0 ]) circle(d = 8);
            translate([ -4, d / 2 + co, -y + 2 ]) rotate([ 6, 0, 0 ]) translate([0,0,-5])cylinder(h = y + 8, d = 8);
            translate([ -4, -d / 2 - co, -y + 2 ]) rotate([ -6, 0, 0 ]) translate([0,0,-5])cylinder(h = y + 8, d = 8);
            translate([ -4 - sin(portlaoiseRingConfig("flapAngle")) * 10, 0, -y ]) rotate([ 0, 0, 0 ]) translate([ -0.5, 0, ch + 1 ])
                rotate([ -portlaoiseRingConfig("flapAngle"), 0, 90 ]) padLockConnectorHole(10);
        }

        module lowerPart() {
            lw = 12;
            translate([1,0,-6]){
                translate([ 0, 0, r2 - 32.75 ]) rotate([ -27, 0, 0 ]) rotate([ 0, 90, 0 ]) rotate_extrude(angle = 54) translate([ r2, -lw / 2 ])
                    circle(d = lw);
                translate([ -6, -d / 2 - co + 1, -y + 3.5 ]) sphere(d = lw);
                translate([ -6, +d / 2 + co - 1, -y + 3.5 ]) sphere(d = lw);
                translate([ -4, 0, -ch / 2 - 4 ]) rotate([ 0, -portlaoiseRingConfig("flapAngle"), 0 ]) flap();
            }
        }
    }
    module flap() {
        intersection() {
            difference() {
                translate([ 0, 0, r1 + 5 ]) scale([ 1, .72, 1 ]) sphere(r = r1);
                translate([ 0, 0, r1 + 5 ]) scale([ 1, .72, 1 ]) sphere(r = r1 - 3);
                translate([ -l * .65, 0, 22 ]) rotate([ 0, portlaoiseRingConfig("flapAngle"), 0 ]) rotate([ 0, 0, 90 ]) mirror([ 1, 0, 0 ])
                    logo(inverted = true);
            }
            linear_extrude(100) hull() scale([ .98, .95 ]) projection() edge();
        }

        edge();
        if (portlaoiseRingConfig("hasNubs")) {
            translate([ 0, 0, r1 + 10.5 ]) {
                rotate([ 0, maxPhi1 * .86, 0 ]) translate([ 0, 0, -r1 ]) sphere(r = 4);
                rotate([ 0, maxPhi1 * .78, 0 ]) translate([ 0, 8, -r1 ]) sphere(r = 4);
                rotate([ 0, maxPhi1 * .78, 0 ]) translate([ 0, -8, -r1 ]) sphere(r = 4);
                rotate([ 0, maxPhi1 * .7, 0 ]) translate([ 0, 0, -r1 ]) sphere(r = 4);
            }
        }

        module edge() {
            function maxPhi2(phi1) = sqrt(a ^ 2 * (1 - r1 ^ 2 * sin(phi1) ^ 2 / l ^ 2));
            maxPhi2 = 20;
            a = r2 * sin(maxPhi2);
            //    b = l;
            phi1Step = 3;
            color("blue") translate([ 0, 0, r1 + 6.5 ]) {
                for (phi1 = [0:phi1Step:maxPhi1]) {
                    hull() {
                        rotate([ 0, phi1, 0 ]) translate([ 0, 0, -r1 + r2 ]) rotate([ maxPhi2(phi1), 0, 0 ]) translate([ 0, 0, -r2 ]) sphere(d = 4);
                        rotate([ 0, phi1 + phi1Step, 0 ]) translate([ 0, 0, -r1 + r2 ]) rotate([ maxPhi2(phi1 + phi1Step), 0, 0 ])
                            translate([ 0, 0, -r2 ]) sphere(d = 4);
                    }
                    hull() {
                        rotate([ 0, phi1, 0 ]) translate([ 0, 0, -r1 + r2 ]) rotate([ -maxPhi2(phi1), 0, 0 ]) translate([ 0, 0, -r2 ]) sphere(d = 4);
                        rotate([ 0, phi1 + phi1Step, 0 ]) translate([ 0, 0, -r1 + r2 ]) rotate([ -maxPhi2(phi1 + phi1Step), 0, 0 ])
                            translate([ 0, 0, -r2 ]) sphere(d = 4);
                    }
                }
                d = penisFlacidDiameter + 6;
            }
            color("blue") {
                translate([ 0, 0, r1 + 6.5 ]) hull() {
                    rotate([ 0, maxPhi1 + phi1Step, 0 ]) translate([ 0, 0, -r1 + r2 ]) rotate([ maxPhi2(maxPhi1 + phi1Step), 0, 0 ])
                        translate([ 0, 0, -r2 ]) sphere(d = 4);
                    rotate([ 0, maxPhi1 + phi1Step, 0 ]) translate([ 0, 0, -r1 + r2 ]) rotate([ -maxPhi2(maxPhi1 + phi1Step), 0, 0 ])
                        translate([ 0, 0, -r2 ]) sphere(d = 4);
                }
            }
        }
    }
}
 rotate([ 0, 90, 0 ])
portlaoiseRing();