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

module standoff(gear = 1){
    collaWidth = 1.2;
    gearHeight = 3.3;
    collaDiamater = 3;
    offset = (gearHeight * gear)-2.2;
    translate([0,0,-offset]){
        difference(){
        cylinder(offset, collaDiamater+collaWidth, collaDiamater+collaWidth, false); 
        cylinder(offset, collaDiamater, collaDiamater, false); 
    }
    }
}

module bottom(){
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
     cylinder(4, 1, 1, false); 
    
    //fitting holes
    
    clipOffset = 30;
    clipInnerDiamater = 2.8;
    clipWall = 1.2;
    
     translate([0,clipOffset,0]){
         difference(){
            cylinder(13, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(13, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
         
     translate([clipOffset, 0,0]){
         difference(){
           cylinder(13, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(13, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
         
     translate([0,-clipOffset,0]){
         difference(){cylinder(13, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(13, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
         
     translate([-clipOffset, 0,0]){
         difference(){cylinder(13, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(13, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
}


module top(){
    stackOffset = 16;
    centerHole = 9.5;
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
    
    
    //fits into bottom cog
     cylinder(4, 1, 1, false); 
    
    //fitting holes
    
    clipOffset = 30;
    clipInnerDiamater = 2.8;
    clipWall = 1.2;
    
     translate([0,clipOffset,0]){
         difference(){
            cylinder(13, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(13, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
         
     translate([clipOffset, 0,0]){
         difference(){
           cylinder(13, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(13, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
         
     translate([0,-clipOffset,0]){
         difference(){cylinder(13, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(13, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
         
     translate([-clipOffset, 0,0]){
         difference(){cylinder(13, clipInnerDiamater + clipWall,  clipInnerDiamater + clipWall, false);              
            cylinder(13, clipInnerDiamater,clipInnerDiamater, false); 
         }
     }
}

$fs = 0.01;

 bottom();
 top();
     translate([0,0,3.2]){
// gearStack();
     }

