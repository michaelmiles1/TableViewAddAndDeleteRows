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
        // Do any additional setup after loading the view.
        tableView.register(UITableView.self, forCellReuseIdentifier: CELL_ID)
    }
}

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

