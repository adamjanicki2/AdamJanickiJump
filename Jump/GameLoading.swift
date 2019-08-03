//
//  GameLoading.swift
//  Jump
//
//  Created by Bridget Janicki on 7/22/19.
//  Copyright © 2019 Adam Janicki. All rights reserved.
//

import Foundation
import SpriteKit
class GameLoading: SKScene{
    var intro = UILabel()
    var intro2 = UILabel()
    var intro3 = UILabel()
    var t1: Timer? = nil
    var t2: Timer? = nil
    var t3: Timer? = nil
    var backgroundLabel = SKSpriteNode()
    override func didMove(to view: SKView) {
        backgroundLabel = self.childNode(withName: "backgroundLabel") as! SKSpriteNode
        intro = UILabel(frame: CGRect(x:96, y: 130, width: 750, height: 200))
        intro.textColor = .black
        intro.font = UIFont(name: "HelveticaNeue-Light", size: 72.0)
        intro.text = ""
        intro2 = UILabel(frame: CGRect(x:50, y: 330, width: 750, height: 200))
        intro2.textColor = .black
       intro2.font = UIFont(name: "HelveticaNeue-Light", size: 72.0)
        intro2.text = ""
        intro.text = "Adam"
        intro2.text = "Presents"
        intro3 = UILabel(frame: CGRect(x:78, y: 230, width: 750, height: 200))
        intro3.textColor = .black
        intro3.font = UIFont(name: "HelveticaNeue-Light", size: 72.0)
        intro3.text = "Janicki"
        startTimer()
    }
    func startTimer()
    {
        t1 = Timer.scheduledTimer(timeInterval: TimeInterval(2.0), target: self, selector: #selector(GameLoading.setFont), userInfo: nil, repeats: false)
    }
    @objc func setFont()
    {
        backgroundLabel.texture = SKTexture(imageNamed: "backgrounbd")
        t3 = Timer.scheduledTimer(timeInterval: TimeInterval(0.5), target: self, selector: #selector(GameLoading.loadAgain), userInfo: nil, repeats: false)
    }
    @objc func loadAgain(){
        view?.addSubview(intro)
        view?.addSubview(intro2)
        view?.addSubview(intro3)
        t2 = Timer.scheduledTimer(timeInterval: TimeInterval(2.0), target: self, selector: #selector(GameLoading.switchScene), userInfo: nil, repeats: false)
    }
    @objc func switchScene(){
        let gameMenu = SKScene(fileNamed: "GameMenu")!
        gameMenu.scaleMode = .aspectFill
        intro.text=""
        intro2.text=""
        intro3.text = ""
        view?.presentScene(gameMenu, transition: SKTransition.crossFade(withDuration: TimeInterval(1.0)))
    }
}
