//
//  CategoryDetailViewController.swift
//  ALRGData
//
//  Created by Paul Rudolph on 2/3/15.
//  Copyright (c) 2015 Paul Rudolph. All rights reserved.
//

import UIKit

class CategoryDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    
    @IBAction func backButtonPressed(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
