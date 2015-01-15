//
//  NewPersonViewController.swift
//  ALRGData
//
//  Created by Paul Rudolph on 1/14/15.
//  Copyright (c) 2015 Paul Rudolph. All rights reserved.
//

import UIKit
import CoreData


class NewPersonViewController: UIViewController,UITextFieldDelegate {
     var managedContex:NSManagedObjectContext?
    
    @IBOutlet weak var firstNamefield: UITextField!
    @IBOutlet weak var lastNameField: UITextField!

    var color:String = ""
    
    @IBAction func savePressed(sender: AnyObject) {
    
        
       var newperson =  Person(firstName: firstNamefield.text, lastName: lastNameField.text, color: "RED", context:managedContex!)
        
        
        var error: NSError?
        managedContex!.save(&error)
        if(error != nil){
            println("Could not save \(error), \(error?.userInfo)")
        }else{
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        
        
    }
    
    func addColorButtons(){
        
        for var i=0; i < colorDict.count;i++ {
            
            var button = UIButton(frame:CGRectMake(10.0 * CGFloat(i), 0, 50, 50))
            button.backgroundColor = colorDict.values.array[i]
            self.view.addSubview(button)
    
        }
    }
    
    
    @IBAction func closePressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     addColorButtons()
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
    
     func textFieldShouldReturn(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
        return true
    }


}
