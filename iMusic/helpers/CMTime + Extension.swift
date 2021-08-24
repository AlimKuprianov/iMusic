//
//  CMTime + Extension.swift
//  iMusic
//
//  Created by Алим Куприянов on 24.08.2021.
//

import Foundation
import AVKit

extension CMTime {
    
    func toDisplayString() -> String {
        guard !CMTimeGetSeconds(self).isNaN else { return "" }
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let seconds = totalSeconds % 60
        let minutes = totalSeconds / 60
        let timeFormatingString = String(format: "%02d:%02d", minutes,seconds)
        
        return timeFormatingString
    }
}
