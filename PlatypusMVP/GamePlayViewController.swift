//
//  GamePlayViewController.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/15/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit
import AVFoundation

class GamePlayViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var cardView: UIImageView!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var timerOutlet: UILabel!

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var backgroundImage: UIImageView!
    var challenges : Challenges?
    
    var timer = NSTimer()
    var seconds = 30
    var counter: Int = 0
    
    let animationDuration: NSTimeInterval = 0.25
    let switchingInterval: NSTimeInterval = 1000
    
    var audioPlayer:AVAudioPlayer?
    
    func setupGame()  {
                seconds = 70
                timerOutlet.text = "Time: \(seconds)"
        
        if !timer.valid{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.10, target: self, selector: "subtractTime", userInfo: nil, repeats: true)
        }
        
        
    }
    
    func restartGame(){
        
        timer.invalidate()
            setupGame()
        self.cardView.image = (UIImage(named: (self.challenges?.gameOrder[0])!))!
       
            counter = 0
            self.buttonOne.titleLabel?.text = self.challenges?.gameOrder[0]
            self.buttonTwo.titleLabel?.text = self.challenges?.gameOrder[1]
            self.progressView.progress = 0
            self.label.text = "\(counter+1)/\(self.challenges!.gameOrder.count)"

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGame()
        
        self.backgroundImage.image = (self.challenges?.background)

        self.progressView.progress = 0
        
        animateImageView()

        navigationItem.title = challenges?.name

        
        self.buttonOne.layer.borderColor = (UIColor .blueColor()).CGColor
        self.buttonOne.layer.borderWidth = 1.5
        self.buttonTwo.layer.borderColor = (UIColor .blueColor()).CGColor
        self.buttonOne.layer.cornerRadius = 8.0
        self.buttonOne.backgroundColor = (UIColor .whiteColor())
        self.buttonTwo.layer.borderWidth = 1.5
        self.buttonTwo.layer.cornerRadius = 8.0
        self.buttonTwo.backgroundColor = (UIColor .whiteColor())
        self.label.text = ("\(counter+1)/\(self.challenges!.gameOrder.count)")
        self.label.textColor = UIColor .whiteColor()
        self.cardView.image = UIImage(named: (self.challenges?.gameOrder[0])!)!
        self.buttonOne.setTitle(self.challenges?.gameOrder[0], forState: UIControlState.Normal)
        self.buttonTwo.setTitle(self.challenges?.gameOrder[1], forState: UIControlState.Normal)
        self.buttonOne.layer.shadowOpacity = 20.0
        self.buttonTwo.layer.shadowOpacity = 0.7
        self.buttonOne.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        self.buttonTwo.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        self.buttonOne.layer.shadowColor = UIColor .blackColor().CGColor
        self.buttonTwo.layer.shadowColor = UIColor .blackColor().CGColor
        self.progressView.transform = CGAffineTransformScale(self.progressView.transform, 1, 5)
        self.progressView.trackTintColor = UIColor .whiteColor()
        self.progressView.clipsToBounds = true
        
        }
    

         func subtractTime(){
            seconds--
            timerOutlet.text = "Time: \(seconds)"
            
            if (seconds == 0) {
                timer.invalidate()
                let alert = UIAlertController(title: "Time is up!",
                    message: "You lose",
                    preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: {
                    action in self.restartGame()
                    self.animateImageView()
                }))
                presentViewController(alert, animated: true, completion:nil)
            }
    }
    
//////////////////////////////// Progress View ///////////////////////////////////
    
    func updateProgress() {
        
        let double: Double = Double((self.challenges?.gameOrder.count)!)
        
        let float: Float = Float(1.0/(double))
        progressView?.progress += float
//        let progressValue = self.progressView?.progress
//        self.label?.text = "\(progressValue! * 100) %"
//        progressView.setProgress(float, animated: true)
        
    }

///////////////////////// Animate Card View ///////////////////////////////////
    
    func animateImageView() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(animationDuration)
        CATransaction.setCompletionBlock {
            let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(self.switchingInterval * NSTimeInterval(NSEC_PER_SEC)))
            dispatch_after(delay, dispatch_get_main_queue()) {
                self.animateImageView()
            }
    }
        let transition = CATransition()
        transition.type = kCATransitionFade
        self.animateButton()
        
        self.cardView.layer.addAnimation(transition, forKey: kCATransition)
        self.cardView.image = UIImage(named: (self.challenges?.gameOrder[counter])!)
        
        CATransaction.commit()
    }
    
///////////////////////////// Animate Button ////////////////////////////////////
    
    func animateButton() {
        self.buttonOne.transform = CGAffineTransformMakeScale(0.1, 0.1)
        self.buttonTwo.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        UIView.animateWithDuration(1.0,
            delay: 1.0,
            usingSpringWithDamping: CGFloat(1.0),
            initialSpringVelocity: CGFloat(10.0),
            options: UIViewAnimationOptions.TransitionNone,
            animations: {
                self.buttonOne.transform = CGAffineTransformIdentity
                self.buttonTwo.transform = CGAffineTransformIdentity
            },
            completion: { finished in
                    self
            }
        )
    }
    
