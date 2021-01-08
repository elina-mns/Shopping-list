//
//  BasketTableViewController.swift
//  Shopping list
//
//  Created by Elina Mansurova on 2021-01-07.
//

import UIKit
import SwipeCellKit

class BasketTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    
    private var fabButton = UIButton(type: .custom)
    var checkoutItems = [(item: ItemModel, count: Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CheckoutTableViewCell.nib(), forCellReuseIdentifier: "CheckoutTableViewCell")
        configureFloatingActionButton()
        setTotalPrice()
    }
    
    func setTotalPrice() {
        var price = 0
        for element in checkoutItems {
            price += element.item.price * element.count
        }
        totalPrice.text = "Total price: \(price)"
    }
    
    func configureFloatingActionButton() {
        fabButton.frame = CGRect(x: 280, y: 700, width: 100, height: 100)
        fabButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        fabButton.clipsToBounds = true
        fabButton.layer.cornerRadius = 50
        fabButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        fabButton.layer.borderWidth = 3.0
        //fabButton.addTarget(self, action: #selector(), for: .touchUpInside)
        fabButton.tintColor = .white
        fabButton.setTitle("Make Order", for: .normal)
        fabButton.titleLabel?.numberOfLines = 0
        fabButton.titleLabel?.lineBreakMode = .byWordWrapping
        fabButton.titleLabel?.font = .systemFont(ofSize: 20)
        
        view.addSubview(fabButton)
    }

}

extension BasketTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkoutItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutTableViewCell", for: indexPath) as? CheckoutTableViewCell else {
            fatalError()
        }
        let chosenItem = checkoutItems[indexPath.row]
        cell.checkoutName.text = chosenItem.item.name
        cell.checkoutPrice.text = String(chosenItem.item.price)
        cell.iconImage.image = chosenItem.item.image
        cell.stepper.value = Double(chosenItem.count)
        cell.didChangeStepperValue(cell.stepper)
        cell.delegate = self
        cell.stepperDelegate = self
        return cell
    }
    

    
}

extension BasketTableViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            self.updateModel(at: indexPath)
        }
        deleteAction.image = UIImage(named: "delete")
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        return options
    }
    
    func updateModel(at indexPath: IndexPath) {
        checkoutItems.remove(at: indexPath.row)
        setTotalPrice()
    }
}

extension BasketTableViewController: CheckoutTableViewCellDelegate {
    func stepperValueChanged(value: Double, _ cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        if value == 0 {
            checkoutItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        } else {
            checkoutItems[indexPath.row].count = Int(value)
        }
        setTotalPrice()
    }
}


