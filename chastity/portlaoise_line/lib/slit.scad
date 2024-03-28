$fa = 2;
$fs = 0.6;
function slitConfig(name) = name == "length" ? 35 : (
                            name == "innerWidth" ?  3 : (
                            name == "outerWidth" ? 8 : (
                            name == "edgeWidth" ? 3 :
                                undefined
                            )));

    module slitForm(){
        length=slitConfig("length");
        w=slitConfig("edgeWidth");
        sox=slitConfig("outerWidth")/2+w/2;
        six=slitConfig("innerWidth")/2+w/2;

        linear_extrude(20)
        {
            polygon([[0,-six], [0,six], [-length-4, sox+1],[-length-4,-sox-1]]);
            circle(d=6);
        }

    }

    module slitEdge(w){
        alpha=5.5;
         length=slitConfig("length");
        w=slitConfig("edgeWidth");
        sox=slitConfig("outerWidth")/2+w/2;
        six=slitConfig("innerWidth")/2+w/2;
        color("red"){
            cy();
            mirror([0,1,0])cy();
            translate([-1,0,0])rotate([0,0,-90])rotate_extrude(angle=180)translate([six,0,0])circle(d=w);
        }
        module cy(){
        rotate([0,0,-alpha])translate([-length,sox-2.6,0])sphere(d=w);
        translate([0,sox-2.6,0]) rotate([0,-90,-alpha]) cylinder(h=length-0, d=w);
        }
    }
slitForm();
slitEdge();


