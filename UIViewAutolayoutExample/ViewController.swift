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
        
        
        headerView.autoresizingMask = .flexibleWidth
        headerView.translatesAutoresizingMaskIntoConstraints = true
        details.tableHeaderView = headerView
        // Do any additional setup after loading the view.
        
        labelRight.text = "This is a long text that won't fit in 1 line"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierCell") as! CellDetailsVC
        cell.labelLeftCell.text = String(indexPath.row)
        return cell
    }
}

