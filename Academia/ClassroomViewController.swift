//
//  ClassroomViewController.swift
//  Academia
//
//  Created by XCodeClub on 2018-08-30.
//  Copyright © 2018 BinaryChaos. All rights reserved.
//

import UIKit
import AVFoundation

class ClassroomViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var healthBar: UIImageView!
    @IBOutlet weak var student1: UIImageView!
    @IBOutlet weak var healthBarWidthConstraint: NSLayoutConstraint!
    
    var timer = Timer()
    var minutes = 3
    var seconds = 0
    var healthBarWidth = 41
    
    // create audio player to play end of class bell
    var player = AVAudioPlayer()
    
    @objc func decreaseTimer()    // timer function to decrement time by one each second
        // added @objc to get selector to run
    {
        if minutes >= 0      // timer will run while time is still on the clock
        {
            if seconds == 0     // sets when to reset seconds at the start of next minute
            {
                minutes -= 1    // decrements minutes when switches to next minute
                seconds = 59    // resets seconds at the start of the next minute
            }
            else
            {
                seconds -= 1                    // decrements timer by one
            }
            if seconds >= 10
            {
                timerLabel.text = String(minutes) + ":" + String(seconds)   // formats seconds for two digit numbers
            }
            else
            {
                timerLabel.text = String(minutes) + ":0" + String(seconds)  // formats seconds for one digit numbers
                if seconds == 0     // sets when to reset seconds at the start of next minute
                {
                    minutes -= 1    // decrements minutes when switches to next minute
                    seconds = 60    // resets seconds at the start of the next minute
                }
            }
            
        }
        else
        {
            timerLabel.text = "0:00"
            timer.invalidate()  // stops timer when reaches zero
            
            // play class bell to signal end of period
            player.play()
            
            let alert = UIAlertController(title: "End of Class", message: "Class is over.", preferredStyle: .alert)     // creates the pop up to end class and sets the text
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                self.performSegue(withIdentifier: "ClassOver", sender: self)
                            }))
            self.present(alert, animated: true, completion: nil)    // sets what should happen when you press the OK button -> end of class scene
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
        
        if seconds >= 10
        {
            timerLabel.text = String(minutes) + ":" + String(seconds)   // formats seconds for two digit numbers
        }
        else
        {
            timerLabel.text = String(minutes) + ":0" + String(seconds)  // formats seconds for one digit numbers
        }
        
        // start timer countdown
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ClassroomViewController.decreaseTimer), userInfo: nil, repeats: true)
        
        // set file path for end of class period bell
        let audioPath = Bundle.main.path(forResource: "school_bell_short", ofType: "mp3")
        do
        {
           try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch
        {
            
        }
        
        // set up width of health bar
        //healthBarWidthConstraint = NSLayoutConstraint(item: healthBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 41)
        healthBarWidthConstraint.constant = 41
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
       
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
