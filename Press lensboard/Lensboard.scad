
$fs=0.1;
extra = 0.5;


module box(width,depth,height){
    translate([-width/2.0, -depth/2.0, 0]){
        cube([width,depth,height]);
    }
}

module plate(width,depth,height, cornerRadius,corners)
{
    translate([-width/2.0, -depth/2.0, 0])
    {
        difference()
        {
            cube([width,depth,height]);
            if (corners[0]==1){
                translate([-extra,-extra,-extra])
                {
                     cube([cornerRadius+extra,cornerRadius+extra,height+2*extra]);
                }
            }
            if (corners[1]==1){
                translate([-extra,depth-cornerRadius,-extra])
                {
                    cube([cornerRadius+extra,cornerRadius+extra,height+2*extra]);
                }
            }
            if (corners[2]==1){
                translate([width-cornerRadius,depth-cornerRadius,-extra])
                { 
                    cube([cornerRadius+extra,cornerRadius+extra,height+2*extra]);
                }
            }
            if (corners[3]==1){
                translate([width-cornerRadius,-extra,-extra])
                {
                    cube([cornerRadius+extra,cornerRadius+extra,height+2*extra]);
                }
            }
        }
        translate([cornerRadius,cornerRadius,0]) cylinder(r=cornerRadius,h=height);
        translate([width-cornerRadius,cornerRadius,0]) cylinder(r=cornerRadius,h=height);
        translate([cornerRadius,depth-cornerRadius,0]) cylinder(r=cornerRadius,h=height);
        translate([width-cornerRadius,depth-cornerRadius,0]) cylinder(r=cornerRadius,h=height);
    }
}   

module lensBoard()
{
    difference(){
        union(){
            difference(){
                width = 91;
                depth = 91;
                thickness = 3.1;
                plate(width,depth,thickness,5,[1,1,1,1]);
                edgeThickness = 1;
                translate([0,0,-edgeThickness]){
                    plate(width-edgeThickness,depth-edgeThickness,3,5,[1,1,1,1]);
                }
            }
            plate(80,80,3,1,[1,1,1,1]);
        }
        translate([0,0,-1]){
            cylinder(10,16.5,16.5);
        }
        translate([0,0,-1]){
            cylinder(2,18,18);
        }
    }
}


lensBoard();
