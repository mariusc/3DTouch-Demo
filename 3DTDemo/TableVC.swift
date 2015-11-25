//
//  ViewController.swift
//  3DTDemo
//
//  Created by Marius Constantinescu on 15/11/15.
//  Copyright © 2015 Marius Constantinescu. All rights reserved.
//

import UIKit

class TableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    // MARK: - Properties
    let colors : [(String, UIColor)] = [("red", UIColor.redColor()), ("yellow", UIColor.yellowColor()), ("cyan",UIColor.cyanColor()), ("orange", UIColor.orangeColor())]
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   // MARK: - UITableViewDelegate, UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = colors[indexPath.row].0
        return cell
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "details" {
            let destVC = segue.destinationViewController as! DetailVC
            if let cell = sender as? UITableViewCell, ip = tableView.indexPathForCell(cell) {
                destVC.receivedColor = self.colors[ip.row].1
                self.tableView.deselectRowAtIndexPath(ip, animated: true)
            }
        }
    }

}

