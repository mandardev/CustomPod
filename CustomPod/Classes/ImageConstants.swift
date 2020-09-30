//
//  ImageConstants.swift
//  CustomPod
//
//  Created by Mandar Choudhary on 28/09/20.
//  Copyright © 2020 Mandar Choudhary. All rights reserved.
//

import Foundation
import UIKit

enum ImageConstants: String {
    case cameraFront = "camera_front"
    case cameraBack = "camera_back"
    case videoUnmuted = "video_unmuted"
    case videoMuted = "video_muted"
    case micUnmuted = "mic_unmuted"
    case micMuted = "mic_muted"
    case decline = "decline"
    case docIcon = "doc_icon"
    case screenShot = "screenshot_icon.png"
}

extension ImageConstants {
    
    func getUIImage() -> UIImage {
//        UIImage.init(named: self.rawValue) ?? UIImage()
        let bundle = Bundle(for: VideoCallController.self)
        return UIImage(named: self.rawValue, in: bundle, compatibleWith: nil) ?? UIImage()
    }
    
}





