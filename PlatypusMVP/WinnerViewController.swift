//
//  WinnerViewController.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/17/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {
    
     var challenges : Challenges?

    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Good Stuff 👍🏽"
        self.scoreLabel.textColor = UIColor .whiteColor()
        self.backgroundView.image = self.challenges?.background
        self.doneButton.setTitleColor(UIColor .blueColor(), forState: .Normal)
        self.doneButton.layer.cornerRadius = 8.0
        self.doneButton.layer.backgroundColor = UIColor .whiteColor().CGColor
        self.doneButton.layer.borderColor = UIColor .blueColor().CGColor
        self.doneButton.layer.borderWidth = 2.0
        self.doneButton.layer.shadowColor = UIColor .blackColor().CGColor
        self.doneButton.layer.shadowOpacity = 5.0
        self.doneButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! ChallengesTableViewController
        destination.challengeWin = self.challenges
        print ("\(self.challenges?.number)")
        

    }


}
