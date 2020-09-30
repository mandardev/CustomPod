//
//  ImageConstants.swift
//  CustomPod
//
//  Created by Mandar Choudhary on 28/09/20.
//  Copyright © 2020 Mandar Choudhary. All rights reserved.
//

import Foundation
import UIKit

enum OUImageConstants: String {
    case cameraFront = "camera_front"
    case cameraBack = "camera_back"
    case videoUnmuted = "video_unmuted"
    case videoMuted = "video_muted"
    case micUnmuted = "mic_unmuted"
    case micMuted = "mic_muted"
    case decline = "decline"
    case docIcon = "doc_icon"
    case screenShot = "screenshot_icon"
}

extension OUImageConstants {
    
    func getUIImage() -> UIImage {
        
        let bundle = Bundle(for: OUVideoCallController.self)
        let bundleURL = bundle.resourceURL?.appendingPathComponent("CustomPod.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        return UIImage(named: self.rawValue, in: resourceBundle, compatibleWith: nil) ?? UIImage()
    }
    
}





