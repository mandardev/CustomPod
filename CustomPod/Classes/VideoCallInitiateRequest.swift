//
//  VideoCallInitiateRequest.swift
//  GoodCheckup-Doctor
//
//  Created by Mandar Choudhary on 22/09/20.
//  Copyright © 2020 Vaibhav Deshpande. All rights reserved.
//

import Foundation

struct VideoCallInitiateRequest {
    let appointmentId: String
    let requestInitiatedBy: String
    
    private let kAppointmentId = "appointmentId"
    private let kRequestInitiatedBy = "requestInitiatedBy"
    
    func parameters() -> [String: Any] {
        [
            kAppointmentId: appointmentId,
            kRequestInitiatedBy: requestInitiatedBy
        ]
    }
}