//////////////////////////// Right Button Tapped ////////////////////////////////

    func buttonRightTapped(sender:UIButton) {
        var buttons = [self.buttonOne, self.buttonTwo]
        self.updateProgress()
        self.animateImageView()
        counter++
        
        timer.invalidate()
        setupGame()
    
        
        let alert = UIAlertController(title:"Congrats!", message:"Congratulations, you have just completed the challenge", preferredStyle: UIAlertControllerStyle.Alert)
        let acceptAction = UIAlertAction(title:"I am a Champion", style: .Default) { (_) -> Void in
        self.performSegueWithIdentifier("Completed", sender:self)
        }
            alert.addAction(acceptAction)
        
        if UIImage(named: (self.challenges?.gameOrder[counter])!) == UIImage(named: self.challenges!.gameOrder.last!) {
                presentViewController(alert, animated: true, completion: { () -> Void in
                    self
                })
            timer.invalidate()
        }
        
        self.cardView.image = UIImage(named: (self.challenges?.gameOrder[counter])!)
        
        self.buttonOne.backgroundColor = (UIColor .whiteColor())
        self.buttonTwo.backgroundColor = (UIColor .whiteColor())
        
        
        self.label.text = ("\(counter+1)/\(self.challenges!.gameOrder.count)")
        
        self.label.textColor = UIColor .whiteColor()
        
    
    let rightButton: UIButton! = buttons[Int(arc4random_uniform(UInt32(buttons.count)))]
            
        rightButton.setTitle(self.challenges?.gameOrder[counter], forState: UIControlState.Normal)
        
        
    
        while rightButton.titleLabel?.text != self.buttonOne.titleLabel?.text {
            
            
            self.buttonOne.titleLabel?.text = self.challenges?.gameOrder[Int(arc4random_uniform(UInt32((self.challenges?.gameOrder.count)!)))]
            

            
        }
        
        
        while rightButton.titleLabel?.text != self.buttonTwo.titleLabel?.text {
            
            
            self.buttonTwo.titleLabel?.text = self.challenges?.gameOrder[Int(arc4random_uniform(UInt32((self.challenges?.gameOrder.count)!
                )))]
        
        }
        
        while rightButton.titleLabel?.text == self.buttonTwo.titleLabel?.text && rightButton.titleLabel?.text == self.buttonOne.titleLabel?.text {
            
            self.buttonOne.titleLabel?.text = self.challenges?.gameOrder[Int(arc4random_uniform(UInt32((self.challenges?.gameOrder.count)!)))]
            self.buttonTwo.titleLabel?.text = self.challenges?.gameOrder[Int(arc4random_uniform(UInt32((self.challenges?.gameOrder.count)!)))]
        }
        
        
    }
    
///////////////////////////////// Wrong Button Tapped //////////////////////////////////////////////////
    
    func buttonWrongTapped(sender: UIButton) {
        
        timer.invalidate()
        setupGame()
        
        counter = 0
        
        self.cardView.image = UIImage(named: (self.challenges?.gameOrder[0])!)
        
        self.buttonOne.setTitle(self.challenges?.gameOrder[0], forState: UIControlState.Normal)
        
        self.buttonTwo.setTitle(self.challenges?.gameOrder[Int(arc4random_uniform(UInt32((self.challenges?.gameOrder.count)!)))], forState: UIControlState.Normal)
        
        self.buttonOne.backgroundColor = (UIColor .whiteColor())
        
        self.buttonTwo.backgroundColor = (UIColor .whiteColor())
        
        self.progressView.progress = 0
        
        self.label.text = ("\(counter+1)/\(self.challenges!.gameOrder.count)")
        self.label.textColor = UIColor .whiteColor()
    }
    
    
    
/////////////////////////////// Stopping the Audio Player /////////////////////////////
    
    
    override func viewWillDisappear(animated: Bool) {
        self.audioPlayer?.stop()
        
    }
    
///////////////////////////////// UI Button Tapped //////////////////////////////////
    

    @IBAction func buttonTapped(sender: UIButton) {
        
        if self.challenges?.gameOrder[counter] == sender.titleLabel?.text {
            
        self.buttonRightTapped(sender)
            
            self.buttonOne.titleLabel?.text = self.challenges?.gameOrder[Int(arc4random_uniform(UInt32((self.challenges?.gameOrder.count)!)))]
            self.buttonTwo.titleLabel?.text = self.challenges?.gameOrder[Int(arc4random_uniform(UInt32((self.challenges?.gameOrder
                .count)!)))]
            
        } else {
            
            let color: CABasicAnimation = CABasicAnimation(keyPath: "backgroundColor")
            color.fromValue = UIColor.whiteColor().CGColor
            color.toValue = UIColor.redColor().CGColor
            color.duration = 0.5
            color.autoreverses = true
            sender.layer.backgroundColor = UIColor.whiteColor().CGColor
            sender.layer.addAnimation(color, forKey: "")
            
            sender.backgroundColor = (UIColor .redColor())

            
            self.buttonWrongTapped(sender)

            
                }
        }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Completed" {
          
            let destination  =  segue.destinationViewController as! WinnerViewController
            destination.challenges = self.challenges
            
        }

    }

}



