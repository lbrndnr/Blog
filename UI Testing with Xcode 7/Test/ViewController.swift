//
//  ViewController.swift
//  Test
//
//  Created by Laurin Brandner on 15/06/15.
//  Copyright © 2015 Laurin Brandner. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private let cells = ["Detail View Controller", "Popover", "Action Sheet"]
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UI Testing"
        
        let cellClass = UITableViewCell.self
        tableView.registerClass(cellClass, forCellReuseIdentifier: NSStringFromClass(cellClass))
        tableView.accessibilityIdentifier = "ViewControllerTableView"
    }

    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(UITableViewCell.self), forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = cells[indexPath.row]
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            navigationController?.pushViewController(DetailViewController(), animated: true)
        }
        else {
            let style: UIAlertControllerStyle = indexPath.row == 1 ? .Alert : .ActionSheet
            let alertController = UIAlertController(title: cells[indexPath.row], message: "Just for testing", preferredStyle: style)
            alertController.addAction(UIAlertAction(title: "OK", style: .Cancel) { _ in
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
            })
            alertController.view.accessibilityIdentifier = "ViewControllerAlert"
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
}

