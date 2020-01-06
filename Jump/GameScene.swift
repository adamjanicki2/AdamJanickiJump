//
//  GameScene.swift
//  Jump
//
//  Copyright © 2019 Adam Janicki. All rights reserved.
//
import SpriteKit
import GameplayKit
class GameScene: SKScene, SKPhysicsContactDelegate {
   var counter=0
    var objects = [SKSpriteNode]()
    var road1 = [SKSpriteNode]()
    var road2 = [SKSpriteNode]()
    var road3 = [SKSpriteNode]()
    var totalCoins = 0
    var Highscore = 0
    var sc = SKLabelNode()
    var newHighscore = UILabel()
    var tree1 = SKSpriteNode()
    var tree2 = SKSpriteNode()
    var tree3 = SKSpriteNode()
    var tree4 = SKSpriteNode()
    var coin = SKSpriteNode()
    var b = SKSpriteNode()
    var move=false
    var gameover = false
    var spot = 0
    var score = 0
    var canmove=true
    var c = 0
    var coun = 0
    var explosionTimer: Timer? = nil
    var time2 = 0.11
    var frameRate = 6
    var coins = 0
    var headstart = 0
    var doubleCoins = 0
    var speed2x = 0
    var time1 = 0.12
    var skinSelected = 1
    var countFrame = 0
    var endTimer: Timer? = nil
    var moveTimer: Timer? = nil
    var tapTimer: Timer? = nil
    var frog = SKSpriteNode()
    var rcar1 = SKSpriteNode()
    var rcar2 = SKSpriteNode()
    var rcar3 = SKSpriteNode()
    var lcar1 = SKSpriteNode()
    var lcar2 = SKSpriteNode()
    var lcar3 = SKSpriteNode()
    var strip1 = SKSpriteNode()
     var strip2 = SKSpriteNode()
     var strip3 = SKSpriteNode()
     var strip4 = SKSpriteNode()
    var highscorelabel = SKLabelNode()
    var t1 = Double.random(in: 175..<225)
    var t2 = Double.random(in: 175..<225)
    var t3 = Double.random(in: 175..<225)
    var t4 = Double.random(in: 175..<225)
    var t5 = Double.random(in: 175..<225)
    var t6 = Double.random(in: 175..<225)
    var mapSelected = 0
    var w: CGFloat = 0
    var h: CGFloat = 0
    var w1: CGFloat = 0
    var h1: CGFloat = 0
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        newHighscore = UILabel(frame: CGRect(x:0, y:280, width:750, height: 100))
         newHighscore.text = ""
        newHighscore.textColor = .orange
        newHighscore.font = UIFont.systemFont(ofSize: 56)
        view.addSubview(newHighscore)
        skinSelected = UserDefaults.standard.integer(forKey: "skinSelected")
        if(skinSelected > -1){
            skinSelected = UserDefaults.standard.integer(forKey: "skinSelected")
        }
        else{
            skinSelected = 1
            UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
        }
        mapSelected = UserDefaults.standard.integer(forKey: "mapSelected")
        if(mapSelected > -1){
            mapSelected = UserDefaults.standard.integer(forKey: "mapSelected")
        }
        else{
            mapSelected = 1
            UserDefaults.standard.set(mapSelected, forKey: "mapSelected")
        }
        Highscore = UserDefaults.standard.integer(forKey: "Highscore")
        if Highscore > -1{
           Highscore = UserDefaults.standard.integer(forKey: "Highscore")
        }
        else{
            Highscore=0
            UserDefaults.standard.set(Highscore, forKey: "Highscore")
        }
        totalCoins = UserDefaults.standard.integer(forKey: "totalCoins")
        if totalCoins > -1{
            totalCoins = UserDefaults.standard.integer(forKey: "totalCoins")
        }
        else{
            totalCoins=0
            UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
        }
        sc = self.childNode(withName: "sc") as! SKLabelNode
        frog = self.childNode(withName: "frog") as! SKSpriteNode
        frog.name = "frog"
        lcar1 = self.childNode(withName: "lcar1") as! SKSpriteNode
        lcar2 = self.childNode(withName: "lcar2") as! SKSpriteNode
        lcar3 = self.childNode(withName: "lcar3") as! SKSpriteNode
        rcar1 = self.childNode(withName: "rcar1") as! SKSpriteNode
        rcar2 = self.childNode(withName: "rcar2") as! SKSpriteNode
        rcar3 = self.childNode(withName: "rcar3") as! SKSpriteNode
        lcar3.name = "lcar3"
        lcar2.name = "lcar2"
        lcar1.name = "lcar1"
        rcar1.name = "rcar1"
        rcar2.name = "rcar2"
        rcar3.name = "rcar3"
        strip1 = self.childNode(withName: "strip1") as! SKSpriteNode
        strip2 = self.childNode(withName: "strip2") as! SKSpriteNode
        strip3 = self.childNode(withName: "strip3") as! SKSpriteNode
        strip4 = self.childNode(withName: "strip4") as! SKSpriteNode
        for i in 1..<9{
            road1.append(self.childNode(withName: "q"+String(i)) as! SKSpriteNode)
            road2.append(self.childNode(withName: "r"+String(i)) as! SKSpriteNode)
            road3.append(self.childNode(withName: "w"+String(i)) as! SKSpriteNode)
        }
        b = self.childNode(withName: "b") as! SKSpriteNode
        coin = SKSpriteNode(imageNamed: "coin48")
        coin.size = coin.texture!.size()
        coin.position = CGPoint(x:-600, y:0)
        tree1 = SKSpriteNode(imageNamed: "AutumnTree200")
        tree1.size = tree1.texture!.size()
        tree1.position = CGPoint(x:-223, y:217)
        tree2 = SKSpriteNode(imageNamed: "AutumnTree200")
        tree2.size = tree1.texture!.size()
        tree2.position = CGPoint(x:256, y:217)
        tree3 = SKSpriteNode(imageNamed: "AutumnTree200")
        tree3.size = tree1.texture!.size()
        tree3.position = CGPoint(x:-270, y:-191)
        tree4 = SKSpriteNode(imageNamed: "AutumnTree200")
        tree4.size = tree1.texture!.size()
        tree4.position = CGPoint(x:189, y:-191)
        headstart = UserDefaults.standard.integer(forKey: "headstart")
        if headstart > -1{
            headstart = UserDefaults.standard.integer(forKey: "headstart")
        }
        else{
            headstart=0
            UserDefaults.standard.set(totalCoins, forKey: "headstart")
        }
        doubleCoins = UserDefaults.standard.integer(forKey: "doubleCoins")
        if doubleCoins > -1{
            doubleCoins = UserDefaults.standard.integer(forKey: "doubleCoins")
        }
        else{
            doubleCoins=0
            UserDefaults.standard.set(totalCoins, forKey: "doubleCoins")
        }
        speed2x = UserDefaults.standard.integer(forKey: "speed2x")
        if speed2x > -1{
            speed2x = UserDefaults.standard.integer(forKey: "speed2x")
        }
        else{
            speed2x=0
            UserDefaults.standard.set(totalCoins, forKey: "speed2x")
        }
        highscorelabel = self.childNode(withName: "highscorelabel") as! SKLabelNode
        highscorelabel.text = "HI:\(Highscore)"
        if headstart == 1{
            t1+=75
            t2+=75
            t3+=75
            t4+=75
            t5+=75
            t6+=75
            score=50
        }
        if speed2x == 1{
            frameRate = frameRate / 2
            time1 = time1 / 2
            time2 = 0.05
        }
        if skinSelected == 1{
            frog.texture = SKTexture(imageNamed: "rainbow96")
        }
        else if skinSelected == 2{
            frog.texture = SKTexture(imageNamed: "camo96")
        }
        else if skinSelected == 3{
            frog.texture = SKTexture(imageNamed: "batman96")
        }
        else if skinSelected == 4 || skinSelected == 5{
            if skinSelected == 4{
                frog.texture = SKTexture(imageNamed: "X-Wing")
            }
            else{
                frog.texture = SKTexture(imageNamed: "Falcon")
            }
            b.texture = SKTexture(imageNamed: "SpaceBackground")
            rcar1.texture = SKTexture(imageNamed: "TieFighter2")
            rcar2.texture = SKTexture(imageNamed: "TieFighter2")
            rcar3.texture = SKTexture(imageNamed: "TieFighter2")
            lcar1.texture = SKTexture(imageNamed: "TieFighter")
            lcar2.texture = SKTexture(imageNamed: "TieFighter")
            lcar3.texture = SKTexture(imageNamed: "TieFighter")
            strip1.texture = SKTexture(imageNamed: "striptexture")
            strip2.texture = SKTexture(imageNamed: "striptexture")
            strip3.texture = SKTexture(imageNamed: "striptexture")
            strip4.texture = SKTexture(imageNamed: "striptexture")
            tree1.texture = SKTexture(imageNamed: "asteroid")
            tree2.texture = SKTexture(imageNamed: "asteroid")
            tree3.texture = SKTexture(imageNamed: "asteroid")
            tree4.texture = SKTexture(imageNamed: "asteroid")
            b.zPosition+=2
            lcar1.zPosition+=2
            lcar2.zPosition+=2
            lcar3.zPosition+=2
            rcar1.zPosition+=2
            rcar2.zPosition+=2
            rcar3.zPosition+=2
            strip1.zPosition+=2
            strip2.zPosition+=2
            strip3.zPosition+=2
            strip4.zPosition+=2
            frog.zPosition+=2
            tree1.zPosition = 3
            tree2.zPosition = 3
            tree3.zPosition = 3
            tree4.zPosition = 3
            sc.fontColor = .orange
            highscorelabel.fontColor = .orange
            coin.zPosition = 3
        }
        else if skinSelected == 6{
           
            b.texture = SKTexture(imageNamed: "SpaceBackground")
            frog.texture = SKTexture(imageNamed: "NewDeathStar")
            rcar1.texture = SKTexture(imageNamed: "X-Wing2")
            rcar2.texture = SKTexture(imageNamed: "X-Wing2")
            rcar3.texture = SKTexture(imageNamed: "X-Wing2")
            lcar1.texture = SKTexture(imageNamed: "X-Wing3")
            lcar2.texture = SKTexture(imageNamed: "X-Wing3")
            lcar3.texture = SKTexture(imageNamed: "X-Wing3")
            strip1.texture = SKTexture(imageNamed: "striptexture")
            strip2.texture = SKTexture(imageNamed: "striptexture")
            strip3.texture = SKTexture(imageNamed: "striptexture")
            strip4.texture = SKTexture(imageNamed: "striptexture")
            tree1.texture = SKTexture(imageNamed: "asteroid")
            tree2.texture = SKTexture(imageNamed: "asteroid")
            tree3.texture = SKTexture(imageNamed: "asteroid")
            tree4.texture = SKTexture(imageNamed: "asteroid")
            b.zPosition+=2
            lcar1.zPosition+=2
            lcar2.zPosition+=2
            lcar3.zPosition+=2
            rcar1.zPosition+=2
            rcar2.zPosition+=2
            rcar3.zPosition+=2
            strip1.zPosition+=2
            strip2.zPosition+=2
            strip3.zPosition+=2
            strip4.zPosition+=2
            frog.zPosition+=2
            tree1.zPosition = 3
            tree2.zPosition = 3
            tree3.zPosition = 3
            tree4.zPosition = 3
            sc.fontColor = .orange
            highscorelabel.fontColor = .orange
            coin.zPosition = 3
        }
        sc.text = "SC:\(score) C:\(coins)"
        if mapSelected == 2 && skinSelected != 4 && skinSelected != 5 && skinSelected != 6{
            b.color = .black
            tree1.texture = SKTexture(imageNamed: "SpringTree200")
            tree2.texture = SKTexture(imageNamed: "SpringTree200")
            tree3.texture = SKTexture(imageNamed: "SpringTree200")
            tree4.texture = SKTexture(imageNamed: "SpringTree200")
            strip1.color =  UIColor(red: 0, green: 0.078125, blue: 0.296875, alpha: 1)
            strip2.color = UIColor(red: 0.39453125, green: 0.39453125, blue: 0.12890625, alpha: 1)
            strip3.color = UIColor(red: 0.39453125, green: 0.39453125, blue: 0.12890625, alpha: 1)
            strip4.color = UIColor(red: 0.39453125, green: 0.39453125, blue: 0.12890625, alpha: 1)
        }
        else if mapSelected == 3 && skinSelected != 4 && skinSelected != 5 && skinSelected != 6{
            tree1.texture = SKTexture(imageNamed: "Cactus200")
            tree2.texture = SKTexture(imageNamed: "Cactus200")
            tree3.texture = SKTexture(imageNamed: "Cactus200")
            tree4.texture = SKTexture(imageNamed: "Cactus200")
            strip1.color = UIColor(red: 1, green: 0.63671875, blue: 0.16796875, alpha: 1)
            strip2.color = UIColor(red: 1, green: 0.63671875, blue: 0.16796875, alpha: 1)
            strip3.color = UIColor(red: 1, green: 0.63671875, blue: 0.16796875, alpha: 1)
            strip4.color = UIColor(red: 1, green: 0.63671875, blue: 0.16796875, alpha: 1)
        }
        objects.append(tree1)
        objects.append(tree2)
        objects.append(tree3)
        objects.append(tree4)
        objects.append(strip2)
        objects.append(strip3)
        objects.append(strip4)
        objects.append(lcar1)
        objects.append(lcar2)
        objects.append(lcar3)
        objects.append(rcar1)
        objects.append(rcar2)
        objects.append(rcar3)
        
