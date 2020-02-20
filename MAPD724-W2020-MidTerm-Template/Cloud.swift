//Source file name- MAPD724-W2020-F2020-MideTerm-301093329
//AUthors name- Garima Prasher
//Student Number- 301093329
//Test Date- 19 Feb 2020
import SpriteKit
import GameplayKit

class Cloud: GameObject
{
    
    
    //constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.5)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Life Cycle Functions
    override func CheckBounds()
    {
        // bottom boundary
        if(self.position.x < -801)
        {
            self.Reset()
        }
        
    }
    
    func Move()
    {
        self.position.x -= self.dy!
        self.position.y -= self.dx!
    }
    
    override func Reset()
    {
        self.position.x = 801
        let randomX:Int = (randomSource?.nextInt(upperBound: 614))! - 307
        self.position.y = CGFloat(randomX)
        self.dy = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        self.dx = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
        self.isColliding = false
    }
    
    override func Start()
    {
        self.zPosition = 3
        self.Reset()
        self.alpha = 0.5
    }
    
    override func Update()
    {
        self.Move()
        self.CheckBounds()
    }
    
    
}
