//Source file name- MAPD724-W2020-F2020-MideTerm-301093329
//AUthors name- Garima Prasher
//Student Number- 301093329
//Test Date- 19 Feb 2020
import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?


class GameScene: SKScene {
    
    var gameManager: GameManager?
    
    var oceanSprite1: Ocean?
    var oceanSprite2: Ocean?
    var planeSprite: Plane?
    var islandSprite: Island?
    var cloudSprites: [Cloud] = []
    
    //var config: Config?
    
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        //self.sceneState = .GAME
        //self.config?.sceneState = .GAME
        self.name = "GAME"
        
        // add ocean
        self.oceanSprite1 = Ocean()
        
        self.oceanSprite1?.position = CGPoint(x: 0, y:177 )
        self.oceanSprite1?.size = CGSize(width: 5000, height: 5000)
        self.addChild(oceanSprite1!)
        
        
        
        // add plane
        self.planeSprite = Plane()
        self.planeSprite?.size = CGSize(width: 70, height: 70)
        self.planeSprite?.position = CGPoint(x: -300, y: 0)
        self.addChild(planeSprite!)
        
        // add island
        self.islandSprite = Island()
        self.islandSprite?.size = CGSize(width: 70, height: 70)
        self.islandSprite?.position = CGPoint(x: -300, y: 0)
        self.addChild(islandSprite!)
        
        // add clouds
//        for index in 0...3
//        {
            let cloud: Cloud = Cloud()
            cloudSprites.append(cloud)
            self.addChild(cloudSprites[0])
//        }
        
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        // preload sounds
        do {
            let sounds:[String] = ["thunder", "yay"]
            for sound in sounds
            {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        } catch {
        }
        
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: -300, y: pos.y))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: -300, y: pos.y))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: -300, y: pos.y))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self))}
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self))}
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self))}
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self))}
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        self.oceanSprite1?.Update()
        
        
        self.planeSprite?.Update()
        self.islandSprite?.Update()
        
        CollisionManager.squaredRadiusCheck(scene: self, object1: planeSprite!, object2: islandSprite!)
        
        for cloud in cloudSprites
        {
            cloud.Update()
            CollisionManager.squaredRadiusCheck(scene: self, object1: planeSprite!, object2: cloud)
        }
        
        if(ScoreManager.Lives < 1)
        {
            self.gameManager?.PresentEndScene()
        }
    }
}
