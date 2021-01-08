//
//  BasketTableViewController.swift
//  Shopping list
//
//  Created by Elina Mansurova on 2021-01-07.
//

import UIKit

class BasketTableViewController: UIViewController, ItemTableViewCellDelegate {
    
    func didTapAddToBag(_ cell: UITableViewCell) {
    }

    @IBOutlet weak var tableView: UITableView!
    private var fabButton = UIButton(type: .custom)
    
    var itemsForCheckout = [ItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.nib(), forCellReuseIdentifier: "ItemTableViewCell")
        configureFloatingActionButton()
    }
    
    func configureFloatingActionButton() {
        fabButton.frame = CGRect(x: 280, y: 700, width: 100, height: 100)
        fabButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        fabButton.clipsToBounds = true
        fabButton.layer.cornerRadius = 50
        fabButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        fabButton.layer.borderWidth = 3.0
        //fabButton.addTarget(self, action: #selector(showBasketViewController), for: .touchUpInside)
        fabButton.tintColor = .white
        fabButton.setTitle("Make Order", for: .normal)
        
        view.addSubview(fabButton)
    }

}

extension BasketTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsForCheckout.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell else {
            fatalError()
        }
        let chosenItem = itemsForCheckout[indexPath.row]
        cell.name.text = chosenItem.name
        cell.price.text = String(chosenItem.price)
        cell.iconImage.image = chosenItem.image
        cell.delegate = self
        return cell
    }
}
