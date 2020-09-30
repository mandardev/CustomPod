//
//  VideoCallCancelRequest.swift
//  GoodCheckup-Doctor
//
//  Created by Mandar Choudhary on 24/09/20.
//  Copyright © 2020 Vaibhav Deshpande. All rights reserved.
//

import Foundation

struct VideoCallCancelRequest {
    let appointmentId: String
    
    private let kAppointmentId = "appointmentId"
    
    func parameters() -> [String: Any] {
        [
            kAppointmentId: appointmentId
        ]
    }
}
