//
//  FoodCategoryViewController.swift
//  ALRGData
//
//  Created by Paul Rudolph on 1/28/15.
//  Copyright (c) 2015 Paul Rudolph. All rights reserved.
//

import UIKit


enum FoodCategory{
    case Loves,Likes,Cants
}

class FoodCategoryViewController: UIViewController {

    @IBOutlet weak var seperatorLine: UIView!
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    
    var category:FoodCategory?
    var name:String?
    
    convenience    init(category:FoodCategory, name:String){
        self.init()
        
        self.category = category
        self.name = name
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Set the name label
        nameLabel.text = self.name
        
        //Set the icon
        
        
        var color:UIColor? = UIColor.greenColor()
        var categoryTitle:String?
        
        switch(category!){
            case FoodCategory.Loves: color = UIColor.greenColor();  categoryTitle = "loves";
            case FoodCategory.Likes:color  = UIColor.yellowColor(); categoryTitle = "likes";
            case FoodCategory.Cants: color = UIColor.redColor();    categoryTitle = "can't have";
            default: println("What is this category")
        }
        
        if color != nil{
            setColors( color! )
        }
        
        // Do any additional setup after loading the view.
    }

    func setColors(color:UIColor){
    
        seperatorLine.backgroundColor = color
        categoryTitleLabel.textColor  = color
        detailButton.backgroundColor  = color
        
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

}
