// measure around your neck
collarSize=420;
// measure around your wrist
wristCircumference=180;


/* [Glans measurements] */
// measure the glans length on top
glansTopLength=28;
glansDiameter=29;
peeholeDiameter=6;

/* [Penis: flacid measurements] */

penisFlacidDiameter=33;
penisFlacidLength=70;
penisNeckFlacidDiameter=25;

/* [Penis: erect mesurements] */
penisErectLength = 130;
penisErectWidth = 33;

/* [Scrotum] */
ballSize=24;
scrotumArea=728;

/* [Plaque] */
plaqueText = [];
plaqueWidth=1.5;

/* [General] */
baseRingWidth=7.5;
baseRingDiameter=44;
circumcised=false;

// do not change the values below
connectorSize=8;
connectorLength=19;
connectorWidth=9;
width=2;
cutoutAngle=15;
barWidth=6;


test= false;

//    echo("test", test);

module barShape(){
    minkowski(){ 
        square(barWidth-1); 
        circle(d=2);
    }
}