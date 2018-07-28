//
//  GameViewController.swift
//  Academia
//
//  Created by XCodeClub on 2018-07-17.
//  Copyright © 2018 BinaryChaos. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    // set size of buttons to be a function of screen size for adaptive layout
    var widthMultiplier = 0.0
    var heightMultiplier = 0.0

    @IBOutlet weak var headClassroomButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        widthMultiplier = Double(self.view.frame.size.width) / 110
        heightMultiplier = Double(self.view.frame.size.height) / 145
        
        headClassroomButton.frame.size.width = 10.0 // headClassroomButton.frame.width * CGFloat(widthMultiplier)
        headClassroomButton.frame.size.height = 10.0 // headClassroomButton.frame.height * CGFloat(heightMultiplier)
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // hide the navigation bar on this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
