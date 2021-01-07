//
//  ListTableViewController.swift
//  Shopping list
//
//  Created by Elina Mansurova on 2021-01-07.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    private var items: [String] = (1...10).map { "Test\($0)" }
    private var item: String = "Test"
    private var itemsInBasket: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ItemTableViewCell.nib(), forCellReuseIdentifier: "ItemTableViewCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell else {
            fatalError()
        }
        let item = items[indexPath.row]
        cell.name.text = item
        // cell.price.text = item.price
        // cell.icon.image = item.image
        cell.delegate = self
        return cell
    }
    

}

extension ListTableViewController: ItemTableViewCellDelegate {
    func didTapAddToBag(_ cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        let item = items[indexPath.row]
        itemsInBasket.append(item)
        title = "\(itemsInBasket.count) items"
    }
}
