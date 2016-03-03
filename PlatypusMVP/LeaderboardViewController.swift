//
//  LeaderboardViewController.swift
//  PlatypusMVP
//
//  Created by John McCants on 2/25/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController, UICollectionViewDelegate {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var profileImages: [UIImage] = [UIImage(named: "Pikachu")!, UIImage(named: "Charmander")!, UIImage(named: "Squirtle")!]
    
    var scores: [String] = []
    
    var colors: [CGColor] = []
 
    var leaders: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leaderbackground = UIImageView(image: UIImage(named: "ocean"))
       
        self.collectionView.backgroundView = leaderbackground

        self.navigationItem.title = "Leaderboard ✊🏽"
        
        self.leaders = ["John", "Jamar", "Jimmy"]
        
        self.scores = ["374", "225", "102"]
        
        self.colors = [UIColor .greenColor().CGColor, UIColor .yellowColor().CGColor, UIColor .orangeColor().CGColor]
        

    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.leaders.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> LeaderboardCollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! LeaderboardCollectionViewCell
        
        cell.profileImage.image = self.profileImages[indexPath.row]
        cell.totalScoreLabel.text = self.scores[indexPath.row]
        cell.usernameLabel.text = self.leaders[indexPath.row]
        cell.layer.backgroundColor = self.colors[indexPath.row]
        
        cell.layer.cornerRadius = 8.0
        cell.clipsToBounds = true
        cell.layer.borderWidth = 1.0
  

  
        return cell
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
