//
//  VideoPlayerCell.swift
//  HDFCPerks
//
//  Created by Sanjay Mali on 28/05/18.
//  Copyright © 2018 Sanjay Mali. All rights reserved.
//

import UIKit
//import AAPlayer
import YouTubePlayer
class VideoPlayerCell: UITableViewCell{
//    @IBOutlet weak var videoPlayer:AGVideoPlayerView!
    @IBOutlet var video_Player: YouTubePlayerView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var unlikeButton: UIButton!
    @IBOutlet var viewButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var infoButton: UIButton!
    
//    let player = BMPlayer()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
