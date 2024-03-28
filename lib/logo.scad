use <form/roundedCircle.scad>
logoLetters = "RF";

$fa = 1;
$fs = 0.4;
module logo(d = 20, h = 2, inverted = false) {
    l = d * .38;
    cl = l - 2 * h + 1;
    cw = h / 2;
    if (inverted) {
        translate([ 0, 0, .1 ]) rotate_extrude() translate([ d / 2, 0 ]) square(h);
        translate([ 0, 0, 2 * h ]) scale([ 1, 1, 2 ]) mirror([ 0, 0, 1 ]) {
            translate([ -cl * 1.5 - cw, -d / 5, h / 2 - cw + 2.1 ]) rotate([ 180, 0, 0 ]) chain(3, false, cl, cw);
            translate([ -cl * 1.5 - cw, -d / 5, h / 2 ]) chain(3, true, cl, cw);
        }

        translate([ -d * .4, -d / 20, 0.1 ]) linear_extrude(h) text(logoLetters, font = "UnifrakturMaguntia", size = d / 3);

    } else {
        translate([0,0,h/4])roundedCircle(d = d, w = h/2);
//        linear_extrude(h / 2) circle(d = d);
        translate([ -cl * 1.5 - cw, -d / 5, h / 2 ]) chain(3, true, cl, cw);
        translate([ -cl * 1.5 - cw, -d / 5, h/4 ]) chain(3, false, cl, cw);
        translate([ -d * .4, -d / 20, 0 ]) linear_extrude(h) text(logoLetters, font = "UnifrakturMaguntia", size = d / 3);
//        translate([ 0, 0, h / 4 ]) rotate_extrude() translate([ d / 2, 0, 0 ]) circle(d = h / 2);
    }
}

module chain(numLinks = 10, negative = false, linkLength, linkWidth) {
    for (i = [0:numLinks - 1]) {
        if (negative && i % 2 == 0) {
            translate([ linkLength * i, 0, 0 ]) _chainLink(linkLength, linkWidth);
        } else if (!negative && i % 2 == 1) {
            rotate([ 90, 0, 0 ]) translate([ linkLength * i, 0, 0 ]) _chainLink(linkLength, linkWidth, true);
        }
    }
    module _chainLink(innerLength, d, half = false) {
        translate([ d, 0, 0 ]) rotate([ 0, 0, 90 ]) {
            translate([ 0, -d / 2, 0 ]) rotate_extrude(angle = half ? 90 : 180) translate([ d, 0, 0 ]) circle(d = d);
            translate([ 0, -innerLength + d, 0 ]) mirror([ 0, 1, 0 ]) rotate_extrude(angle = half ? 90 : 180) translate([ d, 0, 0 ]) circle(d = d);

            translate([ d, -d / 2, 0 ]) rotate([ 90, 0, 0 ]) cylinder(h = innerLength - 3 / 2 * d, d = d);
            if (!half) translate([ -d, -d / 2, 0 ]) rotate([ 90, 0, 0 ]) cylinder(h = innerLength - 3 / 2 * d, d = d);
        }
    }
}

module logoLong(h = 2, w = 8, l = 50, angles = [ 0, 0, 0 ]) {
    margin = w / 3;
    fontHeight = w - 2;
    fontLength = 14 * 6 / fontHeight;
    cl = (l - fontLength - 2 * margin) / 2;
    lw = h / 2;
    ll = 4 * lw;
    numLinks = floor(cl / -1.5);
    echo(numLinks, cl, lw, fontLength);
    difference() {
        union() {
            translate([ -l / 2, 0, 0 ]) cylinder(h = h / 2, d = w);
            translate([ 0, 0, h / 4 ]) cube([ l, w, h / 2 ], center = true);
            translate([ l / 2, 0, 0 ]) cylinder(h = h / 2, d = w);
        }
//        translate([-10,0,0])rotate([90,0,0])_chainLink(10,2);
        translate([ fontLength / 2 + margin, 0, h / 2 ]) chain(numLinks, true, ll, lw);
        translate([ -fontLength / 2 - numLinks * ll - margin - lw, 0, h / 2 ]) chain(numLinks, true, ll, lw);
    }
    translate([ fontLength / 2 + margin, 0, 0 ]) chain(numLinks, false, ll, lw);
    translate([ -fontLength / 2 - numLinks * ll - margin - lw, 0, 0 ]) chain(numLinks, false, ll, lw);
    color("blue") translate([ -fontLength / 2, -w / 2 + 1, 0 ]) linear_extrude(h) text(logoLetters, font = "UnifrakturMaguntia", size = fontHeight);
    
}
//    _chainLink(10,2);
//    translate([10,0,0])rotate([90,0,0])_chainLink(10,2);

translate([ -25, 0, 0 ]) logo(d = 20, inverted = false);
// logoLong(l=100);//

// chain(3, false, 10,2);

//_chainLink(10,2);
difference() {
    cube([ 50, 50, 2 ]);
    translate([ 25, 25, 0 ]) logo(d = 20, inverted = true);
}

//translate([ 25, -12, 0 ]) logoLong(h = 2, w = 8, l = 50, angles = [ 0, 0, 0 ]);