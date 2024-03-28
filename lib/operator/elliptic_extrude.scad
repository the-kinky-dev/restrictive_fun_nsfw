/*
 *
 *  The form to be extruded needs to be centered!
 *
 */
module elliptic_extrude(a, b, angle = 360, step = 1) {
    f = a ^ 2 / b ^ 2;
    function r(phi) = sqrt(a ^ 2 * b ^ 2 / (b ^ 2 * cos(phi) ^ 2 + a ^ 2 * sin(phi) ^ 2));
    function k(x, y) = a ^ 2 / b ^ 2 * y / x;
    function x(phi) = r(phi) * cos(phi);
    function y(phi) = r(phi) * sin(phi);
    function alpha(k) = atan(k);
    rotate([90,0,0]){
    for (phi = [0:step:angle - step]) {
        hull() {
            rotate([ 0, phi, 0 ]) translate([ r(phi), 0, 0 ]) rotate([ 0, alpha(k(x(phi), y(phi))) - phi, 0 ]) linear_extrude(.1) children(0);
            rotate([ 0, phi + step, 0 ]) translate([ r(phi + step), 0, 0 ]) rotate([ 0, alpha(k(x(phi + step), y(phi + step))) - phi - step, 0 ])
                linear_extrude(.1) children(0);
        }
    }
    }
}

elliptic_extrude(20, 10, 270, 5) square(5, center = true);