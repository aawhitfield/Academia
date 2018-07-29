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
        
        let buttonWidth = Double(self.view.frame.size.width) / 5 
        let buttonHeight = Double(self.view.frame.size.height) / 3
        let classRoomButtonX = Double(self.view.frame.size.width) / 7
        let classRoomButtonY = Double(self.view.frame.size.width) / -7
            
        headClassroomButton.setTitle("Test Button", for: .normal)
        headClassroomButton.frame = CGRect(x: 200, y: 50, width: 100, height: 100)
        headClassroomButton.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraints = NSLayoutConstraint(item: headClassroomButton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: CGFloat(buttonWidth))
        let heightConstraints = NSLayoutConstraint(item: headClassroomButton, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: CGFloat(buttonHeight))
        let xConstraints = NSLayoutConstraint(item: headClassroomButton, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: CGFloat(classRoomButtonX))
        let yConstraints = NSLayoutConstraint(item: headClassroomButton, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: CGFloat(classRoomButtonY))
        NSLayoutConstraint.activate([heightConstraints,widthConstraints,xConstraints,yConstraints])


        
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
