//
//  DateExtension.swift
//  TheZooit
//
//  Created by Gianmarco Cremisi on 27/10/23.
//

import Foundation

extension Date: RawRepresentable {
    public var rawValue: String {
        self.timeIntervalSinceReferenceDate.description
    }

    public init?(rawValue: String) {
        self = Date(timeIntervalSinceReferenceDate: Double(rawValue) ?? 0.0)
    }
}
