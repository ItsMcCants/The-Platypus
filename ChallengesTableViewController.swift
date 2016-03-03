//
//  ChallengesTableViewController.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/15/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit
import AVFoundation

class ChallengesTableViewController: UITableViewController {
    var challenges : [Challenges] = []
    var winnerImg = UIImage()
    var didUnwind = false
    var backgroundImages = [UIImage]()
    var challenge : Challenges?
    
    var challengeWin : Challenges?
 
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.challenges = Challenges.giveAllChallenges()
   
        
        

        
     
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .ScaleAspectFit
        let logo = UIImage(named: "logo-1")
        imageView.image = logo
        self.navigationItem.titleView = imageView
        
        self.barButton.title = "😏🏆"
        
        self.tableView.reloadData()
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.challenges.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("challengeCell", forIndexPath: indexPath) as! ChallengeCell
        
        
        cell.titleLabel.text = challenges[indexPath.row].name
        cell.detailLabel.text = challenges[indexPath.row].challengeInfo
        cell.badgeImage.image = challenges[indexPath.row].badge
        cell.cellBackground.image = challenges[indexPath.row].background
        
        
        
        return cell
    }
    
    
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        
        didUnwind = true
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        
        if didUnwind {
            let newImageView = UIImageView()
            newImageView.image = UIImage(named: "cup-512")
            newImageView.alpha = 0
            let int = self.challengeWin?.number
            print("\(self.challengeWin!.number)")
            
            
            let cell = tableView.visibleCells[int!] as! ChallengeCell
            newImageView.frame = cell.badgeImage.bounds
            cell.badgeImage.addSubview(newImageView)
            
            UIView.animateWithDuration(1, animations: { () -> Void in
                newImageView.alpha = 1
                }) { (Bool) -> Void in
                    cell.badgeImage.image = newImageView.image
                    newImageView.removeFromSuperview()
            }
            
            didUnwind = false
        }
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "leaderboard" {
            
       segue.destinationViewController as! LeaderboardViewController
            
        } else {
        let destination  =  segue.destinationViewController as! StartViewController
        
        let indexPath = tableView.indexPathForSelectedRow
        
        destination.challenges = self.challenges[indexPath!.row]
            
        }
        
        
        
    }
    
    
}
