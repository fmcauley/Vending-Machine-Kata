//
//  MainWindowController.swift
//  VendingMachine
//
//  Created by Frank McAuley on 5/28/15.
//  Copyright (c) 2015 fmcauley. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    var vendingMachine:VendingMachine?
    
    
    
    
    override var windowNibName: String {
        return "MainWindowController"
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        
    }
    
}
