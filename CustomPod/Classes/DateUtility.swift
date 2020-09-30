//
//  DateUtility.swift
//  GoodCheckup-Doctor
//
//  Created by Mandar Choudhary on 24/09/20.
//  Copyright © 2020 Vaibhav Deshpande. All rights reserved.
//

import Foundation

struct DateUtility {
    static func getTimeZoneOffset() -> Int {
        let sourceDate = Date()
        let destinationTimeZone = NSTimeZone.system
        let timeZoneOffset = destinationTimeZone.secondsFromGMT(for: sourceDate) * 1_000
        return Int(timeZoneOffset)
    }
}
