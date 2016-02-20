use<StepMotor_28BYJ-48.scad>
use<Gears.scad>
use<Hand Gears.scad>

//////////////////////////////////////////////////////////////////////////////////////////////


    size = 75;
    radius = 35;

module fittingHoleBottom(){
     
    fittingHoleHeight = 12;
    
    clipInnerDiamater = 2.8;
    
    clipWall = 1.2;
    
    
     translate([-12,45,0]){
         difference(){
            cylinder(fittingHoleHeight, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(fittingHoleHeight, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
     
      translate([40,40,0]){
         difference(){
            cylinder(fittingHoleHeight, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(fittingHoleHeight, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
     
     
}
module fittingHoleTop(){
     stackOffset = 1;
    centerHole = 9;
    
    size = 100;
    
    clipOffset = 30;
    clipInnerDiamater = 2.6;
    clipWall = 0.9;
    clipHeight = 10;
    spacerHeight = 3.4;
    
    translate([40,40,stackOffset - clipHeight]){
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
     
     translate([-12,45,stackOffset - clipHeight]){
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
}

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
    spikeHeight = ((gearHeight * 4)-1.5) + gearHeight + 1.5;
    //difference(){
        cylinder(offset, collaDiamater+collaWidth, collaDiamater+collaWidth, false); 
        //cylinder(offset, collaDiamater, collaDiamater, false); 
    //}
    
    cylinder(spikeHeight, 2,2);
}


module standoff(gear = 1){
    collaWidth = 1.2;
    gearHeight = 3.3;
    collaDiamater = 3;
    holeDiamater = 2.5;
    offset = ((gearHeight * gear)-2.2) + 1.3;
    translate([0,0,-(offset)+001]){
        difference(){
        cylinder(offset, collaDiamater+collaWidth, collaDiamater+collaWidth, false); 
        cylinder(offset, holeDiamater, holeDiamater, false); 
    }
    }
//    translate([0,0,-offset-1]){
//     cylinder(4, 0.5, 1, false); 
//    }
}

module bottom(){
    
    fittingHoleHeight = 12;
    
    clipOffset = 30;
    clipInnerDiamater = 2.8;
    clipWall = 1.2;
    finalSize = size-radius;
    difference(){
    union(){
    difference(){
    linear_extrude(1.2){
     offset(radius){
 polygon([
        [finalSize /2,-(finalSize /2)],        
        [-(finalSize /2),-(finalSize /2)],
        [-(finalSize /2), (finalSize /2)],
        [(finalSize /2), (finalSize /2)]
        
        ],1);
     }}
     
    
}

    difference(){
  cylinder(2, 10,10, false);
        cylinder(4, 9,9, false);
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
   
         fittingHoleBottom();
    rotate(-90){
    fittingHoleBottom();
    } rotate(90){
    fittingHoleBottom();
    } rotate(180){
    fittingHoleBottom();
    }
  
    
     mountingStands();
     rotate(90){mountingStands();}
     rotate(180){mountingStands();}
     rotate(-90){mountingStands();}
    }

//motor holes    
    
     mountingHoles();
     rotate(90){mountingHoles();}
     rotate(180){mountingHoles();}
     rotate(-90){mountingHoles();}

}}

module mountingStands(){
    
    translate([10.4,35.85,0]){
    rotate(235){
        translate([-(35.0/2),0,0]){
            cylinder(10,3.4,3.4);
        }
        translate([(35.0/2),0,0]){
           cylinder(10,3.4,3.4);
        }
        translate([0,-8,0]){
            cylinder(2.2,3.5,3.5);
        }

    }
}
}
module mountingHoles(){
    
    translate([10.4,35.85,-6]){
    rotate(235){
        translate([-(35.0/2),0,0]){
            cylinder(25,2.1,2.1);
        }
        translate([(35.0/2),0,0]){
           cylinder(25,2.1,2.1);
        }
        translate([0,-8,0]){
            cylinder(25,3,3);
        }

    }
}
}

module driveGearGuide(){
    translate([40.3,-4.2,1.5]){
    union(){
    translate([0,0,-1.2]){
        difference(){
            cylinder(1.2, 6, 6, false);
            cylinder(1.2, 5.5, 5.5, false);
        }
        
    }
        
    translate([0,0,-2]){
                    cylinder(2, 0.3, 0.6, false);
    }
    }
}
}
module top(){
    
    stackOffset = 1;
    centerHole = 9;
    
    finalSize = size-radius;
    
    clipOffset = 30;
    clipInnerDiamater = 2.6;
    clipWall = 0.9;
    clipHeight = 10;
    spacerHeight = 3.4;
    union(){
    
    translate([0,0,stackOffset]){
        difference(){
        linear_extrude(1.2){
         offset(radius){
     polygon([
            [finalSize /2,-(finalSize /2)],        
        [-(finalSize /2),-(finalSize /2)],
        [-(finalSize /2), (finalSize /2)],
        [(finalSize /2), (finalSize /2)]
            
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
     
    fittingHoleTop();
    
    rotate(90){    fittingHoleTop();}
    rotate(180){    fittingHoleTop();}
    rotate(-90){    fittingHoleTop();}
    
    
    driveGearGuide();
    
    rotate(90){    driveGearGuide();}
    rotate(180){    driveGearGuide();}
    rotate(-90){    driveGearGuide();}
    
         
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
    translate([120,0,2.3]){
    rotate([180,0,180]){
        
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
       # placeholder(2);
    }
    
     translate([23.5,-23.5,0]){
      #  placeholder(3);
    }
    
     translate([-23.5,-23.5,0]){
      # placeholder(4);
    }
    
    //
locatedDriveGear();
locatedMotor();
rotate(90){
locatedDriveGear();
locatedMotor();
    }
    rotate(-90){
locatedDriveGear();
locatedMotor();
    }
    rotate(180){
locatedDriveGear();
locatedMotor();
    }
}
}

module motor(scale = 1){
    translate([5.6* scale ,5.6* scale, -11.2 * scale]){
        scale(scale){
    rotate([180,0,-135]){

        StepMotor28BYJ();

        }
}
}
}


module driveGear(gear = 1){
    gearHeight = 14;
    difference(){
    translate([0,0,gearHeight/2]){
        gear(3, 17, gearHeight);
    }
    motor(1.1);
}
}

module locatedDriveGear(){
    translate([40.3,-4.2,1.5]){
       driveGear();
    }
}
module locatedMotor(){
       translate([40.4,-3.9,0]){
    rotate(190){
        motor();
    }}
}

//    
//    difference(){
//        translate([-5.5,-41.2,(15.4/2) + 1.3]){
//            rotate([0,0,1]){
//    gear(3, 17, 14);
//            }
//        }
//   #motor(1.01);
  //  }


plates(0, 0);


//driveGear(1);

//rotate([0,0,180]){
//driveGear(1);
//motor();
//}

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