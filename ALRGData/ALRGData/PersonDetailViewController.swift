//
//  PersonDetailViewController.swift
//  ALRGData
//
//  Created by Paul Rudolph on 1/29/15.
//  Copyright (c) 2015 Paul Rudolph. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    var personObject:Person?
    
    @IBOutlet weak var personImageView: UIView!
    
    @IBOutlet weak var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        personImageView.layer.cornerRadius = 25
        // Do any additional setup after loading the view.
       /*
        
        var categoryViewController = FoodCategoryViewController(category: FoodCategory.Loves, name: "Heyyy")
            self.addChildViewController(categoryViewController)
            categoryViewController.didMoveToParentViewController(self)
            self.view.addSubview(categoryViewController.view)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
     func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return        self.view.frame.height / 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
          var cell:FoodCategoryTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("FoodCategoryTableViewCell") as FoodCategoryTableViewCell
        
        cell.nameLabel.text = personObject?.firstName
        
        println("indexPath.row \(indexPath.row)")
        switch (indexPath.row){
        case 0:  cell.setCategory(FoodCategory.Loves);
        case 1:  cell.setCategory(FoodCategory.Likes);
        case 2:  cell.setCategory(FoodCategory.Cants);
        default: println("What is this category")

        }
        
      
        return cell
    
    }

    @IBAction func backButtonPressed(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }

}
