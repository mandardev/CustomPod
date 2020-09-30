//
//  VideoCallEndRequest.swift
//  GoodCheckup-Doctor
//
//  Created by Mandar Choudhary on 24/09/20.
//  Copyright © 2020 Vaibhav Deshpande. All rights reserved.
//

import Foundation

struct VideoCallEndRequest {
    let appointmentId: String
    let endedBy: String
    
    private let kAppointmentId = "appointmentId"
    private let kEndedBy = "endedBy"
    
    func parameters() -> [String: Any] {
        [
            kAppointmentId: appointmentId,
            kEndedBy: endedBy
        ]
    }
}
