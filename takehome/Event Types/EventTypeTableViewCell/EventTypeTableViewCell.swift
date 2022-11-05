//
//  EventTypeTableViewCell.swift
//  takehome
//
//

import UIKit

class EventTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        colorView.layer.cornerRadius = colorView.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension EventTypeTableViewCell: ReusableView {
    static var nib: UINib? {
        return UINib(nibName: String(describing: EventTypeTableViewCell.self), bundle: nil)
    }
}
