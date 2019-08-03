//
//  GameStore.swift
//  Jump
//
//  Created by Bridget Janicki on 7/21/19.
//  Copyright © 2019 Adam Janicki. All rights reserved.
//

import Foundation
import SpriteKit
class GameStore: SKScene{
    //globals
    var back = SKLabelNode()
    var nextButton = SKLabelNode()
    var coinTotal = UILabel()
    var buy1 = UILabel()
    var buy2 = UILabel()
    var buy3 = UILabel()
    var buyRect = CGRect()
    var buyRect2 = CGRect()
    var buyRect3 = CGRect()
    var labelWidth: CGFloat = 300
    var labelHeight: CGFloat = 100
    var con: CGFloat = 280
    var con2: CGFloat = 20
    var con3: CGFloat = 35
    var con4: CGFloat = 50
    var con5: CGFloat = 55
    var mult: CGFloat = -1
    var totalCoins = 0
    var has1 = 0
    var has2 = 0
    var skinSelected = 0
    override func didMove(to view: SKView) {
        totalCoins = UserDefaults.standard.integer(forKey: "totalCoins")
        if totalCoins > -1{
           totalCoins = UserDefaults.standard.integer(forKey: "totalCoins")
        }
        else{
            totalCoins=0
            UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
        }
        has1 = UserDefaults.standard.integer(forKey: "has1")
        if has1 > -1{
            has1 = UserDefaults.standard.integer(forKey: "has1")
        }
        else{
            has1=0
            UserDefaults.standard.set(has1, forKey: "has1")
        }
        has2 = UserDefaults.standard.integer(forKey: "has2")
        if has2 > -1{
            has2 = UserDefaults.standard.integer(forKey: "has2")
        }
        else{
            has2=0
            UserDefaults.standard.set(has2, forKey: "has2")
        }
        skinSelected = UserDefaults.standard.integer(forKey: "skinSelected")
        if(skinSelected > -1){
            skinSelected = UserDefaults.standard.integer(forKey: "skinSelected")
        }
        else{
            skinSelected = 1
            UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
        }
         back = self.childNode(withName: "back") as! SKLabelNode
        nextButton = self.childNode(withName: "nextButton") as! SKLabelNode
        coinTotal = UILabel(frame: CGRect(x:74, y: 110, width: labelWidth, height: labelHeight))
        coinTotal.textColor = .black
        coinTotal.font = UIFont.systemFont(ofSize: 48)
        coinTotal.text = "Coins: \(totalCoins)"
        buy1 = UILabel(frame: CGRect(x:134, y:195, width:labelWidth, height: labelHeight))
        if skinSelected == 1{
            buy1.text = "Selected"
        }
        else{
            buy1.text = "Rainbow"
        }
        buy1.textColor = .white
        buy1.font = UIFont.systemFont(ofSize: 46)
        buy2 = UILabel(frame: CGRect(x:134, y:350, width:labelWidth, height: labelHeight))
        if(has1 != 1){
            buy2.text = "Buy 250C"
        }
        else if has1 == 1 && skinSelected == 2{
            buy2.text = "Selected"
        }
        else if has1 == 1 && skinSelected != 2{
            buy2.text = "Camo"
        }
        buy2.textColor = .white
        buy2.font = UIFont.systemFont(ofSize: 46)
        buy3 = UILabel(frame: CGRect(x:134, y:505, width:labelWidth, height: labelHeight))
        if(has2 != 1){
            buy3.text = "Buy 500C"
        }
        else if has2 == 1 && skinSelected == 3{
            buy3.text = "Selected"
        }
        else if has2 == 1 && skinSelected != 3{
            buy3.text = "Batman"
        }
        buy3.textColor = .white
        buy3.font = UIFont.systemFont(ofSize: 46)
    view.addSubview(buy1)
        view.addSubview(buy2)
        view.addSubview(buy3)
        view.addSubview(coinTotal)
        buyRect = buy1.frame
        buyRect2 = buy2.frame
        buyRect3 = buy3.frame
        if skinSelected == 4 || skinSelected == 5 || skinSelected == 6{
            buy1.text = "Rainbow"
            if has1 == 1{
                buy2.text = "Camo"
            }
            if has1 != 1{
                buy2.text = "Buy 250C"
            }
            if has2 == 1{
                buy3.text = "Batman"
            }
            if has2 != 1{
                buy3.text = "Buy 500C"
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in: self)
            if atPoint(touchLocation).name == "back"{
                buy1.text = ""
                buy2.text = ""
                buy3.text = ""
                coinTotal.text = ""
                let gameMenu = SKScene(fileNamed: "GameMenu")!
                gameMenu.scaleMode = .aspectFill
                view?.presentScene(gameMenu, transition: SKTransition.fade(withDuration: TimeInterval(0.01)))
            }
            if atPoint(touchLocation).name == "nextButton"{
                //insert next screen code here
                buy1.text = ""
                buy2.text = ""
                buy3.text = ""
                coinTotal.text = ""
                let gameStore2 = SKScene(fileNamed: "GameStore2")!
                gameStore2.scaleMode = .aspectFill
                view?.presentScene(gameStore2, transition: SKTransition.fade(withDuration: TimeInterval(0.01)))
            }
            if touchLocation.x > buyRect.origin.x - labelWidth/2 - con && touchLocation.x < buyRect.origin.x + labelWidth/2 + con2 && touchLocation.y > buyRect.origin.y - labelHeight - con3 && touchLocation.y < buyRect.origin.y + labelHeight && skinSelected != 1{
                buy1.text = "Selected"
                if skinSelected == 4 || skinSelected == 5 || skinSelected == 6{
                    UserDefaults.standard.set(1, forKey: "mapSelected")
                }
                if skinSelected == 2 && has1 == 1{
                    buy2.text = "Camo"
                }
                else if skinSelected == 3 && has2 == 1{
                    buy3.text = "Batman"
                }
                skinSelected = 1
                UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
            }
            if touchLocation.x > buyRect2.origin.x - labelWidth/2 - con && touchLocation.x < buyRect2.origin.x + labelWidth/2 + con2 && touchLocation.y > (mult * buyRect2.origin.y) - labelHeight + con - con5 - con2 && touchLocation.y < (buyRect2.origin.y * mult) + labelHeight + con - con5 && totalCoins > 249 && has1 == 0{
                if skinSelected == 4 || skinSelected == 5 || skinSelected == 6{
                    UserDefaults.standard.set(1, forKey: "mapSelected")
                }
                if(skinSelected == 1)
                {
                    buy1.text = "Rainbow"
                }
                else if skinSelected == 3 && has2 == 1{
                    buy3.text = "Batman"
                }
                has1 = 1
                UserDefaults.standard.set(has1, forKey: "has1")
                skinSelected=2
                UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                buy2.text = "Selected"
                totalCoins -= 250
                UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
                 coinTotal.text = "Coins: \(totalCoins)"
            }
             if touchLocation.x > buyRect2.origin.x - labelWidth/2 - con && touchLocation.x < buyRect2.origin.x + labelWidth/2 + con2 && touchLocation.y > (mult * buyRect2.origin.y) - labelHeight + con - con5 - con2 && touchLocation.y < (buyRect2.origin.y * mult) + labelHeight + con - con5 && has1 == 1 && skinSelected != 2{
                if skinSelected == 4 || skinSelected == 5 || skinSelected == 6{
                    UserDefaults.standard.set(1, forKey: "mapSelected")
                }
                if(skinSelected == 1)
                {
                    buy1.text = "Rainbow"
                }
                else if skinSelected == 3 && has2 == 1{
                    buy3.text = "Batman"
                }
                skinSelected=2
                UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                buy2.text = "Selected"
                
            }
            if touchLocation.x > buyRect3.origin.x - labelWidth/2 - con && touchLocation.x < buyRect3.origin.x + labelWidth/2 + con2 && touchLocation.y * mult > buyRect3.origin.y - labelHeight - con3 - con4 && touchLocation.y * mult < buyRect3.origin.y + labelHeight - con5 && totalCoins > 499 && has2 == 0 {
                if skinSelected == 4 || skinSelected == 5 || skinSelected == 6{
                    UserDefaults.standard.set(1, forKey: "mapSelected")
                }
                if(skinSelected == 1){
                    buy1.text = "Rainbow"
                }
                else if skinSelected == 2 && has1 == 1{
                    buy2.text = "Camo"
                }
                has2 = 1
                UserDefaults.standard.set(has2, forKey: "has2")
                skinSelected = 3
                  UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                totalCoins -= 500
                  UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
                 coinTotal.text = "Coins: \(totalCoins)"
                buy3.text = "Selected"
            }
             if touchLocation.x > buyRect3.origin.x - labelWidth/2 - con && touchLocation.x < buyRect3.origin.x + labelWidth/2 + con2 && touchLocation.y * mult > buyRect3.origin.y - labelHeight - con3 - con4 && touchLocation.y * mult < buyRect3.origin.y + labelHeight - con5 && has2 == 1 && skinSelected != 3 {
                if skinSelected == 4 || skinSelected == 5 || skinSelected == 6{
                    UserDefaults.standard.set(1, forKey: "mapSelected")
                }
                if(skinSelected == 1)
                {
                    buy1.text = "Rainbow"
                }
                else if skinSelected == 2 && has1 == 1{
                    buy2.text = "Camo"
                }
                skinSelected = 3
                UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                buy3.text = "Selected"
            }
            
        }
    }
}
