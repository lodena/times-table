//
//  ViewController.swift
//  Times Tables
//
//  Created by Jesus Lopez de Nava on 7/5/15.
//  Copyright (c) 2015 LodenaApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var cellContent = [Int](count: 20, repeatedValue: 0)
    
    var tempNumber = 1

    @IBOutlet var myTableView: UITableView!
    
    @IBOutlet var sliderValue: UISlider!
    
    @IBOutlet var number: UILabel!
    
    @IBAction func sliderMoved(sender: AnyObject) {
        
        let roundedValue = Int(round(sliderValue.value))
        
        number.text = String(roundedValue)
        
        if tempNumber != roundedValue {
            
                myTableView.reloadData()
            
        }
        
        tempNumber = roundedValue
    
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellContent.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cellContent[indexPath.row] = Int(round(sliderValue.value)) * (indexPath.row + 1)
            
        let firstPart = number.text! + " x " + String(indexPath.row + 1)
        
        let secondPart = " = " + String(cellContent[indexPath.row])
        
        cell.textLabel?.text = firstPart + secondPart
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

