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

class FoodCategoryTableViewCell: UITableViewCell{

    @IBOutlet weak var seperatorLine: UIView!
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    
    var category:FoodCategory?
    var name:String?
    
    func setCategory(category:FoodCategory){
        
        var color:UIColor? = UIColor.greenColor()
        var categoryTitle:String?
        var imageName:String?
        
        
        switch(category){
        case FoodCategory.Loves: color = UIColor.greenColor();  categoryTitle = "loves";imageName = "heartIcon.png"
        case FoodCategory.Likes:color  = UIColor.yellowColor(); categoryTitle = "likes";imageName = "thumbIcon.png"
        case FoodCategory.Cants: color = UIColor.redColor();    categoryTitle = "can't have";imageName = "cantIcon.png"
        default: println("What is this category")
        }
        
        categoryTitleLabel.text = categoryTitle
        categoryIcon.image = UIImage(named: imageName!)
        if color != nil{
            setColors( color! )
        }

        
    
    
    }
    
    
    func setColors(color:UIColor){
        
        seperatorLine.backgroundColor = color
        categoryTitleLabel.textColor  = color
        detailButton.backgroundColor  = color
        
    }

    
}
