//
//  ViewController.swift
//  TableViewAddAndDeleteRows
//
//  Created by Michael Miles on 3/8/22.
//

import UIKit

class ViewController: UITableViewController {
    
    private let CELL_ID = "CELL_ID"
    
    private var fastFoods = [
        "McDonalds",
        "Wendys",
        "Burger King"
    ]
    
    private var newFastFoods = [
        "Chick-fil-A",
        "Chipotle"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CELL_ID)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(resetFastFoods))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewFoods))
    }
}

// Data manipulation
extension ViewController {
    @objc private func addNewFoods() {
        fastFoods.append(contentsOf: newFastFoods)
        tableView.reloadData()
    }
    
    @objc private func resetFastFoods() {
        for r in newFastFoods {
            fastFoods.removeAll { $0 == r }
        }
        tableView.reloadData()
    }
}

// TableView methods
extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fastFoods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        cell.textLabel?.text = fastFoods[indexPath.row]
        return cell
    }
}

