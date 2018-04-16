//
//  GameViewController.swift
//  Battle_of_the_Stereotypes
//
//  Created by student on 15.04.18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

   let tapRec = UITapGestureRecognizer()
    
    @IBOutlet weak var p1: UIImageView!
    @IBOutlet weak var p2: UIImageView!
    @IBOutlet weak var arrow: UIView!
    @IBOutlet weak var zurueckZiehen: UIButton!
    
    func imagetap(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedView(tapGestureRecognizer:)))
        print("test2")
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(holdView(tapGestureRecognizer:)))
        p1.isUserInteractionEnabled = true
        p1.addGestureRecognizer(tapGestureRecognizer)
        p1.addGestureRecognizer(longGesture)
    }
    
    @objc func tappedView(tapGestureRecognizer: UITapGestureRecognizer){
        print("image tapped")
    }
    @objc func holdView(tapGestureRecognizer: UITapGestureRecognizer){
        arrow.isHidden = false;
        var point = CGPoint(x: 0, y: 0)
        var start = CGPoint(x: 0, y: 0)
         point = tapGestureRecognizer.location(in: p1)
        
        if tapGestureRecognizer.state == .began {

            start.x = point.x + p1.center.x
            start.y = point.y + p1.center.y
            
            print(point)
        }
        print("image hold")
        arrow.transform = CGAffineTransform(rotationAngle: (point.x + p1.center.x)/50)
        arrow.transform = CGAffineTransform(rotationAngle: (point.y + p1.center.y)/50)
        arrow.layer.anchorPoint = CGPoint(x:p1.center.x, y:p1.center.y);
         if tapGestureRecognizer.state == .ended {
            arrow.isHidden = true
        }
    }
    func scaleImage(_ sender: UIPinchGestureRecognizer) {
        arrow.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    @IBAction func back(_ sender: Any) {
        print(sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            imagetap()
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
    
        }
    }

   
}
