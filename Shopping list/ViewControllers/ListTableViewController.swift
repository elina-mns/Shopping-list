//
//  ListTableViewController.swift
//  Shopping list
//
//  Created by Elina Mansurova on 2021-01-07.
//

import UIKit

class ListTableViewController: UIViewController {
    
    private var items: [String] = (1...10).map { "Test\($0)" }
    private var item: String = "Test"
    private var itemsInBasket: [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    private var fabButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.nib(), forCellReuseIdentifier: "ItemTableViewCell")
        configureFloatingActionButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    func configureFloatingActionButton() {
        fabButton.frame = CGRect(x: 280, y: 700, width: 100, height: 100)
        fabButton.backgroundColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
        fabButton.clipsToBounds = true
        fabButton.layer.cornerRadius = 50
        fabButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        fabButton.layer.borderWidth = 3.0
        fabButton.addTarget(self, action: #selector(showBasketViewController), for: .touchUpInside)
        view.addSubview(fabButton)
    }
    
    @objc
    func showBasketViewController() {
        performSegue(withIdentifier: "showBasketViewController", sender: self)
    }
}

extension ListTableViewController: ItemTableViewCellDelegate {
    
    func didTapAddToBag(_ cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        let item = items[indexPath.row]
        itemsInBasket.append(item)
        
        if item.count > 0 {
            fabButton.setTitle("\(itemsInBasket.count) items", for: .normal)
        } else {
            fabButton.setTitle("No items", for: .normal)
        }
    }
}

extension ListTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
