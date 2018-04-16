//
//  GameScene.swift
//  Battle_of_the_Stereotypes
//
//  Created by student on 15.04.18.
//  Copyright © 2018 student. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    func werfen(frm:CGRect) -> CGPoint{
        let xW = frm.origin.x + frm.width
        let yH = frm.origin.y + frm.height
        

        print("werfen")
        print("test")
        print(xW)
        print(yH)
        return CGPoint(x:xW,y:yH)
    }
    
}
