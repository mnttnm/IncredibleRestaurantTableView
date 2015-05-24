//
//  RestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by Mohit Tater on 23/05/15.
//  Copyright (c) 2015 beware. All rights reserved.
//

import UIKit

class RestaurantTableTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg",
        "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg",
        "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg",
        "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg",
        "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney","New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London","London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop",
            "Cafe", "Tea House", "Austrian / Causual Drink",
            "French", "Bakery", "Bakery", "Chocolate", "Cafe",
            "American / Seafood", "American", "American",
            "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish",
            "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = [Bool] (count: 21, repeatedValue: false)


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as CustomTableViewCell

        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        if restaurantIsVisited[indexPath.row] {
            cell.accessoryType = .Checkmark
            
        } else {
            cell.accessoryType = .None
        }
        
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width/2
     
        cell.thumbnailImageView.clipsToBounds = true

        
        return cell
    }


    override func tableView(tableView: UITableView, commitEditingStyle editingStyle:UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

        }
        else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

// add actions for row elements of tableView this function will return delete and share function for the row element
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath:
            NSIndexPath) -> [AnyObject] {
            var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title:
            "Share", handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            let shareMenu = UIAlertController(title: nil, message: "Share using",
        preferredStyle: .ActionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style:
        UIAlertActionStyle.Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style:
        UIAlertActionStyle.Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: UIAlertActionStyle.Default,
        handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel,
        handler: nil)
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            self.presentViewController(shareMenu, animated: true, completion: nil)
            } )
            
            var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default,
    title: "Delete",handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
    // Delete the row from the data source
    self.restaurantNames.removeAtIndex(indexPath.row)
    self.restaurantLocations.removeAtIndex(indexPath.row)
    self.restaurantTypes.removeAtIndex(indexPath.row)
    self.restaurantIsVisited.removeAtIndex(indexPath.row)
    self.restaurantImages.removeAtIndex(indexPath.row)
    self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } )
            return [deleteAction, shareAction]
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let optionMenu =
        UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
        
    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
    
        optionMenu.addAction(cancelAction)
        
  
        
    let callActionHandler = { (action:UIAlertAction!) -> Void in
        let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry,the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
        alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alertMessage, animated: true, completion: nil)
    }
        
    let callAction = UIAlertAction(title: "Call " + "900-23333-\(indexPath.row)", style:
            UIAlertActionStyle.Default, handler: callActionHandler)
        
        optionMenu.addAction(callAction)
        
  
    let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: {
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
            self.restaurantIsVisited[indexPath.row] = true
            })
    
    let noLongerFavoriteAction = UIAlertAction(title: "Still wanna go there?", style: .Default, handler: {
            (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title:nil, message: "keep in favorite?", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "Yes", style:.Default, handler:nil))
            alertMessage.addAction(UIAlertAction(title: "No", style:.Default, handler: {
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .None
            self.restaurantIsVisited[indexPath.row] = false
            }))
            self.presentViewController(alertMessage, animated: false, completion: nil)
        })
    
    if(self.restaurantIsVisited[indexPath.row] == false){
        optionMenu.addAction(isVisitedAction)
    }
    
    else {
        optionMenu.addAction(noLongerFavoriteAction)
        }
        
    self.presentViewController(optionMenu, animated: true, completion: nil)
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
    
    }
    
    
    override func  prefersStatusBarHidden() -> Bool{
            return true;
    }
    

}
