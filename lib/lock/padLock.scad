use <../../moduleConfig.scad>
use <../form/roundedCube.scad>
$fa = 1;
$fs = 0.4;


module padLock(withSpaceForTimer = false)
{
    barWidth=padLockConfig("barWidth");
    barHeight=padLockConfig("barHeight");
    height=padLockConfig("height");
    width=padLockConfig("width");
    length=padLockConfig("length");
    r=(length-width)/2;

    h=barHeight-width+.1;
    
    cube([length, width, height]);
    translate([width/2,0,0]) bar(h);
    translate([length-width/2,0,0]) bar(20,withSpaceForTimer ? padLockConfig("timeLockWidth") : barWidth);
    roundedBar();
    module bar(length, w=barWidth)
    {
        translate([0, width/2,height]) cylinder(d=w, h=length);
    }

    module roundedBar()
    {
        translate([length/2,width/2,height+h-.1]) 
        rotate([90,0,0])rotate_extrude(angle=180) 
        translate([r, 0, 0])circle(d=barWidth);
    }
}

module padLockTemplate(withAddition=true)
{
    barWidth=padLockConfig("barWidth");
    barHeight=padLockConfig("barHeight");
    height=padLockConfig("height");
    width=padLockConfig("width");
    length=padLockConfig("length");
    r=(length-width)/2;
    translate([-length*1.08/2, 0 ,0]) scale([1.08, 1.08, 1.08]) 
    {
        {
            padLock(padLockConfig("timeLockWidth")>0);
            if (withAddition){
                difference(){
                    translate([0,0,barHeight-r])union(){
                        translate([width-barWidth,width/2-barWidth/2,height-barHeight+11]) cube([length-width, barWidth, barHeight*2-11]);
                        translate([width/2,width/2,height-.1]) cylinder(d=barWidth, h=barHeight);
                        translate([length-width/2,width/2,height-.1]) cylinder(d=barWidth, h=barHeight);
                    }
                    translate([(length)/2,25,height+r+barWidth/2-2])rotate([90,0,0])cylinder(r=r-barWidth/2+barWidth/2, h=50);
                }
            }

        }
    }
}



//padLock();

//translate([padLockConfig("length")/2*0.96 ,padLockConfig("width")*2, -padLockConfig("height")*.08]) 
//padLockTemplate();

module padLockConnectorHole(connectorWidth){
    difference()
    {
        roundedCube([connectorWidth*2, padLockConfig("width")*1.6, connectorWidth*2]);
        translate([-24.1,-padLockConfig("width")/2,6]) rotate([0,90,0])padLockTemplate();
        cube([connectorWidth, 100-.1, connectorWidth], center=true);
    }
}

module padLockConnectorStick(connectorWidth, length=10, insertDepthMarker= false){
   difference(){
        translate([0,length/2,0])roundedCube([connectorWidth*.95,padLockConfig("width")*1.6+length, connectorWidth*.95]);
        translate([-24,-padLockConfig("width")/2,6]) rotate([0,90,0])padLockTemplate();
    }
//    translate([0,0,-1])
if (insertDepthMarker)
    color("cyan")
        translate([-connectorWidth/2,padLockConfig("width")*.8,-connectorWidth/2])cube([connectorWidth,.1,connectorWidth]);
}
/*
translate([20,0,5])rotate([90,0,0])
padLockConnectorHole(10);

translate([0,20,0])
*/
padLockTemplate(true);
//padLock();

//mirror([1,0,0])padLockConnectorStick(10, 30, true);