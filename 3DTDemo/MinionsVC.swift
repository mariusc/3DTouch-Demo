//
//  MinionsVC.swift
//  3DTDemo
//
//  Created by Marius Constantinescu on 16/11/15.
//  Copyright © 2015 Marius Constantinescu. All rights reserved.
//

import UIKit



enum MinionIndex: Int {
    case DAVE, BOB, JERRY, JORGE, KEVIN, MARK, PHIL, STUART, TIM
    
    static let minionNames = [
        DAVE : "Dave", BOB : "Bob", JERRY : "Jerry",
        JORGE : "Jorge", KEVIN : "Kevin", MARK : "Mark",
        PHIL : "Phil", STUART : "Stuart"]
    
    func minionName() -> String {
        if let minionName = MinionIndex.minionNames[self] {
            return minionName
        } else {
            return "Minion"
        }
    }
    
    func minionImage() -> UIImage? {
        return UIImage(named: "Minion\(minionName())")
    }
}



class MinionsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    let numberOfMinions = 8

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    // MARK: - UITableViewDelegate, UITableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberOfMinions
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("minionCell", forIndexPath: indexPath) as UITableViewCell
        
        if let minionIndex = MinionIndex(rawValue: indexPath.row) {
            cell.selectionStyle = .None
            cell.textLabel?.text = minionIndex.minionName()
            cell.imageView?.image = minionIndex.minionImage()
        }
        
        return cell
    }
    

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "minionDetails" {
            let destVC = segue.destinationViewController as! MinionDetailsVC
            if let cell = sender as? UITableViewCell, ip = self.tableView.indexPathForCell(cell) {
                destVC.receivedMinionIndex = MinionIndex(rawValue: ip.row)
            }
        }
    }

}
