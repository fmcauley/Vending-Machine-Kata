//
//  VendingItems.swift
//  VendingMachine
//
//  Created by Frank McAuley on 5/29/15.
//  Copyright (c) 2015 fmcauley. All rights reserved.
//

import Foundation

class VendingItems {

    var itemName:String?
    var itemCost:Float?

    init(name: String, cost:Float) {
        itemName = name
        itemCost = cost
    }
}


