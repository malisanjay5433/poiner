//
//  FeedCell.swift
//  PioneerApp
//
//  Created by Sanjay Mali on 26/05/19.
//  Copyright © 2019 theappmaker. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var bulletinLbl: UILabel!
    @IBOutlet weak var newlbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var shareLbl: UILabel!
    @IBOutlet weak var commentBl: NSLayoutConstraint!
    @IBOutlet weak var likeslbl: UILabel!
    @IBOutlet weak var viewsLbl: UILabel!
    @IBOutlet weak var imageBanner: ImagePlaceholderLoader!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
