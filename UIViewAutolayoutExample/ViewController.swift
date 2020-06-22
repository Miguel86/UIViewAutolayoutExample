//
//  ViewController.swift
//  UIViewAutolayoutExample
//
//  Created by Miguel Dos Santos Carregal on 18/06/2020.
//  Copyright © 2020 Miguel Dos Santos Carregal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var labelLeft: UILabel!
    @IBOutlet var labelRight: UILabel!
    @IBOutlet var details: UITableView!
    @IBOutlet var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        details.delegate = self
        details.dataSource = self
        
        
        labelRight.text = "This is a long text that won't fit in 1 line"
        
        // 1. Setup AutoLayout
        self.setTableHeaderView(headerView: self.details.tableHeaderView!)
        
        // 2. First layout update
        self.updateHeaderViewFrame()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierCell") as! CellDetailsVC
        return cell
    }
    
    // Set table header view & add Auto layout.
    func setTableHeaderView(headerView: UIView) {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set first.
        self.details.tableHeaderView = headerView
        
        // Then setup AutoLayout.
        headerView.centerXAnchor.constraint(equalTo: self.details.centerXAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: self.details.widthAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.details.topAnchor).isActive = true
    }
    
    /// Update header view's frame.
    func updateHeaderViewFrame() {
        guard let headerView = self.details.tableHeaderView else { return }
        
        // Update the size of the header based on its internal content.
        headerView.layoutIfNeeded()
        
        // ***Trigger table view to know that header should be updated.
        let header = self.details.tableHeaderView
        self.details.tableHeaderView = header
    }
}

