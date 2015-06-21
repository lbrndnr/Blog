//
//  DetailViewController.swift
//  Test
//
//  Created by Laurin Brandner on 15/06/15.
//  Copyright © 2015 Laurin Brandner. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func loadView() {
        let label = UILabel()
        label.accessibilityIdentifier = "DetailViewControllerDetail"
        label.backgroundColor = .whiteColor()
        label.text = "Detail"
        label.font = UIFont.systemFontOfSize(34)
        label.textAlignment = .Center
        
        view = label
    }
    
}
