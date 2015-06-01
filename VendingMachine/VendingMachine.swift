//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Frank McAuley on 5/28/15.
//  Copyright (c) 2015 fmcauley. All rights reserved.
//

import Cocoa

class VendingMachine: NSObject {
    
    var coinValue:Float = 0.0
    var itemSelected = VendingItems(name: "No Selection", cost: 0.00)
    
    
    func acceptACoin(coin: Currency) ->Float {
        if isAValidCoin(coin){
            return coinValue
        } else {
            return 0.0
        }
    }
    
    func isAValidCoin(coin: Currency) ->Bool {
        
        var validCoin:Bool = false
        
        switch coin {
        case .Coin("19.05mm", "2.5g"):
            validCoin = false
        case .Coin("21.21mm", "5g"):
            coinValue += 0.05
            validCoin = true
        case .Coin("17.91mm", "2.268g"):
            coinValue += 0.10
            validCoin = true
        case .Coin("24.26mm", "5.67g"):
            coinValue += 0.25
            validCoin = true
        default:
            validCoin = false
        }
        return validCoin
    }
    
    func returnTheCoins(){
        coinValue = 0.0
    }
    
    func removeSelecteItem(){
        itemSelected =  VendingItems(name: "No Selection", cost: 0.00)
    }
    
    func selectAProductForButton(button: Buttons) -> VendingItems{
        switch button {
        case .Chips:
            if (coinValue < 0.50){
                printMessageToInsertCoins(0.50)
            } else {
                itemSelected = VendingItems(name: "chips", cost: 0.50)
                completeTransactoinAndResetCoins(itemSelected.itemCost!)
            }
        case .Cola:
            if (coinValue < 1.00){
                printMessageToInsertCoins(1.00)
            } else {
                itemSelected = VendingItems(name: "cola", cost: 1.00)
                completeTransactoinAndResetCoins(itemSelected.itemCost!)
            }
        case .Candy:
            if (coinValue < 0.65){
                printMessageToInsertCoins(0.65)
            } else{
                itemSelected = VendingItems(name: "candy", cost: 0.65)
                completeTransactoinAndResetCoins(itemSelected.itemCost!)
            }
        default:
            itemSelected = VendingItems(name: "No Selection", cost: 0.00)
        }
        
        return itemSelected
    }
    
    func isSoldOutOfAProductForButton(button: Buttons) ->Bool{
        println("SOLD OUT")
        var coinStatus = false
        if (coinValue > 0.0){
            println("YOUR CHANGE: \(coinValue)")
        } else {
            println("INSERT COINS")
            coinStatus = true
        }
        return coinStatus
    }
    
    func hasProperFundsToMakeChange(button: Buttons) ->Bool{
        println("EXACT CHANGE ONLY")
        var hasFunds = false
        return hasFunds
    }
    
    
    func printMessageToInsertCoins(coins:Float){
        println("INSERT COINS \(coins - coinValue)")
    }
    
    func completeTransactoinAndResetCoins(cost: Float){
        if (coinValue > cost){
            println("YOUR CHANGE: \(coinValue - cost)")
            returnTheCoins()
        } else {
            println("THANK YOU")
            returnTheCoins()
        }
    }
    
}
