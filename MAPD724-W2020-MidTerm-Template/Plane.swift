//Source file name- MAPD724-W2020-F2020-MideTerm-301093329
//AUthors name- Garima Prasher
//Student Number- 301093329
//Test Date- 19 Feb 2020
import SpriteKit

class Plane: GameObject
{
    // constructor
    init()
    {
        super.init(imageString: "plane", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func CheckBounds()
    {
        // right boundary
        if(self.position.x >= 307 - self.halfWidth!)
        {
            self.position.x = 307 - self.halfWidth!
        }
        
        // left boundary
        if(self.position.x <= -307 + self.halfWidth!)
        {
            self.position.x = -307 + self.halfWidth!
        }
    }
    
    override func Reset()
    {
        
    }
    
    override func Start()
    {
        self.zPosition = 2
    }
    
    override func Update()
    {
        self.CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint)
    {
        self.position = newPos
    }
}
