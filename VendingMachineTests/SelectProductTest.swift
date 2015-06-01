//
//  SelectProductTest.swift
//  VendingMachine
//
//  Created by Frank McAuley on 5/29/15.
//  Copyright (c) 2015 fmcauley. All rights reserved.
//

import Cocoa
import XCTest
/**
cola for $1.00, chips for $0.50, and candy for $0.65.
*/

class SelectProductTest: XCTestCase {
    var vendingMachine:VendingMachine?
    
    
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine()
        
    }
    
    override func tearDown() {
        vendingMachine = nil
        super.tearDown()
    }
    
    func testThatVendingMachineCanDispenseChips(){
        var quarter = Currency.Coin("24.26mm", "5.67g")
        var vendingItems = VendingItems(name: "chips", cost: 0.50)
        
        var twentyfiveCents:Float = vendingMachine!.acceptACoin(quarter)
        var fiftyCents:Float = vendingMachine!.acceptACoin(quarter)
        
        XCTAssertEqual(vendingItems.itemCost!, fiftyCents, "The cost of chips are 0.50 cents you entered \(fiftyCents)")
        
    }
    
    func testThatVendingMachineCanSelectAProduct(){
        
        //enter the money
        var quarter = Currency.Coin("24.26mm", "5.67g")
        var twentyfiveCents:Float = vendingMachine!.acceptACoin(quarter)
        var fiftyCents:Float = vendingMachine!.acceptACoin(quarter)
        
        var vendingButton = Buttons.Chips
        var selectedItem = vendingMachine!.selectAProductForButton(vendingButton)
        
        var chips = VendingItems(name: "chips", cost: 0.50)
        
        XCTAssertEqual(selectedItem.itemName!, chips.itemName!, "Chips were not selected from the vending machine")
    }
    
    func testThatVendingMachineCanPromptCustomerForMoreCoins(){
        var dime = Currency.Coin("17.91mm", "2.268g")
        var tenCents = vendingMachine!.acceptACoin(dime)
        
        var vendingButton = Buttons.Cola
        var selectedItem = vendingMachine!.selectAProductForButton(vendingButton)
        
        var cola = VendingItems(name: "cola", cost: 1.00)
        
        XCTAssertNotEqual(selectedItem.itemCost!, cola.itemCost!, "Cola cost a dollar")
        
    }

}
