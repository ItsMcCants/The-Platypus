//
//  StartViewController.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/15/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit
import AVFoundation

class StartViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var challengeImageOutlet: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    var audioPlayer:AVAudioPlayer?
    
    var challenges : Challenges?
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
  
            let backMusic = setupAudioPlayerWithFile(self.challenges!.sound, type: "mp3")
            
            backMusic.play()
            
            animateBackground()

            self.challengeImageOutlet.image = challenges?.badge
            self.startButton.backgroundColor = UIColor.whiteColor()
            self.startButton.layer.borderColor = UIColor.blueColor().CGColor
            self.startButton.layer.borderWidth = 1.5
            self.startButton.layer.cornerRadius = 8.0
            self.navigationItem.title = "Challenge"
            self.titleLabel.text = self.challenges?.name
            self.titleLabel.textColor = UIColor .whiteColor()
            self.descriptionLabel.textColor = UIColor .whiteColor()
            self.descriptionLabel.text = self.challenges?.challengeInfo
            
            
    }
    

    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer  {
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("NO AUDIO PLAYER")
        }
        
        return audioPlayer!
    }
    
    func backButtonTapped() {
        
        if ((self.navigationItem.backBarButtonItem?.action) != nil) {
            self.audioPlayer?.stop()
        }
    }
    
    
    
    func animateBackground() {
        //        let animationOptions = [UIViewAnimationOptions.Repeat, UIViewAnimationOptions.CurveLinear]
        let backgroundImage = self.challenges?.background
        let amountToKeepImageSquare = backgroundImage!.size.height - self.view.frame.size.height
        
        // UIImageView 1
        let backgroundImageView1 = UIImageView(image: self.challenges?.background)
        backgroundImageView1.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: backgroundImage!.size.width - amountToKeepImageSquare, height: self.view.frame.size.height)
        self.view.addSubview(backgroundImageView1)
        self.view.sendSubviewToBack(backgroundImageView1)
        
        // UIImageView 2
        let backgroundImageView2 = UIImageView(image: self.challenges?.background)
        backgroundImageView2.frame = CGRect(x: backgroundImageView1.frame.size.width, y: self.view.frame.origin.y, width: backgroundImage!.size.width - amountToKeepImageSquare, height: self.view.frame.height)
        self.view.addSubview(backgroundImageView2)
        self.view.sendSubviewToBack(backgroundImageView2)
        
        // Animate background
        UIView.animateWithDuration(50.0, delay: 0.0, options: [.Repeat, .CurveLinear], animations: {
            backgroundImageView1.frame = CGRectOffset(backgroundImageView1.frame, -1 * backgroundImageView1.frame.size.width, 0.0)
            backgroundImageView2.frame = CGRectOffset(backgroundImageView2.frame, -1 * backgroundImageView2.frame.size.width, 0.0)
            }, completion: nil)
        
        
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destination = segue.destinationViewController as! GamePlayViewController
        
        destination.challenges = self.challenges
        destination.audioPlayer = self.audioPlayer
        
    }

}

