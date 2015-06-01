//
//  ExactChangeOnlyTesy.swift
//  VendingMachine
//
//  Created by Frank McAuley on 6/1/15.
//  Copyright (c) 2015 fmcauley. All rights reserved.
//

import Cocoa
import XCTest

class ExactChangeOnlyTesy: XCTestCase {

    var vendingMachine:VendingMachine?
    
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine()
        
    }
    
    override func tearDown() {
        vendingMachine = nil
        super.tearDown()
    }
    
    func testThatTheVendingMachineWillInformTheCustomerThatExactChangeIsRequired(){
        var vendingButton = Buttons.Chips
        var machineHasFunds:Bool = vendingMachine!.hasProperFundsToMakeChange(vendingButton)
        XCTAssertFalse(machineHasFunds, "There are not enough founds to complete this transaction")
    }
}
