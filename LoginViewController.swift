//
//  LoginViewController.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/15/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var centerAlignUsername: NSLayoutConstraint!
   
    @IBOutlet weak var centerAlignPassword: NSLayoutConstraint!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        


       
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        centerAlignUsername.constant -= view.bounds.width
        centerAlignPassword.constant -= view.bounds.width
//        signInButton.alpha = 0.0
        animateBackground()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        animateBackground()
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.centerAlignUsername.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.centerAlignPassword.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
//        UIView.animateWithDuration(0.5, delay: 0.6, options: [.Repeat, .Autoreverse], animations: {
//            self.signInButton.alpha = 1
//            self.signInButton.userInteractionEnabled = true
//            }, completion: nil)
        
        
    }
    
    func animateBackground() {
//        let animationOptions = [UIViewAnimationOptions.Repeat, UIViewAnimationOptions.CurveLinear]
        let backgroundImage = UIImage(named:"ocean1")!
        let amountToKeepImageSquare = backgroundImage.size.height - self.view.frame.size.height
        
        // UIImageView 1
        let backgroundImageView1 = UIImageView(image: UIImage(named: "ocean1"))
        backgroundImageView1.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: backgroundImage.size.width - amountToKeepImageSquare, height: self.view.frame.size.height)
        self.view.addSubview(backgroundImageView1)
        self.view.sendSubviewToBack(backgroundImageView1)
        
        // UIImageView 2
        let backgroundImageView2 = UIImageView(image: UIImage(named: "ocean2"))
        backgroundImageView2.frame = CGRect(x: backgroundImageView1.frame.size.width, y: self.view.frame.origin.y, width: backgroundImage.size.width - amountToKeepImageSquare, height: self.view.frame.height)
        self.view.addSubview(backgroundImageView2)
        self.view.sendSubviewToBack(backgroundImageView2)
        
        // Animate background
        UIView.animateWithDuration(50.0, delay: 0.0, options: [.Repeat, .CurveLinear], animations: {
            backgroundImageView1.frame = CGRectOffset(backgroundImageView1.frame, -1 * backgroundImageView1.frame.size.width, 0.0)
            backgroundImageView2.frame = CGRectOffset(backgroundImageView2.frame, -1 * backgroundImageView2.frame.size.width, 0.0)
            }, completion: nil)
        
        // Have something in the foreground look like its moving
//        var square = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        let squareImageView = UIImageView(image: UIImage(named: "platyicon2"))
//        square = squareImageView
//        square.frame.origin = CGPoint(x: self.view.frame.origin.x + 25, y: self.view.frame.size.height - 75)
//        square.backgroundColor = UIColor.darkGrayColor()
//        self.view.addSubview(square)
        
        
        // Animate foreground
        UIView.animateWithDuration(10, delay: 0, options: [.Repeat, .CurveLinear], animations: {
//            square.transform = CGAffineTransformMakeRotation(100)
            }, completion: nil)
    }
    

    



        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
