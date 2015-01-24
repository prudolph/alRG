//
//  ViewController.swift
//  ALRGData
//
//  Created by Paul Rudolph on 1/14/15.
//  Copyright (c) 2015 Paul Rudolph. All rights reserved.
//

import UIKit
import CoreData //we need this to talk about Managed Object stuff

class PeopleViewController: UITableViewController,UITableViewDataSource,UITableViewDelegate {
    var managedContex:NSManagedObjectContext?
    var peopleArray = [Person]() //this is where were gonna store all the people objects that we get from the database
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Get the application delgate so we can get to the DataStore Contex
       var applicationDelegate =  UIApplication.sharedApplication().delegate as AppDelegate

        //now that we have this thing we can retrive and store stuff in the DB
       managedContex = applicationDelegate.managedObjectContext
        
        
        
        
        var nib = UINib(nibName: "PersonTableViewCell", bundle: nil)
        
        tableView.registerNib(nib, forCellReuseIdentifier: "PersonTableCell")
        
    
    }
    
     override func viewDidAppear(animated: Bool) {
        retrievePeople()
        tableView.reloadData()
    }

    func retrievePeople(){
     
       let fetchRequest = NSFetchRequest(entityName:"Person")

        var error: NSError?
        let people = managedContex!.executeFetchRequest(fetchRequest,  error: &error) as [Person]?

        if people != nil {
            peopleArray = people!
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return peopleArray.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PersonTableCell") as? PersonTableViewCell
        
        var person:Person = peopleArray[indexPath.row] as Person
        var personStr = person.firstName + " " + person.lastName

        cell?.personNameLabel.text = person.firstName
        cell?.backgroundColor = colorDict[person.color]
        
        return cell!
    }

    
  
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 105.0
    }
    
override    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 105.0
    }
    
   override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

    
    return tableView.dequeueReusableCellWithIdentifier("HeaderCell") as? UIView

    }
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "NewPersonSegue"){
            var  destinationViewController:NewPersonViewController  = segue.destinationViewController as NewPersonViewController
            //Pass along the managed context to we dont have to traverse again
            destinationViewController.managedContex = managedContex
        
        }
    }

}

