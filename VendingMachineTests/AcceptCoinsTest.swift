//
//  AcceptCoinsTest.swift
//  VendingMachine
//
//  Created by Frank McAuley on 5/28/15.
//  Copyright (c) 2015 fmcauley. All rights reserved.
//

import Cocoa
import XCTest

/**
Penny   19.05mm 2.5g CopperAlloy
Nickle  21.21mm 5g CopperAlloy
Dime    17.91 mm 2.268g CopperAlloy
Quarter 24.26mm 5.67g CopperAlloy
*/

class AcceptCoinsTest: XCTestCase {
    
    var vendingMachine:VendingMachine?

    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine()
        vendingMachine!.returnTheCoins()
    }
    
    override func tearDown() {
        vendingMachine = nil
        super.tearDown()
    }

    func testThatVendingMachineCanAcceptsValidCoins(){
        var dime = Currency.Coin("17.91mm", "2.268g")
        var isValidCoin: Bool = vendingMachine!.isAValidCoin(dime)
        XCTAssert(isValidCoin, "The Coin is not valid")
    }
    
    func testThatVendingMachineDoesNotAcceptAPenny(){
        var penny = Currency.Coin("19.05mm", "2.5g")
        var isValidCoin: Bool = vendingMachine!.isAValidCoin(penny)
        XCTAssertFalse(isValidCoin, "A Penny is not a valid coin")
    }
    
    func testThatVendingMachineCanAcceptMultipleCoins(){
        var dime = Currency.Coin("17.91mm", "2.268g")
        var nickle = Currency.Coin("21.21mm", "5g")
        var quarter = Currency.Coin("24.26mm", "5.67g")
        
        var tenCents:Float = vendingMachine!.acceptACoin(dime)
        var fifteenCents:Float = vendingMachine!.acceptACoin(nickle)
        var fortyCents:Float = vendingMachine!.acceptACoin(quarter)
        
        XCTAssertEqual(0.40, fortyCents, "The coins must match")
        
    }
    
    func testThatTheVendingMachineCanRetunMoney(){
        
        var dime = Currency.Coin("17.91mm", "2.268g")
        var nickle = Currency.Coin("21.21mm", "5g")
        var quarter = Currency.Coin("24.26mm", "5.67g")
        
        var tenCents:Float = vendingMachine!.acceptACoin(dime)
        var fifteenCents:Float = vendingMachine!.acceptACoin(nickle)
        var fortyCents:Float = vendingMachine!.acceptACoin(quarter)
        
        vendingMachine!.returnTheCoins()
        
        
        XCTAssertEqual(0.0, vendingMachine!.coinValue, "There are no coins in the vending machine.")

        
    }

}
