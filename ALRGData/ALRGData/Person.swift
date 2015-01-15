//
//  Person.swift
//  ALRGData
//
//  Created by Paul Rudolph on 1/14/15.
//  Copyright (c) 2015 Paul Rudolph. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject {

    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var color: String
    @NSManaged var likes: NSOrderedSet
    @NSManaged var loves: NSOrderedSet
    @NSManaged var cants: NSOrderedSet

    
    convenience init(firstName:String , lastName:String,color:String, context : NSManagedObjectContext){
        
        let entity =  NSEntityDescription.entityForName("Person", inManagedObjectContext:context)
        
        self.init(entity: entity!, insertIntoManagedObjectContext: context);
        
        self.firstName = firstName
        self.lastName = lastName
        self.color = color
        
    
    }
}
