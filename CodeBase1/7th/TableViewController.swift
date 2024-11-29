//
//  TableViewController.swift
//  CodeBase1
//
//  Created by 김나훈 on 11/26/24.
//

import UIKit

final class TableViewController: UITableViewController {
    
    var sectionData: [[String]] = [
        ["item 0 in section 0"],
        ["item 0 in section 1"],
        ["item 0 in section 2"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        
    }
    
}

// MARK: - TableView DataSource

extension TableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        sectionData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionData[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sectionData[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let viewController = DetailViewController()
        viewController.indexPathLabel.text = "\(indexPath.section) \(indexPath.item)"
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        
        headerView.addButtonAction = { section in
            self.sectionData[section].append("asdsadasd")
            self.tableView.reloadData()
        }
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

