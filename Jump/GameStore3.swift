//
//  GameStore3.swift
//  Jump
//
//  Created by Bridget Janicki on 7/23/19.
//  Copyright © 2019 Adam Janicki. All rights reserved.
//

import Foundation
import SpriteKit
class GameStore3: SKScene{
    //globals
    var backBu = SKLabelNode()
    var nextButt = SKLabelNode()
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
    var map1 = 0
    var map2 = 0
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
        mapSelected = UserDefaults.standard.integer(forKey: "mapSelected")
        if mapSelected > -1{
            mapSelected = UserDefaults.standard.integer(forKey: "mapSelected")
        }
        else{
            mapSelected=0
            UserDefaults.standard.set(mapSelected, forKey: "mapSelected")
        }
        skinSelected = UserDefaults.standard.integer(forKey: "skinSelected")
        if skinSelected > -1{
            skinSelected = UserDefaults.standard.integer(forKey: "skinSelected")
        }
        else{
            skinSelected=0
            UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
        }
        map1 = UserDefaults.standard.integer(forKey: "map1")
        if map1 > -1{
            map1 = UserDefaults.standard.integer(forKey: "map1")
        }
        else{
            map1=0
            UserDefaults.standard.set(map1, forKey: "map1")
        }
        map2 = UserDefaults.standard.integer(forKey: "map2")
        if map2 > -1{
            map2 = UserDefaults.standard.integer(forKey: "map2")
        }
        else{
            map2=0
            UserDefaults.standard.set(map2, forKey: "map2")
        }
        backBu = self.childNode(withName: "backBu") as! SKLabelNode
        nextButt = self.childNode(withName: "nextButt") as! SKLabelNode
        coinTotal = UILabel(frame: CGRect(x:74, y: 110, width: labelWidth, height: labelHeight))
        coinTotal.textColor = .black
        coinTotal.font = UIFont.systemFont(ofSize: 48)
        coinTotal.text = "Coins: \(totalCoins)"
        buy1 = UILabel(frame: CGRect(x:134, y:195, width:labelWidth, height: labelHeight))
        if mapSelected == 1{
            buy1.text = "Selected"
        }
        else{
            buy1.text = "  Day"
        }
        buy1.textColor = .white
        buy1.font = UIFont.systemFont(ofSize: 46)
        buy2 = UILabel(frame: CGRect(x:134, y:350, width:labelWidth, height: labelHeight))
        if(map1 != 1){
            buy2.text = "Buy 200C"
        }
        else if map1 == 1 && mapSelected == 2{
            buy2.text = "Selected"
        }
        else if map1 == 1 && mapSelected != 2{
            buy2.text = "Night"
        }
        buy2.textColor = .white
        buy2.font = UIFont.systemFont(ofSize: 46)
        buy3 = UILabel(frame: CGRect(x:134, y:505, width:labelWidth, height: labelHeight))
        if(map2 != 1){
            buy3.text = "Buy 300C"
        }
        else if map2 == 1 && mapSelected == 3{
            buy3.text = "Selected"
        }
        else if map2 == 1 && mapSelected != 3{
            buy3.text = "Desert"
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
            buy1.text = "  Day"
            if map1 == 1{
                buy2.text = "Night"
            }
            if map1 != 1{
                buy2.text = "Buy 300C"
            }
            if map2 == 1{
                buy3.text = "Desert"
            }
            if map2 != 1{
                buy3.text = "Buy 400C"
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in: self)
            if atPoint(touchLocation).name == "backBu"{
                coinTotal.text = ""
                buy1.text = ""
                buy2.text = ""
                buy3.text = ""
                let gameStore2 = SKScene(fileNamed: "GameStore2")!
                gameStore2.scaleMode = .aspectFill
                view?.presentScene(gameStore2, transition: SKTransition.fade(withDuration: TimeInterval(0.01)))
            }
            if atPoint(touchLocation).name == "nextButt"{
                coinTotal.text = ""
                buy1.text = ""
                buy2.text = ""
                buy3.text = ""
                let gameStore4 = SKScene(fileNamed: "GameStore4")!
                gameStore4.scaleMode = .aspectFill
                view?.presentScene(gameStore4, transition: SKTransition.fade(withDuration: TimeInterval(0.01)))
            }
            //buying stuff
            if touchLocation.x > buyRect.origin.x - labelWidth/2 - con && touchLocation.x < buyRect.origin.x + labelWidth/2 + con2 && touchLocation.y > buyRect.origin.y - labelHeight - con3 && touchLocation.y < buyRect.origin.y + labelHeight && mapSelected != 1{
                buy1.text = "Selected"
                if mapSelected == 2 && map1 == 1{
                    buy2.text = "Night"
                }
                else if mapSelected == 3 && map1 == 1{
                    buy3.text = "Desert"
                }
                mapSelected = 1
                UserDefaults.standard.set(mapSelected, forKey: "mapSelected")
                if skinSelected == 4 || skinSelected == 5 || skinSelected == 6{
                    skinSelected = 1
                    UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                }
            }
            if touchLocation.x > buyRect2.origin.x - labelWidth/2 - con && touchLocation.x < buyRect2.origin.x + labelWidth/2 + con2 && touchLocation.y > (mult * buyRect2.origin.y) - labelHeight + con - con5 - con2 && touchLocation.y < (buyRect2.origin.y * mult) + labelHeight + con - con5 && totalCoins > 199 && map1 == 0{
                if(mapSelected == 1)
                {
                    buy1.text = "  Day"
                }
                else if mapSelected == 3 && map2 == 1{
                    buy3.text = "Desert"
                }
                map1 = 1
                UserDefaults.standard.set(map1, forKey: "map1")
                mapSelected=2
                UserDefaults.standard.set(mapSelected, forKey: "mapSelected")
                buy2.text = "Selected"
                totalCoins -= 200
                UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
                coinTotal.text = "Coins: \(totalCoins)"
                if skinSelected == 4 || skinSelected == 5 || skinSelected == 6{
                    skinSelected = 1
                    UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                }
            }
            if touchLocation.x > buyRect2.origin.x - labelWidth/2 - con && touchLocation.x < buyRect2.origin.x + labelWidth/2 + con2 && touchLocation.y > (mult * buyRect2.origin.y) - labelHeight + con - con5 - con2 && touchLocation.y < (buyRect2.origin.y * mult) + labelHeight + con - con5 && map1 == 1 && mapSelected != 2{
                if(mapSelected == 1)
                {
                    buy1.text = "  Day"
                }
                else if mapSelected == 3 && map2 == 1{
                    buy3.text = "Desert"
                }
                mapSelected=2
                UserDefaults.standard.set(mapSelected, forKey: "mapSelected")
                buy2.text = "Selected"
                if skinSelected == 4 || skinSelected == 5 || skinSelected == 6{
                    skinSelected = 1
                    UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                }
            }
            if touchLocation.x > buyRect3.origin.x - labelWidth/2 - con && touchLocation.x < buyRect3.origin.x + labelWidth/2 + con2 && touchLocation.y * mult > buyRect3.origin.y - labelHeight - con3 - con4 && touchLocation.y * mult < buyRect3.origin.y + labelHeight - con5 && totalCoins > 299 && map2 == 0 {
                if(mapSelected == 1){
                    buy1.text = "  Day"
                }
                else if mapSelected == 2 && map1 == 1{
                    buy2.text = "Night"
                }
                map2 = 1
                UserDefaults.standard.set(map2, forKey: "map2")
                mapSelected = 3
                UserDefaults.standard.set(mapSelected, forKey: "mapSelected")
                totalCoins -= 300
                UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
                coinTotal.text = "Coins: \(totalCoins)"
                buy3.text = "Selected"
                if skinSelected == 4 || skinSelected == 5 || skinSelected == 6{
                    skinSelected = 1
                    UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                }
            }
            if touchLocation.x > buyRect3.origin.x - labelWidth/2 - con && touchLocation.x < buyRect3.origin.x + labelWidth/2 + con2 && touchLocation.y * mult > buyRect3.origin.y - labelHeight - con3 - con4 && touchLocation.y * mult < buyRect3.origin.y + labelHeight - con5 && map2 == 1 && mapSelected != 3 {
                if(mapSelected == 1)
                {
                    buy1.text = "  Day"
                }
                else if mapSelected == 2 && map1 == 1{
                    buy2.text = "Night"
                }
                mapSelected = 3
                UserDefaults.standard.set(mapSelected, forKey: "mapSelected")
                buy3.text = "Selected"
                if skinSelected == 4 || skinSelected == 5 || skinSelected == 6{
                    skinSelected = 1
                    UserDefaults.standard.set(skinSelected, forKey: "skinSelected")
                }
            }
            
        }
    }
}
