//
//  ViewController.swift
//  TableViewAddAndDeleteRows
//
//  Created by Michael Miles on 3/8/22.
//

import UIKit

class ViewController: UITableViewController {
    
    private let CELL_ID = "CELL_ID"
    
    private var oldData: [String]?
    
    private var fastFoods = [
        "Burger King",
        "In-N-Out",
        "Wendys"
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
        oldData = fastFoods
        fastFoods.append(contentsOf: ["Chick-fil-A", "McDonalds"])
        fastFoods.sort()
        animateReloadData()
    }
    
    @objc private func resetFastFoods() {
        oldData = fastFoods
        for r in ["Chick-fil-A", "McDonalds"] {
            fastFoods.removeAll { $0 == r }
        }
        tableView.reloadData()
    }
    
    private func animateReloadData() {
        guard let old = oldData else { return }
        var newIndexPaths: [IndexPath] = []
        for fastFoodItem in fastFoods.enumerated() {
            if !old.contains(fastFoodItem.element) {
                newIndexPaths.append(IndexPath(row: fastFoodItem.offset, section: 0))
            }
        }
        tableView.insertRows(at: newIndexPaths, with: .fade)
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

