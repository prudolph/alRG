//
//  Food.swift
//  ALRGData
//
//  Created by Paul Rudolph on 1/14/15.
//  Copyright (c) 2015 Paul Rudolph. All rights reserved.
//

import Foundation
import CoreData

class Food: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var person: NSManagedObject

}
