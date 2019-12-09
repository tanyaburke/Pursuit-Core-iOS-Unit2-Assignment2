//
//  RightTableViewCell.swift
//  GameOfThrones
//
//  Created by Tanya Burke on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var seasonAndEpisode: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
    
    func cellConfigure(for episode: GOTEpisode){
        episodeImage.image = UIImage(named: episode.mediumImageID)
        seasonAndEpisode.text = "S:\(episode.season) E:\(episode.number)"
    episodeName.text = episode.name
}
} 
