//
//  MinionDetailsVC.swift
//  3DTDemo
//
//  Created by Marius Constantinescu on 16/11/15.
//  Copyright © 2015 Marius Constantinescu. All rights reserved.
//

import UIKit

class MinionDetailsVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    var receivedMinionIndex : MinionIndex?
    
    // Preview action items.
    @available(iOS 9.0, *)
    lazy var previewActions: [UIPreviewActionItem] = {
        
        
        let printAction = UIPreviewAction(title: "Print", style: .Default, handler: { (previewAction, viewController) -> Void in
            guard let detailViewController = viewController as? MinionDetailsVC,
                minionIndex = detailViewController.receivedMinionIndex else { return }
            
            let printInfo = UIPrintInfo(dictionary: nil)
            printInfo.jobName = minionIndex.minionName()
            
            let printController = UIPrintInteractionController.sharedPrintController()
            printController.printInfo = printInfo
            printController.showsNumberOfCopies = true
            printController.showsPageRange = true
            printController.showsPaperSelectionForLoadedPapers = true
            printController.printingItem = minionIndex.minionImage()
            printController.presentAnimated(true, completionHandler: nil)
        })
        
        return [printAction]
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = receivedMinionIndex?.minionImage() {
            self.imageView.image = image
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: Preview actions
    
    @available(iOS 9.0, *)
    override func previewActionItems() -> [UIPreviewActionItem] {
        return previewActions
    }

}
