
$fa = 2;
$fs = 0.6;

module glansRing(outerR, innerR, width) {
    gapWidth = 4;
    outerD = outerR * 2;
    innerD = innerR * 2;
        h=outerR-innerR;
    edgeR=min(2, h/2, width/2);
 //   edgeR=edgeD/2;

    module form(){
         hull()
        {
        translate([edgeR,edgeR])circle(r=edgeR);
        translate([edgeR,width-edgeR])circle(r=edgeR);//square(1);
        translate([h-1,0])square(1);
        translate([h-1,width-1])square(1);
        }

    }


        difference()
    {
        //
        
    rotate_extrude()
    translate([innerR,0,0])
    form();
                translate([40,0,10])color("cyan")cube([80,2*gapWidth,20], center=true);
     }

   gapEdge();
   mirror([ 0, 1, 0 ]) gapEdge();

    module gapEdge() {
        x=(innerR-sqrt(innerR^2-gapWidth^2));
      hull()
        {
        translate([innerR-x+edgeR,gapWidth,edgeR])sphere(r=edgeR);
        translate([innerR-x+edgeR,gapWidth,width-edgeR])sphere(r=edgeR);
    //    translate([outerR-x+edgeR,gapWidth,edgeR])
        translate([outerR-x,gapWidth,edgeR])
        rotate([0,-90,0])cylinder(r=edgeR, h=outerR-innerR-edgeR);
        translate([outerR-x,gapWidth,width-edgeR])
        rotate([0,-90,0])cylinder(r=edgeR, h=outerR-innerR-edgeR);
    
     }
    }

}
glansRing(17, 12, 8);