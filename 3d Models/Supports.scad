use<Gears.scad>
use<Hand Gears.scad>

//////////////////////////////////////////////////////////////////////////////////////////////
module placeholder(gear = 1){
    gearHeight = 3.3;
    collaDiamater = 3;
    offset = (gearHeight * gear);
     translate([0,0,offset]){
    union(){
        gear(3,35, gearHeight, 0);
    translate([0,0,-20]){
       cylinder(20, collaDiamater, collaDiamater, false); 
    }  
        }
    }
}
module colla(gear = 1){
    collaWidth = 1.2;
    gearHeight = 3.3;
    collaDiamater = 3;
    offset = (gearHeight * gear)-1.5;
    difference(){
        cylinder(offset, collaDiamater+collaWidth, collaDiamater+collaWidth, false); 
        cylinder(offset, collaDiamater, collaDiamater, false); 
    }
}

module collaHole(gear = 1){
    collaWidth = 1.2;
    gearHeight = 3.3;
    collaDiamater = 3;
    offset = (gearHeight * gear)-1.5;
    
        cylinder(offset, collaDiamater, collaDiamater, false); 
    
}

module standoff(gear = 1){
    collaWidth = 1.2;
    gearHeight = 3.3;
    collaDiamater = 3;
    offset = ((gearHeight * gear)-2.2) + 1.3;
    translate([0,0,-(offset)+001]){
        //difference(){
        cylinder(offset, collaDiamater+collaWidth, collaDiamater+collaWidth, false); 
        //cylinder(offset, collaDiamater, collaDiamater, false); 
    //}
    }
    translate([0,0,-offset-1]){
     cylinder(4, 0.5, 1, false); 
    }
}

module bottom(){
    
    fittingHoleHeight = 12;
    
