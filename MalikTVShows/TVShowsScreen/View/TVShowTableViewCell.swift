//
//  TVShowTableViewCell.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import UIKit
import Kingfisher

class TVShowTableViewCell: UITableViewCell {
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!

    func configCell(_ show: TVShow?) {
        self.movieNameLabel.text = show?.name
        self.movieOverviewLabel.text = show?.overview
        let imageUrl = Constants.APIBuilder.imageBaseURL+(show?.poster_path ?? "");
        self.posterImageView.kf.indicatorType = .activity
        self.posterImageView.kf.setImage(with: URL(string: imageUrl))
    }
}
