use<Gears.scad>

//////////////////////////////////////////////////////////////////////////////////////////////
module shaftedGear (
gear = 1
)
{
    
    collaHeightOffset = 0;
    collaDiamater = 10;
    gearHeight = 3;
    keyWidth = 2;
    keyHeight = 2;
    collaWidth = 1.2;
    gearDiamater = 35;

    collaSpacing = 2.0;
    
    collaHeightOffset= 18- ((gear -1) * (7.35 ));
    
    bushingDi = 12;
    
    collaDiamater = 2.6 + ((gear -1)  * 2);
    
    collaHeight = 15  + collaHeightOffset;
    bushingHeight = 2;
    tabHeight  = collaHeightOffset - gearHeight;
    innerCollaDiamater = collaDiamater - collaWidth;
    tabHeight =  (collaHeight / 30) + gearHeight * gear ;
innerCollaHeight = collaHeight * 3;
    
    difference() {
        difference() {
            union(){
                gear(3,gearDiamater,gearHeight,0);
                
                difference(){
                    cylinder(gearHeight -1, bushingDi +1, bushingDi+1, false);
                    cylinder(gearHeight + 10, bushingDi, bushingDi  , false);
                }
                cylinder(collaHeight, collaDiamater, collaDiamater, false);
            }    
            cylinder(innerCollaHeight, innerCollaDiamater, innerCollaDiamater, true);
        }
        translate([0,0,(collaHeight - (keyHeight / 2) +1)]) {
            cube([keyWidth,(collaDiamater * 2) + 2, keyHeight + 2], true);
        }
    }
    
}
module gearStack(stack = 1){
$fs = 0.01;
    if(stack == 1){
    shaftedGear(1);
    translate([0,0,3.5]){shaftedGear(2 ); }
    translate([0,0,7]){shaftedGear(3); }
    translate([0,0,10.5]){shaftedGear(4); }
}else{
    shaftedGear(1);
    translate([55,55,0]){shaftedGear(2); }
    translate([55,0,0]){shaftedGear(3); }
    translate([0,55,00]){shaftedGear(4); }
}
    }


gearStack(1);