    clipOffset = 30;
    clipInnerDiamater = 2.8;
    clipWall = 1.2;
    difference(){
    union(){
    difference(){
    linear_extrude(1.2){
     offset(5){
 polygon([
        [30,-30],        
        [-30,-30],
        [-30, 30],
        [30, 30]
        
        ],1);
     }}
     
    
}
  translate([23.5,23.5,0]){
        colla(1);
    }
     translate([-23.5,23.5,0]){
        colla(2);
    }
    
     translate([23.5,-23.5,0]){
        colla(3);
    }
    
     translate([-23.5,-23.5,0]){
        colla(4);
    }
    
    //fits into bottom cog
     cylinder(4, 1, 0.5, false); 
    
    //fitting holes
    
     translate([0,clipOffset,0]){
         difference(){
            cylinder(fittingHoleHeight, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(fittingHoleHeight, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
         
     translate([clipOffset, 0,0]){
         difference(){
           cylinder(fittingHoleHeight, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(fittingHoleHeight, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
         
     translate([0,-clipOffset,0]){
         difference(){cylinder(fittingHoleHeight, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(fittingHoleHeight, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
         
     translate([-clipOffset, 0,0]){
         difference(){cylinder(fittingHoleHeight, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(fittingHoleHeight, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
    }
    translate([23.5,23.5,0]){
        collaHole(1);
    }
     translate([-23.5,23.5,0]){
        collaHole(2);
    }
    
     translate([23.5,-23.5,0]){
        collaHole(3);
    }
    
     translate([-23.5,-23.5,0]){
        collaHole(4);
    }
    
    
    
}}


module top(){
    stackOffset = 1;
    centerHole = 9;
    
    
    clipOffset = 30;
    clipInnerDiamater = 2.6;
    clipWall = 0.9;
    clipHeight = 10;
    spacerHeight = 3.4;
    union(){
    
    translate([0,0,stackOffset]){
        difference(){
        linear_extrude(1.2){
         offset(5){
     polygon([
            [30,-30],        
            [-30,-30],
            [-30, 30],
            [30, 30]
            
            ],1);
         }}
          cylinder(13, centerHole,  centerHole, true);      
     }
     }
     
    
     translate([-23.5,-23.5,stackOffset]){
        standoff(1);
    }
    
     translate([23.5,-23.5,stackOffset]){
        standoff(2);
    }
    
     translate([-23.5,23.5,stackOffset]){
        standoff(3);
    }
    
    
  translate([23.5,23.5,stackOffset]){
        standoff(4);
    }
    
    
    //fitting holes
     translate([0,clipOffset,stackOffset - clipHeight]){
         union(){
             translate([0,0,clipHeight - spacerHeight]){
         cylinder(spacerHeight,clipInnerDiamater+clipWall, clipInnerDiamater+clipWall, false);
             }
            difference(){
                cylinder(clipHeight, clipInnerDiamater,clipInnerDiamater, false); 
             translate([0,0,clipHeight/2 - 2]){
             cube([clipInnerDiamater * 2,clipWall, clipHeight], true);
             }
             translate([0,0,clipHeight/2 - 2]){
             cube([clipWall,clipInnerDiamater * 2, clipHeight], true);
             }
         }}
     }
         
     translate([clipOffset, 0,stackOffset - clipHeight]){
          union(){
             translate([0,0,clipHeight - spacerHeight]){
         cylinder(spacerHeight,clipInnerDiamater+clipWall, clipInnerDiamater+clipWall, false);
             }difference(){
            cylinder(clipHeight, clipInnerDiamater,clipInnerDiamater, false); 
         translate([0,0,clipHeight/2 - 2]){
         cube([clipInnerDiamater * 2,clipWall, clipHeight], true);
         }
         translate([0,0,clipHeight/2 - 2]){
         cube([clipWall,clipInnerDiamater * 2, clipHeight], true);
         }
     }
     }}
         
     translate([0,-clipOffset,stackOffset - clipHeight]){
        union(){
             translate([0,0,clipHeight - spacerHeight]){
         cylinder(spacerHeight,clipInnerDiamater+clipWall, clipInnerDiamater+clipWall, false);
             }  difference(){
            cylinder(clipHeight, clipInnerDiamater,clipInnerDiamater, false); 
         translate([0,0,clipHeight/2 - 2]){
         cube([clipInnerDiamater * 2,clipWall, clipHeight], true);
         }
         translate([0,0,clipHeight/2 - 2]){
         cube([clipWall,clipInnerDiamater * 2, clipHeight], true);
         }
     }
     }}
         
     translate([-clipOffset, 0,stackOffset - clipHeight]){
           union(){
             translate([0,0,clipHeight - spacerHeight]){
         cylinder(spacerHeight,clipInnerDiamater+clipWall, clipInnerDiamater+clipWall, false);
             }difference(){
            cylinder(clipHeight, clipInnerDiamater,clipInnerDiamater, false); 
         translate([0,0,clipHeight/2 - 2]){
         cube([clipInnerDiamater * 2,clipWall, clipHeight], true);
         }
         translate([0,0,clipHeight/2 - 2]){
         cube([clipWall,clipInnerDiamater * 2, clipHeight], true);
         }
     }}
     }
}}

module plates(
preview = 0,
showCogs = 0
){
$fs = 0.01;

if(preview == 1){
    bottom();
    
    translate([0,0,15.5]){
 top();
    }
}else{
    bottom();
    translate([80,0,2]){
    rotate([180,0,0]){
        top();
        }
    }
}
     
if(showCogs == 1 || preview == 1){
    translate([0,0,3.2]){
        #gearStack();
     }
    translate([23.5,23.5,0]){
        #placeholder(1);
    }
     translate([-23.5,23.5,0]){
        #placeholder(2);
    }
    
     translate([23.5,-23.5,0]){
        #placeholder(3);
    }
    
     translate([-23.5,-23.5,0]){
       #placeholder(4);
    }
}
}

module motor(){
    translate([-35,-5,-20]){
    rotate([90,0,-45]){
import("C:/Users/tocsoft/Documents/Projects/Weasley Clock/3d Models/Stepper_motor_28BYJ-48.stl");
}
}
}


module driveGear(gear = 1){
    translate([-42,-42,(15.4/2) + 1.3]){
        rotate([0,0,10]){
gear(3, 17, 15.4);
        }
    }
}

//plates(1);


#driveGear(1);
motor();

//
//intersection(){
//    translate([0,0,0]){
//        cube([12,12,40], true);
//    }
//plates(0);
//}
//
//intersection(){
//    translate([80,0,0]){
//        cube([25,25,40], true);
//    }
//#plates(0);
//}
//
//
//
//   