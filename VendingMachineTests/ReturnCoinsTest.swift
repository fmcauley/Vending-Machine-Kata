//
//  ReturnCoinsTest.swift
//  VendingMachine
//
//  Created by Frank McAuley on 6/1/15.
//  Copyright (c) 2015 fmcauley. All rights reserved.
//

import Cocoa
import XCTest

/**
cola for $1.00, chips for $0.50, and candy for $0.65.
*/


class ReturnCoinsTest: XCTestCase {
    var vendingMachine:VendingMachine?
    
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine()
        
    }
    
    override func tearDown() {
        vendingMachine = nil
        super.tearDown()
    }
    
    
    func testThatTheVendingMachineCanMakeChangeWhenTheCustomerPlaceMoreCoinsInThanAreNeeded(){
        var quarter = Currency.Coin("24.26mm", "5.67g")
        var twentyfiveCents:Float = vendingMachine!.acceptACoin(quarter)
        var fiftyCents:Float = vendingMachine!.acceptACoin(quarter)
        var seventyfiveCents:Float = vendingMachine!.acceptACoin(quarter)
        
        var vendingButton = Buttons.Candy
        var selectedItem = vendingMachine!.selectAProductForButton(vendingButton)

        var candy = VendingItems(name: "candy", cost: 0.65)
    
        XCTAssertGreaterThan(seventyfiveCents,candy.itemCost!, "The cost of candy is 0.65 cents you entered \(seventyfiveCents)")
        
    }
    
    func testThatTheVendingMachineCanAcceptTheExactChangeForAnItem(){
        var quarter = Currency.Coin("24.26mm", "5.67g")
        var twentyfiveCents:Float = vendingMachine!.acceptACoin(quarter)
        var fiftyCents:Float = vendingMachine!.acceptACoin(quarter)
        var seventyfiveCents:Float = vendingMachine!.acceptACoin(quarter)
        var dollar:Float = vendingMachine!.acceptACoin(quarter)
        
        var vendingButton = Buttons.Cola
        var selectedItem = vendingMachine!.selectAProductForButton(vendingButton)
        
        var cola = VendingItems(name: "cola", cost: 1.00)
        
        XCTAssertEqual(cola.itemCost!, dollar, "The cost of cola is 1.00 cents you entered \(dollar)")
    }
    
}
