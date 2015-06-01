//
//  SoldOutTest.swift
//  VendingMachine
//
//  Created by Frank McAuley on 6/1/15.
//  Copyright (c) 2015 fmcauley. All rights reserved.
//

import Cocoa
import XCTest

class SoldOutTest: XCTestCase {
    var vendingMachine:VendingMachine?
    
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine()
        
    }
    
    override func tearDown() {
        vendingMachine = nil
        super.tearDown()
    }

    func testThatTheVendingMachineCanTestACustomerThatAnItemIsSoldOut(){
        var vendingButton = Buttons.Candy
        var selectedItem = vendingMachine!.isSoldOutOfAProductForButton(vendingButton)
        XCTAssertTrue(selectedItem, "The items selected should be sold out")
    }
    
    func testThatTheVendingMachineCanDislayTheMoneyAlreadyInsertedIntoTheMachineForSoldOutItem(){
        var quarter = Currency.Coin("24.26mm", "5.67g")
        var twentyfiveCents:Float = vendingMachine!.acceptACoin(quarter)
        
         var vendingButton = Buttons.Cola
        var selectedItem = vendingMachine!.isSoldOutOfAProductForButton(vendingButton)
        
        XCTAssertFalse(selectedItem, "There should be more thatn 0 cents in VendingMachine")
    }

}
