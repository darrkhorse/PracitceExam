//
//  InterfaceController.swift
//  Practice Midterm WatchKit Extension
//
//  Created by Hinck, Johann A on 10/27/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController
{
    
    @IBOutlet var totalAmount: WKInterfaceLabel!

    @IBOutlet var thePicker: WKInterfacePicker!
    
   
    
    @IBAction func pickerDidChange(value: Int)
    {
        NumberOfMonths.numMonths = value + 1
        
        NumberOfMonths.monthlyPymt = (42000 / NumberOfMonths.numMonths)
        
        
        amountPerMonth.setText("$\(NumberOfMonths.monthlyPymt)")
    }
    @IBOutlet var amountPerMonth: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        var thePickerItems = [WKPickerItem]()
        
        for(var i = 1; i <= 48; i++)
        {
            thePickerItems.append(WKPickerItem())
            thePickerItems[i-1].title = "\(i)"
        }
        
        self.thePicker.setItems(thePickerItems)
        
        
        
        // Configure interface objects here.
    }

    override func willActivate()
    {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate()
    {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
