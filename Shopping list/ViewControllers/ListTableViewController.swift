//
//  ListTableViewController.swift
//  Shopping list
//
//  Created by Elina Mansurova on 2021-01-07.
//

import UIKit

class ListTableViewController: UIViewController {
    
    var items: [ItemModel] = [.cola, .fries, .sushi]
    
    var itemsInBasket: [ItemModel] = []
    var itemsCountMap = [ItemModel: Int]()
    
    @IBOutlet weak var tableView: UITableView!
    
    private var fabButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.nib(), forCellReuseIdentifier: "ItemTableViewCell")
        configureFloatingActionButton()
        if itemsInBasket.count == 0 {
            fabButton.setTitle("No items", for: .normal)
        }
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
        fabButton.tintColor = .white
        view.addSubview(fabButton)
    }
    
    @objc
    func showBasketViewController() {
        performSegue(withIdentifier: "showBasketViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let basketController = segue.destination as? BasketTableViewController {
            basketController.checkoutItems = itemsCountMap.map { ($0, $1) }
        }
    }
}

extension ListTableViewController: ItemTableViewCellDelegate {
    
    func didTapAddToBag(_ cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        let item = items[indexPath.row]
        itemsInBasket.append(item)
        if itemsCountMap[item] != nil {
            itemsCountMap[item]! += 1
        } else {
            itemsCountMap[item] = 1
        }
        
        if itemsInBasket.count == 1 {
            fabButton.setTitle("\(itemsInBasket.count) item", for: .normal)
            fabButton.setImage(UIImage(systemName: "cart"), for: .normal)
            fabButton.imageEdgeInsets.left = -10
        }
        if itemsInBasket.count > 1 {
            fabButton.setTitle("\(itemsInBasket.count) items", for: .normal)
            fabButton.setImage(UIImage(systemName: "cart"), for: .normal)
            fabButton.imageEdgeInsets.left = -10
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
        cell.name.text = item.name
        cell.price.text = String(item.price)
        cell.iconImage.image = item.image
        cell.delegate = self
        return cell
    }
}
