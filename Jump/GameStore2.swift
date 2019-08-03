//
//  GameStore2.swift
//  Jump
//
//  Created by Bridget Janicki on 7/22/19.
//  Copyright © 2019 Adam Janicki. All rights reserved.
//

import Foundation
import SpriteKit
class GameStore2: SKScene{
    //globals
     var coinTotal = UILabel()
    var backButton = SKLabelNode()
    var nextB = SKLabelNode()
    var totalCoins = 0
    var labelWidth: CGFloat = 300
    var labelHeight: CGFloat = 100
    var con: CGFloat = 280
    var con2: CGFloat = 20
    var con3: CGFloat = 35
    var con4: CGFloat = 50
    var con5: CGFloat = 55
    var mult: CGFloat = -1
    var buy1label = UILabel()
    var buy2label = UILabel()
    var buy3label = UILabel()
    var buy1 = UILabel()
    var buy2 = UILabel()
    var buy3 = UILabel()
    var buyRect = CGRect()
    var buyRect2 = CGRect()
    var buyRect3 = CGRect()
    var headstart = 0
    var doubleCoins = 0
    var speed2x = 0
    
    override func didMove(to view: SKView) {
        totalCoins = UserDefaults.standard.integer(forKey: "totalCoins")
        if totalCoins > -1{
            totalCoins = UserDefaults.standard.integer(forKey: "totalCoins")
        }
        else{
            totalCoins=0
            UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
    }
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
        buy1 = UILabel(frame: CGRect(x:164, y:217, width:labelWidth, height: labelHeight))
        buy1.textColor = .white
        buy1.font = UIFont.systemFont(ofSize: 46)
        if headstart == 1{
            buy1.text = "Selected"
        }
        else{
            buy1.text = "Buy 30C"
        }
        buy2 = UILabel(frame: CGRect(x:164, y:370, width:labelWidth, height: labelHeight))
        buy2.textColor = .white
        buy2.font = UIFont.systemFont(ofSize: 46)
        if doubleCoins == 1{
            buy2.text = "Selected"
        }
        else{
            buy2.text = "Buy 40C"
        }
        buy3 = UILabel(frame: CGRect(x:164, y:522, width:labelWidth, height: labelHeight))
        buy3.textColor = .black
        buy3.font = UIFont.systemFont(ofSize: 46)
        if speed2x == 1{
            buy3.text = "Selected"
        }
        else{
            buy3.text = "Buy 50C"
        }
        backButton = self.childNode(withName: "backButton") as! SKLabelNode
        nextB = self.childNode(withName: "nextB") as! SKLabelNode
        coinTotal = UILabel(frame: CGRect(x:74, y: 110, width: labelWidth, height: labelHeight))
        coinTotal.textColor = .black
        coinTotal.font = UIFont.systemFont(ofSize: 48)
        coinTotal.text = "Coins: \(totalCoins)"
        buy1label = UILabel(frame: CGRect(x:159, y:170, width:labelWidth, height: labelHeight))
        buy1label.textColor = .white
        buy1label.font = UIFont.systemFont(ofSize: 42)
        buy2label = UILabel(frame: CGRect(x:164, y:325, width:labelWidth, height: labelHeight))
        buy2label.textColor = .white
        buy2label.font = UIFont.systemFont(ofSize: 42)
        buy3label = UILabel(frame: CGRect(x:164, y:475, width:labelWidth, height: labelHeight))
        buy3label.textColor = .black
        buy3label.font = UIFont.systemFont(ofSize: 42)
        buy1label.text = "Headstart"
        buy2label.text = "Coins x2"
        buy3label.text = "Speed x2"
        view.addSubview(buy1)
        view.addSubview(buy2)
        view.addSubview(buy3)
        view.addSubview(buy1label)
        view.addSubview(buy2label)
        view.addSubview(buy3label)
        view.addSubview(coinTotal)
        buyRect = buy1.frame
        buyRect2 = buy2.frame
        buyRect3 = buy3.frame
}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in: self)
            if atPoint(touchLocation).name == "backButton"{
                coinTotal.text = ""
                buy1.text = ""
                buy2.text = ""
                buy3.text = ""
                buy1label.text = ""
                buy2label.text = ""
                buy3label.text = ""
                let gameStore = SKScene(fileNamed: "GameStore")!
                gameStore.scaleMode = .aspectFill
                view?.presentScene(gameStore, transition: SKTransition.fade(withDuration: TimeInterval(0.01)))
            }
            if atPoint(touchLocation).name == "nextB"{
                coinTotal.text = ""
                buy1.text = ""
                buy2.text = ""
                buy3.text = ""
                buy1label.text = ""
                buy2label.text = ""
                buy3label.text = ""
                let gameStore3 = SKScene(fileNamed: "GameStore3")!
                gameStore3.scaleMode = .aspectFill
                view?.presentScene(gameStore3, transition: SKTransition.fade(withDuration: TimeInterval(0.01)))
            }
            //buying
            if touchLocation.x > buyRect.origin.x - labelWidth/2 - con && touchLocation.x < buyRect.origin.x + labelWidth/2 + con2 && touchLocation.y > buyRect.origin.y - labelHeight - con3 && touchLocation.y < buyRect.origin.y + labelHeight && headstart != 1 && totalCoins > 29{
                totalCoins-=30
                buy1.text = "Selected"
                headstart=1
                UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
                UserDefaults.standard.set(headstart, forKey: "headstart")
                 coinTotal.text = "Coins: \(totalCoins)"
               
            }
            if touchLocation.x > buyRect2.origin.x - labelWidth/2 - con && touchLocation.x < buyRect2.origin.x + labelWidth/2 + con2 && touchLocation.y > (mult * buyRect2.origin.y) - labelHeight + con - con5 - con2 && touchLocation.y < (buyRect2.origin.y * mult) + labelHeight + con - con5 && doubleCoins != 1 && totalCoins > 39 {
                totalCoins-=40
                buy2.text = "Selected"
                doubleCoins=1
                UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
                UserDefaults.standard.set(doubleCoins, forKey: "doubleCoins")
                 coinTotal.text = "Coins: \(totalCoins)"
                
            }
            if touchLocation.x > buyRect3.origin.x - labelWidth/2 - con && touchLocation.x < buyRect3.origin.x + labelWidth/2 + con2 && touchLocation.y * mult > buyRect3.origin.y - labelHeight - con3 - con4 && touchLocation.y * mult < buyRect3.origin.y + labelHeight - con5 && speed2x != 1 && totalCoins > 49{
                totalCoins-=50
                buy3.text = "Selected"
                speed2x=1
                UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
                UserDefaults.standard.set(speed2x, forKey: "speed2x")
                coinTotal.text = "Coins: \(totalCoins)"
            }
        }
    }
}
