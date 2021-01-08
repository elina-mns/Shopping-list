//
//  CheckoutTableViewCell.swift
//  Shopping list
//
//  Created by Elina Mansurova on 2021-01-08.
//

import UIKit

protocol CheckoutTableViewCellDelegate: class {
    
    func didTapAddOrSubstract(_ cell: UITableViewCell)
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

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func didTapAddOrSubstract(_ sender: Any) {
        delegate?.didTapAddOrSubstract(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}



