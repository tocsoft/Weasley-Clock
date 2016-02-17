
//////////////////////////////////////////////////////////////////////////////////////////////
module shaft (
gear = 1
)
{
    
    collaHeightOffset = 0;
    collaDiamater = 10;
    gearHeight = 3;
    keyWidth = 1.2;
    keyHeight = 2;
    collaWidth = 1.2;
    gearDiamater = 35;

    collaSpacing = 2.0;
    
    bushingDi = 12;
    
    collaDiamater = 2.6 + ((gear -1)  * 2);
    colla2Diamater = 2.6 + ((gear )  * 2);
    
    collaHeight = 2.5 ;
    bushingHeight = 2;
    tabHeight  = collaHeightOffset - gearHeight;
    innerCollaDiamater = (collaDiamater - collaWidth) +0.5 ;
    tabHeight =  (collaHeight / 30) + gearHeight * gear ;
innerCollaHeight = collaHeight * 3;
handLength = 60;
 
rotate([0,180,0]){
    difference() {
        //hand shape in here
        union(){
        cylinder(collaHeight, colla2Diamater, colla2Diamater, false);
        translate([0,0,collaHeight - 1.2])    {
 linear_extrude(1.2){
     offset(1){
    polygon([
        [colla2Diamater /2,0],
        
        [-(colla2Diamater /2),0],
        [0, handLength]
        
        ],1);
 }
 }
 }
        }

    union(){
    difference() {
        difference() {
            union(){
                
                cylinder(collaHeight, collaDiamater + 0.5, collaDiamater + 0.5, false);
            }    
            cylinder(innerCollaHeight, innerCollaDiamater, innerCollaDiamater, true);
        }
        translate([0,0,(collaHeight - (keyHeight / 2) +1)]) {
            cube([keyWidth,(collaDiamater * 2) + 2, keyHeight + 2], true);
        }
    }
            cylinder(collaHeight, innerCollaDiamater, innerCollaDiamater, false);
}
}
}
}
$fs = 0.01;

stack = 0;

if(stack == 1){
    shaft(1);
    translate([0,0,3.5]){shaft(2 ); }
    translate([0,0,7]){shaft(3); }
    translate([0,0,10.5]){shaft(4); }
}else{
    shaft(1);
    translate([100,0,0]){shaft(2); }
    translate([100,100,0]){shaft(3); }
    translate([0,100,00]){shaft(4); }
}


