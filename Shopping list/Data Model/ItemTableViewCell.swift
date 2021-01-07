//
//  ItemTableViewCell.swift
//  Shopping list
//
//  Created by Elina Mansurova on 2021-01-07.
//

import UIKit

protocol ItemTableViewCellDelegate: class {
    func didTapAddToBag(_ cell: UITableViewCell)
}

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var addToBag: UIButton!
    
    weak var delegate: ItemTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    @IBAction func didTapAddToBag(_ sender: UIButton) {
        delegate?.didTapAddToBag(self)
    }
    
    static let identifier = "ItemTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ItemTableViewCell",
                     bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
