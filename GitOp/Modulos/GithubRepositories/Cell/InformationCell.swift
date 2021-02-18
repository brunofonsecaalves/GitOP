//
//  InformationCell.swift
//  GitOp
//
//  Created by Bruno Alves on 08/02/21.
//

import UIKit

class InformationCell: UITableViewCell {
    
    static let cellIdentifier = InformationCell.className
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    override var reuseIdentifier: String? {
        return InformationCell.cellIdentifier
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
