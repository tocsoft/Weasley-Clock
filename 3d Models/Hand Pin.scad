

//////////////////////////////////////////////////////////////////////////////////////////////
module pin (
)
{
    
gear = 1;
    collaHeightOffset = 0;
    collaDiamater = 10;
    gearHeight = 3;
    keyWidth = 2;
    keyHeight = 2;
    collaWidth = 1.4;
    gearDiamater = 35;

    collaSpacing = 2.0;
    
    collaHeightOffset= 18- ((gear -1) * (7.35 ));
    
    bushingDi = 12;
    
    collaDiamater = 2.6 + ((gear -1)  * 2);
    discDiam = 2.6 + ((2 -1)  * 2);
    
    collaHeight = 15  + collaHeightOffset;
    bushingHeight = 2;
    tabHeight  = collaHeightOffset - gearHeight;
    innerCollaDiamater = collaDiamater - collaWidth;
    tabHeight =  (collaHeight / 30) + gearHeight * gear ;
innerCollaHeight = collaHeight * 3;
    
    union(){
        cylinder(1.2, discDiam, discDiam, false);
    
        difference(){
        cylinder(5, innerCollaDiamater, innerCollaDiamater, false);
            cube([11,0.6,13], true);
        }
    }
    
}
$fs = 0.01;

pin();
