//
//  CodeTableVC.swift
//  3DTDemo
//
//  Created by Marius Constantinescu on 16/11/15.
//  Copyright © 2015 Marius Constantinescu. All rights reserved.
//

import UIKit

class CodeTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate {
    
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
        
        if #available(iOS 9.0, *) {
            if self.traitCollection.respondsToSelector("forceTouchCapability") && self.traitCollection.forceTouchCapability == .Available {
                self.registerForPreviewingWithDelegate(self, sourceView: self.tableView)
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("codeCell", forIndexPath: indexPath)
        cell.textLabel?.text = colors[indexPath.row].0
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("codeDetails", sender: indexPath)
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "codeDetails" {
            let destVC = segue.destinationViewController as! CodeDetailVC
            if let ip = sender as? NSIndexPath {
                destVC.receivedColor = self.colors[ip.row].1
                self.tableView.deselectRowAtIndexPath(ip, animated: true)
            }
        }
    }
    
    // MARK: - UIViewControllerPreviewingDelegate
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if #available(iOS 9.0, *) {
            if let indexPath = self.tableView.indexPathForRowAtPoint(location) {
                if let cell = self.tableView.cellForRowAtIndexPath(indexPath) {
                    // IMPORTANT
                    previewingContext.sourceRect = cell.frame
                }
                let colorTuple = colors[indexPath.row]
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("codeDetailVC") as! CodeDetailVC
                
                vc.receivedColor = colorTuple.1
                
                // IMPORTANT
                return vc
                
            } else {
                // Fallback on earlier versions
                return nil
            }
        }
        return nil
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        self.navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}