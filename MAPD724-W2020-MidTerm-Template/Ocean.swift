
//Source file name- MAPD724-W2020-F2020-MideTerm-301093329
//AUthors name- Garima Prasher
//Student Number- 301093329
//Test Date- 19 Feb 2020import SpriteKit

import GameplayKit

class Ocean : GameObject
{
    //constructor
    init()
    {
        super.init(imageString: "ocean", initialScale: 1.172)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //GameObject Life Cycle Functions
    override func CheckBounds()
    {
           
        // check top boundary
        if(self.position.x <= -700) // note maybe reset earlier
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        self.position.x = 0
    }
    
    override func Start()
    {
        self.zPosition = 0
        //self.Reset()
        self.dy = 5.0
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        self.position.x -= self.dy!
    }

}
