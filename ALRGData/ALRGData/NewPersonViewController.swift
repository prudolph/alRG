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
    var selectedColorButtonIndex:Int?
    
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
            "V:[lastView]", options: nil, metrics: nil, views: autoLayoutDict))
        
        var dotsPerRow = 4
        var dotSize = 70
        var dotSpacing = 15
          for  var i = 0;i < 7; ++i {
        
            var butt = UIButton()
            butt.addTarget(self, action: "colorButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
            butt.layer.cornerRadius = CGFloat(dotSize / 2)
            butt.backgroundColor = colorDict.values.array[i] as UIColor
            butt.tag = i
            
            colorButtonsView.addSubview(butt)
            colorButtonsArray.append(butt)
            butt.setTranslatesAutoresizingMaskIntoConstraints(false)
            autoLayoutDict["currentButt"] = butt
            
            if(i < dotsPerRow){
                self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                    "V:|-5-[currentButt(\(dotSize))]", options: nil, metrics: nil, views: autoLayoutDict))
            }else{
                
                self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                    "V:|-\(dotSize + dotSpacing)-[currentButt(\(dotSize))]-|", options: nil, metrics: nil, views: autoLayoutDict))
            }
            
            if(i == 0 || i == dotsPerRow){
                self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                    "H:|-[currentButt(\(dotSize))]", options: nil, metrics: nil, views: autoLayoutDict))
            }else{
                
                self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                    "H:[lastView]-\(dotSpacing)-[currentButt(\(dotSize))]", options: nil, metrics: nil, views: autoLayoutDict))
                
            }
              autoLayoutDict["lastView"] = butt
           
        }
        
    }
    
    func colorButtonPressed(sender: AnyObject){
        if let  button = sender as? UIButton{
            
            println("ColorButton Pressed\(button.tag)")
            highlightColorButton(button.tag)
             selectedColorButtonIndex = button.tag
        }
    }
    
    func highlightColorButton(index:Int){
        
        
        if(selectedColorButtonIndex != nil){
            var oldButton =      colorButtonsArray[selectedColorButtonIndex!]
            UIView.animateWithDuration(1.50, animations: {
                oldButton.layer.borderColor = UIColor.whiteColor().CGColor
                oldButton.layer.borderWidth = 0.0
                
            })
        }
        
        var selectedButton = colorButtonsArray[index]
    
     
      //TO ANIMATE THIS WE NEED CAANIMATION
       
        
            selectedButton.layer.borderColor = UIColor.whiteColor().CGColor
            selectedButton.layer.borderWidth = 5.0
        
       
        
    }
    
    
    
    @IBAction func savePressed(sender: AnyObject) {
        var colorString = colorDict.keys.array[selectedColorButtonIndex!]
     
        
        var newperson =  Person(firstName: firstNamefield.text, lastName: lastNameField.text, color: colorString, context:managedContex!)
        
        
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
