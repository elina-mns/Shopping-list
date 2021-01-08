//
//  CheckoutTableViewCell.swift
//  Shopping list
//
//  Created by Elina Mansurova on 2021-01-08.
//

import UIKit

protocol CheckoutTableViewCellDelegate: class {
    func stepperValueChanged(value: Double, _ cell: UITableViewCell)
}

class CheckoutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var checkoutName: UILabel!
    @IBOutlet weak var checkoutPrice: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var chosenAmount: UILabel!
    
    
    weak var delegate: CheckoutTableViewCellDelegate?
    
    static let identifier = "CheckoutTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "CheckoutTableViewCell",
                     bundle: nil)
    }

    @IBAction func didChangeStepperValue(_ sender: UIStepper) {
        let value = sender.value
        if value == 1 {
            chosenAmount.text = "\(Int(value)) item"
        }
        if value > 1 {
            chosenAmount.text = "\(Int(value)) items"
        }
        delegate?.stepperValueChanged(value: sender.value, self)
    }
    
}



