//
//  TrackDetailView.swift
//  iMusic
//
//  Created by Алим Куприянов on 21.08.2021.
//

import UIKit
import AVKit
import SDWebImage

class TrackDetailView: UIView {
    
//MARK: - IBOutlets

    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var currentTimeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationTitle: UILabel!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var authorTitleLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    
//MARK: - AVPlayer
    
    let player: AVPlayer = {
        
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    
    
//MARK: - awakeFromNib()

    override func awakeFromNib() {
        super.awakeFromNib()
    
        trackImageView.backgroundColor = .red
    }
    
    
//MARK: - setElements()

    func setElements(viewModel: SearchViewModel.Cell) {
        trackTitleLabel.text = viewModel.trackName
        authorTitleLabel.text = viewModel.artistName
        
        let string600 = viewModel.iconURLString?.replacingOccurrences(of: "100x100", with: "600x600")
        guard let url = URL(string: string600 ?? "") else { return }
        trackImageView.sd_setImage(with: url, completed: nil)
    }
    
//MARK: - IBActions

    @IBAction func dragDownButtonTapped(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    @IBAction func handleTimerSlider(_ sender: Any) {
    }
    @IBAction func handleVollumeSlider(_ sender: Any) {
    }
    @IBAction func previousTrack(_ sender: Any) {
    }
    @IBAction func nextTrack(_ sender: Any) {
    }
    @IBAction func playPauseAction(_ sender: Any) {
    }
    
}
