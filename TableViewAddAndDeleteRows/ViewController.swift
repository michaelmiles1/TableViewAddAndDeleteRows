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
        animateReloadData()
    }
    
    private func animateReloadData() {
        guard let old = oldData else { return }
        if old.count < fastFoods.count {
            let indexPaths = indexPathsForNewItems(bigArray: fastFoods, smallArray: old)
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        else if old.count > fastFoods.count {
            let removedIndexPaths = alternateIndexPathsForNewItems(bigArray: old, smallArray: fastFoods)
            tableView.deleteRows(at: removedIndexPaths, with: .fade)
        }
    }
    
    private func indexPathsForNewItems(bigArray: [String], smallArray: [String]) -> [IndexPath] {
        var newIndexPaths: [IndexPath] = []
        for str in bigArray.enumerated() {
            if !smallArray.contains(str.element) {
                newIndexPaths.append(IndexPath(row: str.offset, section: 0))
            }
        }
        return newIndexPaths
    }
    
    private func alternateIndexPathsForNewItems(bigArray: [String], smallArray: [String]) -> [IndexPath] {
        var newIndexPaths: [IndexPath] = []
        for str in bigArray {
            if !smallArray.contains(str) {
                if let i = bigArray.firstIndex(of: str) {
                    newIndexPaths.append(IndexPath(row: i, section: 0))
                }
            }
        }
        return newIndexPaths
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

