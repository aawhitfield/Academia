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

    // names buttons from Layout Builder for use in code
    @IBOutlet weak var headClassroomButton: UIButton!
    @IBOutlet weak var storeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sets the size each button should be based on screen size
        let buttonWidth = Double(self.view.frame.size.width) / 5 
        let buttonHeight = Double(self.view.frame.size.height) / 2.25
        
        // sets the location each button should be based on screen size
        let classRoomButtonX = Double(self.view.frame.size.width) / 7
        let classRoomButtonY = Double(self.view.frame.size.width) / -7
        let storeButtonX = Double(self.view.frame.size.width) / 2.75
        let storeButtonY = Double(self.view.frame.size.width) / -7
        
        
        
        // sets button title and frame size
        headClassroomButton.setTitle("Test Button", for: .normal)
        headClassroomButton.frame = CGRect(x: 200, y: 50, width: 100, height: 100)
        headClassroomButton.translatesAutoresizingMaskIntoConstraints = false
        
        storeButton.setTitle("Test Button", for: .normal)
        storeButton.frame = CGRect(x: 200, y: 50, width: 100, height: 100)
        storeButton.translatesAutoresizingMaskIntoConstraints = false
        
        // sets layout constraints to the button
        let classWidthConstraints = NSLayoutConstraint(item: headClassroomButton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: CGFloat(buttonWidth))
        let classHeightConstraints = NSLayoutConstraint(item: headClassroomButton, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: CGFloat(buttonHeight))
        let class_xConstraints = NSLayoutConstraint(item: headClassroomButton, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: CGFloat(classRoomButtonX))
        let class_yConstraints = NSLayoutConstraint(item: headClassroomButton, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: CGFloat(classRoomButtonY))
        NSLayoutConstraint.activate([classHeightConstraints,classWidthConstraints,class_xConstraints,class_yConstraints])
        
        let storeWidthConstraints = NSLayoutConstraint(item: storeButton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: CGFloat(buttonWidth))
        let storeHeightConstraints = NSLayoutConstraint(item: storeButton, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: CGFloat(buttonHeight))
        let store_xConstraints = NSLayoutConstraint(item: storeButton, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: CGFloat(storeButtonX))
        let store_yConstraints = NSLayoutConstraint(item: storeButton, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: CGFloat(storeButtonY))
        NSLayoutConstraint.activate([storeHeightConstraints,storeWidthConstraints,store_xConstraints,store_yConstraints])


        
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
