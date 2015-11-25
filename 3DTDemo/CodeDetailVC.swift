//
//  CodeDetailVC.swift
//  3DTDemo
//
//  Created by Marius Constantinescu on 16/11/15.
//  Copyright © 2015 Marius Constantinescu. All rights reserved.
//

import UIKit

class CodeDetailVC: UIViewController {

    // MARK: - Outlets
    
    // MARK: - Properties
    var receivedColor : UIColor?
    var squareView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let color = receivedColor {
            self.view.backgroundColor = color
        }
    }

}
