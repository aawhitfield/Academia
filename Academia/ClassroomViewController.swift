//
//  ClassroomViewController.swift
//  Academia
//
//  Created by XCodeClub on 2018-08-30.
//  Copyright © 2018 BinaryChaos. All rights reserved.
//

import UIKit

class ClassroomViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    var time = 10
    
    @objc func decreaseTimer()    // timer function to decrement time by one each second
        // added @objc to get selector to run
    {
        if time >= 0
        {
            time -= 1
            timerLabel.text = String(time)
            
        }
        else
        {
            timer.invalidate()  // stops timer when reaches zero
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // start timer countdown
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ClassroomViewController.decreaseTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
