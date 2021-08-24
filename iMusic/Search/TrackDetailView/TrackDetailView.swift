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
        trackImageView.layer.cornerRadius = 5
        let  scale: CGFloat = 0.8
        trackImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    
//MARK: - setElements()

    func setElements(viewModel: SearchViewModel.Cell) {
        trackTitleLabel.text = viewModel.trackName
        authorTitleLabel.text = viewModel.artistName
        playTrack(previewURL: viewModel.previewStringURL)
        let string600 = viewModel.iconURLString?.replacingOccurrences(of: "100x100", with: "600x600")
        guard let url = URL(string: string600 ?? "") else { return }
        trackImageView.sd_setImage(with: url, completed: nil)
    }
    
    
    private func playTrack(previewURL: String?) {
        
       // print("playTrack")
        guard let url = URL(string: previewURL ?? "") else { return }
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    
    
//MARK: - IBActions

    @IBAction func dragDownButtonTapped(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    @IBAction func handleTimerSlider(_ sender: Any) {
    }
    @IBAction func handleVollumeSlider(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    @IBAction func previousTrack(_ sender: Any) {
    }
    @IBAction func nextTrack(_ sender: Any) {
    }
    @IBAction func playPauseAction(_ sender: Any) {
        
        if player.timeControlStatus == .paused {
            player.play()
            playPauseButton.setImage(#imageLiteral(resourceName: "Pause"), for: .normal)
        }
        else {
            player.pause()
            playPauseButton.setImage(#imageLiteral(resourceName: "Triangle"), for: .normal)
        }
    }
    
}
