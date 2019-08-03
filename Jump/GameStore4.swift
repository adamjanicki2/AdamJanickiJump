//
//  GameStore4.swift
//  Jump
//
//  Created by Bridget Janicki on 7/25/19.
//  Copyright © 2019 Adam Janicki. All rights reserved.
//

import Foundation
import SpriteKit
class GameStore4: SKScene{
    //globes
    var coinTotal = UILabel()
    var totalCoins = 0
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
    var mapSelected = 0
    var backButt = SKLabelNode()
    var skinSelected = 0
    var has4 = 0
    var has5 = 0
    var has6 = 0
    override func didMove(to view: SKView) {
        backButt = self.childNode(withName: "backButt") as! SKLabelNode
        totalCoins = UserDefaults.standard.integer(forKey: "totalCoins")
        if totalCoins > -1{
            totalCoins = UserDefaults.standard.integer(forKey: "totalCoins")
        }
        else{
            totalCoins=0
            UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
        }
        skinSelected = UserDefaults.standard.integer(forKey: "skinSelected")
        if skinSelected > -1{
            skinSelected = UserDefaults.standard.integer(forKey: "skinSelected")
        }
        else{
            skinSelected=0
            UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
        }
        has4 = UserDefaults.standard.integer(forKey: "has4")
        if has4 > -1{
            has4 = UserDefaults.standard.integer(forKey: "has4")
        }
        else{
            has4=0
            UserDefaults.standard.set(has4, forKey: "has4")
        }
        has5 = UserDefaults.standard.integer(forKey: "has5")
        if has5 > -1{
            has5 = UserDefaults.standard.integer(forKey: "has5")
        }
        else{
            has5=0
            UserDefaults.standard.set(has5, forKey: "has5")
        }
        has6 = UserDefaults.standard.integer(forKey: "has6")
        if has6 > -1{
            has6 = UserDefaults.standard.integer(forKey: "has6")
        }
        else{
            has6=0
            UserDefaults.standard.set(has6, forKey: "has6")
        }
        coinTotal = UILabel(frame: CGRect(x:74, y: 110, width: labelWidth, height: labelHeight))
        coinTotal.textColor = .black
        coinTotal.font = UIFont.systemFont(ofSize: 48)
        coinTotal.text = "Coins: \(totalCoins)"
        buy1 = UILabel(frame: CGRect(x:134, y:195, width:labelWidth, height: labelHeight))
        if skinSelected == 4 && has4 == 1{
            buy1.text = "Selected"
        }
        else if skinSelected != 4 && has4 == 1{
            buy1.text = "Red Five"
        }
        else if skinSelected != 4 && has4 != 1{
            buy1.text = "Buy 500C"
        }
        buy1.textColor = .white
        buy1.font = UIFont.systemFont(ofSize: 46)
        buy2 = UILabel(frame: CGRect(x:134, y:350, width:labelWidth, height: labelHeight))
        if(has5 != 1){
            buy2.text = "Buy 500C"
        }
        else if has5 == 1 && skinSelected == 5{
            buy2.text = "Selected"
        }
        else if has5 == 1 && skinSelected != 5{
            buy2.text = "Falcon"
        }
        buy2.textColor = .white
        buy2.font = UIFont.systemFont(ofSize: 46)
        buy3 = UILabel(frame: CGRect(x:124, y:505, width:labelWidth, height: labelHeight))
        if(has6 != 1){
            buy3.text = "Buy 500C"
        }
        else if has6 == 1 && skinSelected == 6{
            buy3.text = "Selected"
        }
        else if has6 == 1 && skinSelected != 6{
            buy3.text = "Death Star"
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
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in: self)
            if atPoint(touchLocation).name == "backButt"{
                coinTotal.text = ""
                buy1.text = ""
                buy2.text = ""
                buy3.text = ""
                let gameStore3 = SKScene(fileNamed: "GameStore3")!
                gameStore3.scaleMode = .aspectFill
                view?.presentScene(gameStore3, transition: SKTransition.fade(withDuration: TimeInterval(0.01)))
            }
            if touchLocation.x > buyRect.origin.x - labelWidth/2 - con && touchLocation.x < buyRect.origin.x + labelWidth/2 + con2 && touchLocation.y > buyRect.origin.y - labelHeight - con3 && touchLocation.y < buyRect.origin.y + labelHeight && skinSelected != 4 && has4 == 1{
                buy1.text = "Selected"
                if(skinSelected == 5 && has5 == 1){
                    buy2.text = "Falcon"
                }
                if skinSelected == 6 && has6 == 1{
                    buy3.text = "Death Star"
                }
                skinSelected = 4
                UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                UserDefaults.standard.set(4, forKey: "mapSelected")
            }
            if touchLocation.x > buyRect.origin.x - labelWidth/2 - con && touchLocation.x < buyRect.origin.x + labelWidth/2 + con2 && touchLocation.y > buyRect.origin.y - labelHeight - con3 && touchLocation.y < buyRect.origin.y + labelHeight && has4 != 1 && totalCoins > 499{
                buy1.text = "Selected"
                if(skinSelected == 5 && has5 == 1){
                    buy2.text = "Falcon"
                }
                if skinSelected == 6 && has6 == 1{
                    buy3.text = "Death Star"
                }
                skinSelected = 4
                UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                has4 = 1
                UserDefaults.standard.set(has4, forKey: "has4")
                totalCoins-=500
                UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
                coinTotal.text = "Coins: \(totalCoins)"
                UserDefaults.standard.set(4, forKey: "mapSelected")
            }
            if touchLocation.x > buyRect2.origin.x - labelWidth/2 - con && touchLocation.x < buyRect2.origin.x + labelWidth/2 + con2 && touchLocation.y > (mult * buyRect2.origin.y) - labelHeight + con - con5 - con2 && touchLocation.y < (buyRect2.origin.y * mult) + labelHeight + con - con5 && has5 == 1 && skinSelected != 5{
                if(skinSelected == 4 && has4 == 1)
                {
                    buy1.text = "Red Five"
                }
                else if skinSelected == 6 && has6 == 1{
                    buy3.text = "Death Star"
                }
                skinSelected=5
                UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                buy2.text = "Selected"
                UserDefaults.standard.set(4, forKey: "mapSelected")
            }
            if touchLocation.x > buyRect2.origin.x - labelWidth/2 - con && touchLocation.x < buyRect2.origin.x + labelWidth/2 + con2 && touchLocation.y > (mult * buyRect2.origin.y) - labelHeight + con - con5 - con2 && touchLocation.y < (buyRect2.origin.y * mult) + labelHeight + con - con5 && totalCoins > 499 && has5 == 0{
                if(skinSelected == 4 && has4 == 1)
                {
                    buy1.text = "Red Five"
                }
                else if skinSelected == 6 && has6 == 1{
                    buy3.text = "Death Star"
                }
                has5 = 1
                UserDefaults.standard.set(has5, forKey: "has5")
                skinSelected=5
                UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                buy2.text = "Selected"
                totalCoins -= 500
                UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
                coinTotal.text = "Coins: \(totalCoins)"
                UserDefaults.standard.set(4, forKey: "mapSelected")
            }
            if touchLocation.x > buyRect3.origin.x - labelWidth/2 - con && touchLocation.x < buyRect3.origin.x + labelWidth/2 + con2 && touchLocation.y * mult > buyRect3.origin.y - labelHeight - con3 - con4 && touchLocation.y * mult < buyRect3.origin.y + labelHeight - con5 && skinSelected != 6 && has6 == 1 {
                if(skinSelected == 4 && has4 == 1)
                {
                    buy1.text = "Red Five"
                }
                else if skinSelected == 5 && has5 == 1{
                    buy2.text = "Falcon"
                }
                skinSelected=6
                UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                buy3.text = "Selected"
                UserDefaults.standard.set(4, forKey: "mapSelected")
                
            }
            if touchLocation.x > buyRect3.origin.x - labelWidth/2 - con && touchLocation.x < buyRect3.origin.x + labelWidth/2 + con2 && touchLocation.y * mult > buyRect3.origin.y - labelHeight - con3 - con4 && touchLocation.y * mult < buyRect3.origin.y + labelHeight - con5 && totalCoins > 499 && has6 == 0 {
                if(skinSelected == 4 && has4 == 1){
                    buy1.text = "Red Five"
                }
                else if skinSelected == 5 && has5 == 1{
                    buy2.text = "Falcon"
                }
                has6 = 1
                UserDefaults.standard.set(has6, forKey: "has6")
                skinSelected = 6
                UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                totalCoins -= 500
                UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
                coinTotal.text = "Coins: \(totalCoins)"
                buy3.text = "Selected"
                UserDefaults.standard.set(4, forKey: "mapSelected")
            }
            
        }
    }
}
