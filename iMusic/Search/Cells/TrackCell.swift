//
//  TrackCell.swift
//  iMusic
//
//  Created by Алим Куприянов on 08.08.2021.
//

import UIKit
import SDWebImage

protocol TrackViewModel {
    
    var iconURLString: String? { get }
    var trackName: String { get }
    var collectionName: String { get }
    var artistName: String { get }
}

class TrackCell: UITableViewCell {
    
    static let reuseId = "TrackCell"
   
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconImageView.image = nil
    }
    
    func set(trackViewModel: TrackViewModel) {
        
        artistNameLabel.text = trackViewModel.artistName
        trackTitleLabel.text = trackViewModel.trackName
        collectionNameLabel.text = trackViewModel.collectionName
        
        guard let url = URL(string: trackViewModel.iconURLString ?? "") else { return }
        iconImageView.sd_setImage(with: url, completed: nil)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.iconImageView.layer.cornerRadius = self.iconImageView.frame.width / 2
        self.iconImageView.clipsToBounds = true
    }
   
}
