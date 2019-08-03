//
//  GameMenu.swift
//  Jump
//
//  Created by Bridget Janicki on 7/20/19.
//  Copyright © 2019 Adam Janicki. All rights reserved.
//

import Foundation
import SpriteKit


class GameMenu: SKScene {
    
    var startbutton = SKLabelNode()
    var store = SKLabelNode()
    var bestScore = SKLabelNode()
    var MenuBackground = SKSpriteNode()
    var Highscore = 0
    override func didMove(to view: SKView) {
        Highscore = UserDefaults.standard.integer(forKey: "Highscore")
        if Highscore > -1{
            Highscore = UserDefaults.standard.integer(forKey: "Highscore")
        }
        else{
            Highscore=0
            UserDefaults.standard.set(Highscore, forKey: "Highscore")
        }
        startbutton = self.childNode(withName: "startbutton") as! SKLabelNode
        store = self.childNode(withName: "store") as! SKLabelNode
       bestScore = self.childNode(withName: "bestScore") as! SKLabelNode
        MenuBackground = self.childNode(withName: "MenuBackground") as! SKSpriteNode
        var rand = Int.random(in: 1..<17)
        MenuBackground.texture = SKTexture(imageNamed: "background\(rand)")
        bestScore.text = "Best: \(Highscore)"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in: self)
            if atPoint(touchLocation).name == "startbutton"{
                let gameScene = SKScene(fileNamed: "GameScene")!
                gameScene.scaleMode = .aspectFill
                view?.presentScene(gameScene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(1.6)))
            }
            if atPoint(touchLocation).name == "store"{
                let gameStore = SKScene(fileNamed: "GameStore")!
                gameStore.scaleMode = .aspectFill
                view?.presentScene(gameStore, transition: SKTransition.fade(withDuration: TimeInterval(0.01)))
            }
    }
}
}