        addChild(tree1)
        addChild(tree2)
        addChild(tree3)
        addChild(tree4)
        addChild(coin)
        w = frog.size.width/2 + 1
        h = frog.size.height/2 + 1
        w1 = lcar1.size.width/2
        h1 = lcar1.size.height/2
        spawnCoin()
        applySpeed()
        startTimers()
    }
    func applySpeed(){
        lcar1.physicsBody?.applyImpulse(CGVector(dx: -1*t1, dy: 0))
        rcar1.physicsBody?.applyImpulse(CGVector(dx: t2, dy: 0))
        lcar2.physicsBody?.applyImpulse(CGVector(dx: -1*t3, dy: 0))
        rcar2.physicsBody?.applyImpulse(CGVector(dx: t4, dy: 0))
        lcar3.physicsBody?.applyImpulse(CGVector(dx: -1*t5, dy: 0))
        rcar3.physicsBody?.applyImpulse(CGVector(dx: t6, dy: 0))
    }
    func startTimers()
    {
        tapTimer = Timer.scheduledTimer(timeInterval: TimeInterval(time2), target: self, selector: #selector(GameScene.countTime), userInfo: nil, repeats: true)
    }
    @objc func countTime()
    {
       c+=1
    }
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in: self)
            if touchLocation.x > -1000 && canmove == true && c > 0{
                move=true
                c=0
                moveFrog()
            }
        }
    }
    func spawnCoin(){
        var rand = Int.random(in: 0...1)
        if rand == 0{
            coin.position.y = -180
        }
        else{
            coin.position.y = 208
        }
        coin.position.x = 0
    }
    @objc func stopMoveTimer()
    {
        moveTimer?.invalidate()
        moveTimer = nil
        canmove = true
    }
    func moveFrog()
    {
        let jump = CGFloat(136)
        /*if spot == -1{
            let moveFrog = SKAction.move(to: CGPoint(x:0,y:frog.position.y + jump), duration:time1)
            let sequence = SKAction.sequence([moveFrog])
            frog.run(sequence)
            spot=0
        }*/
        if spot < 8 && canmove == true{
            let moveFrog = SKAction.move(to: CGPoint(x:0,y:frog.position.y + jump), duration:time1)
            let sequence = SKAction.sequence([moveFrog])
            frog.run(sequence)
            /*for i in 0..<objects.count{
                var currentY = objects[i].position.y
                if currentY - jump < -599{
                    let move = SKAction.move(to: CGPoint(x:objects[i].position.x,y: 489), duration:0.01)
                    objects[i].run(move)
                }
                else{
                    let move = SKAction.move(to: CGPoint(x:objects[i].position.x,y: currentY - jump), duration: time1)
                    objects[i].run(move)
                }
            }*/
            //moveStrips()
            spot+=1
            score+=1
            sc.text = "SC:\(score) C:\(coins)"
        }
        else if spot == 8 && canmove == true{
            let moveFrog = SKAction.move(to: CGPoint(x:0,y:-599), duration:0.0)
            let sequence = SKAction.sequence([moveFrog])
            frog.run(sequence)
            spot=0
            score+=1
           sc.text = "SC:\(score) C:\(coins)"
            /*for i in 0..<objects.count{
                var currentY = objects[i].position.y
                if currentY - jump < -599{
                    let move = SKAction.move(to: CGPoint(x:objects[i].position.x,y: 489), duration:0.01)
                    objects[i].run(move)
                }
                else{
                    let move = SKAction.move(to: CGPoint(x:objects[i].position.x,y: currentY - jump), duration: time1)
                    objects[i].run(move)
                }
            }*/
            //moveStrips()
            lcar1.physicsBody?.applyImpulse(CGVector(dx: t1, dy: 0))
            rcar1.physicsBody?.applyImpulse(CGVector(dx: -1*t2, dy: 0))
            lcar2.physicsBody?.applyImpulse(CGVector(dx: t3, dy: 0))
            rcar2.physicsBody?.applyImpulse(CGVector(dx: -1*t4, dy: 0))
            lcar3.physicsBody?.applyImpulse(CGVector(dx: t5, dy: 0))
            rcar3.physicsBody?.applyImpulse(CGVector(dx: -1*t6, dy: 0))
            t1+=Double.random(in: 30..<40)
            t2+=Double.random(in: 30..<40)
            t3+=Double.random(in: 30..<40)
            t4+=Double.random(in: 30..<40)
            t5+=Double.random(in: 30..<40)
            t6+=Double.random(in: 30..<40)
            applySpeed()
            moveTimer = Timer.scheduledTimer(timeInterval: TimeInterval(0.80), target: self, selector: #selector(GameScene.stopMoveTimer), userInfo: nil, repeats: false)
            canmove=false
            spawnCoin()
        }
    }
    @objc func switchImage(){
        if coun % 2 == 0{
            frog.texture = SKTexture(imageNamed: "explosion")
        }
        else{
            if skinSelected == 4{
                frog.texture = SKTexture(imageNamed: "X-Wing")
            }
            if skinSelected == 5{
                frog.texture = SKTexture(imageNamed: "Falcon")
            }
            if skinSelected == 6{
                frog.texture = SKTexture(imageNamed: "NewDeathStar")
            }
        }
        coun+=1
        if(coun == 2){
            explosionTimer?.invalidate()
            explosionTimer = nil
        }
    }
    func moveStrips(){
        for i in 0..<road1.count{
            let jump = CGFloat(136)
            var currentR1 = road1[i].position.y
            var currentR2 = road2[i].position.y
            var currentR3 = road3[i].position.y
            if currentR1 - jump < -531{
                //move up to top at y = 557
                let move = SKAction.move(to: CGPoint(x:road1[i].position.x,y: 557), duration:0.01)
                road1[i].run(move)
            }
            else{
                let move = SKAction.move(to: CGPoint(x:road1[i].position.x,y: currentR1 - jump), duration:time1)
                road1[i].run(move)
            }
            if currentR2 - jump < -531{
                //move up to top at y = 557
                let move = SKAction.move(to: CGPoint(x:road2[i].position.x,y: 557), duration:0.01)
                road2[i].run(move)
            }
            else{
                let move = SKAction.move(to: CGPoint(x:road2[i].position.x,y: currentR2 - jump), duration:time1)
                road2[i].run(move)
            }
            if currentR3 - jump < -531{
                //move up to top at y = 557
                let move = SKAction.move(to: CGPoint(x:road3[i].position.x,y: 557), duration:0.01)
                road3[i].run(move)
            }
            else{
                let move = SKAction.move(to: CGPoint(x:road3[i].position.x,y: currentR3 - jump), duration:time1)
                road3[i].run(move)
            }

        }
    }
    @objc func endGame()
    {
        speed2x=0
        headstart=0
        doubleCoins=0
        UserDefaults.standard.set(speed2x, forKey: "speed2x")
        UserDefaults.standard.set(headstart, forKey: "headstart")
        UserDefaults.standard.set(doubleCoins, forKey: "doubleCoins")
        if score > UserDefaults.standard.integer(forKey: "Highscore"){
            UserDefaults.standard.set(score, forKey: "Highscore")
        }
        if totalCoins + coins > 1000
        {
            totalCoins = 999
            UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
        }
        else{
            totalCoins += coins
        }
        UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
        let menuScene = SKScene(fileNamed: "GameMenu")!
        menuScene.scaleMode = .aspectFill
        view?.presentScene(menuScene, transition: SKTransition.doorsCloseHorizontal(withDuration: TimeInterval(1.2)))
        newHighscore.text = ""
    }
    func didBegin(_ contact: SKPhysicsContact){
        if contact.bodyA.node?.name == "frog" && gameover == false{
            gameover = true
            endTimer = Timer.scheduledTimer(timeInterval: TimeInterval(0.8), target: self, selector: #selector(GameScene.endGame), userInfo: nil, repeats: false)
            if skinSelected == 4 || skinSelected == 5 || skinSelected == 6{
                endTimer = Timer.scheduledTimer(timeInterval: TimeInterval(0.19), target: self, selector: #selector(GameScene.switchImage), userInfo: nil, repeats: true)
            }
        }
    }
    override func update(_ currentTime: TimeInterval){
        countFrame+=1
        if countFrame % frameRate == 0
        {
            if lcar1.position.x < -455{
                lcar1.position.x = 455
            }
            if rcar1.position.x > 455{
                rcar1.position.x = -455
            }
            if lcar2.position.x < -455{
                lcar2.position.x = 455
            }
            if rcar2.position.x > 455{
                rcar2.position.x = -455
            }
            if lcar3.position.x < -455{
                lcar3.position.x = 455
            }
            if rcar3.position.x > 455{
                rcar3.position.x = -455
            }
            if(frog.position.y + frog.size.width/2 > coin.position.y - 24 && frog.position.y - frog.size.height/2 < coin.position.y + 24){
                if doubleCoins == 1{
                    coins+=2
                }
                else if doubleCoins == 0{
                    coins+=1
                }
                coin.position.x = -600
                coin.position.y = -600
                sc.text = "SC:\(score) C:\(coins)"
            }
            countFrame=0
        }
    }
}
