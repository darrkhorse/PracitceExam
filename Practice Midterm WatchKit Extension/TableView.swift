//
//  TableView.swift
//  Practice Midterm
//
//  Created by Hinck, Johann A on 10/27/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import WatchKit
import Foundation


class TableView: WKInterfaceController
{

    @IBOutlet var theTable: WKInterfaceTable!
    
    
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        
        
        
        // Configure interface objects here.
    }

    override func willActivate()
    {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("\(NumberOfMonths.monthlyPymt)")
        let labelNames = ["Month:","Day:","Hour:","Minute:","Second:"]
        let labelValues = [1,30,720,43200,2592000]
        
        self.theTable.setNumberOfRows(labelNames.count, withRowType: "cell")
        for(var i = 0; i < labelNames.count; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! timeRow
            
            currRow.theLabel.setText(labelNames[i])
            var theValue : Double
            if(NumberOfMonths.monthlyPymt % labelValues[i] == 0)
            {
                currRow.theOtherLabel.setText("$\(NumberOfMonths.monthlyPymt / labelValues[i])")
            }
            else if(labelValues[i] == 2592000)
            {
                theValue = (Double(NumberOfMonths.monthlyPymt) / Double(labelValues[i]))
                theValue = Double(round(1000*theValue)/1000)
                currRow.theOtherLabel.setText("$\(theValue)")
            }
            else
            {
                theValue = (Double(NumberOfMonths.monthlyPymt) / Double(labelValues[i]))
                theValue = Double(round(100*theValue)/100)
                currRow.theOtherLabel.setText("$\(theValue)")
            }
            
            
            
            
        }
    }

    override func didDeactivate()
    {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
