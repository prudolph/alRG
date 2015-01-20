//
//  NewPersonViewController.swift
//  ALRGData
//
//  Created by Paul Rudolph on 1/14/15.
//  Copyright (c) 2015 Paul Rudolph. All rights reserved.
//

import UIKit
import CoreData
import QuartzCore

class NewPersonViewController: UIViewController,UITextFieldDelegate {
   
    
    var managedContex:NSManagedObjectContext?
    var colorButtonsArray = [UIButton]()
    var selectedColor:String = ""
    
    @IBOutlet weak var firstNamefield: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var colorButtonsView: UIView!

    
    @IBAction func closePressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }

    override func viewWillAppear(animated: Bool) {
        addColorButtons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addColorButtons(){
        var autoLayoutDict = Dictionary <String,UIView>()
        autoLayoutDict["lastView"] = colorButtonsView
        colorButtonsView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[lastView(100)]", options: nil, metrics: nil, views: autoLayoutDict))
        
        var row = 0
        var col = 0
        
          for  var i = 0;i < 7; ++i {
        
            var butt = UIButton()
            butt.addTarget(self, action: "colorButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
            butt.layer.cornerRadius   = 25
            butt.backgroundColor = colorDict.values.array[i] as UIColor
            
            colorButtonsView.addSubview(butt)
            butt.setTranslatesAutoresizingMaskIntoConstraints(false)
            autoLayoutDict["currentButt"] = butt
            
            if(i < 4){
                self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                    "V:|-5-[currentButt(50)]", options: nil, metrics: nil, views: autoLayoutDict))
            }else{
                
                
                self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                    "V:|-55-[currentButt(50)]", options: nil, metrics: nil, views: autoLayoutDict))
            }
            
            if(i == 0){
                self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                    "H:|-[currentButt(50)]", options: nil, metrics: nil, views: autoLayoutDict))
            }else{
                
                self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                    "H:[lastView]-[currentButt(50)]", options: nil, metrics: nil, views: autoLayoutDict))
                
            }
              autoLayoutDict["lastView"] = butt
           
        }
        
    }
    
    func colorButtonPressed(sender: AnyObject){
        println("ColorButton Pressed\(sender)")
    
    }
    
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
    
    
    
     func textFieldShouldReturn(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
        return true
    }


}
