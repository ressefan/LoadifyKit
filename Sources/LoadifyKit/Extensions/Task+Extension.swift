//
//  Task+Extension.swift
//  
//
//  Created by Vishweshwaran on 30/10/22.
//

import Foundation

public extension Task where Success == Never, Failure == Never {
    
    static func sleep(seconds: TimeInterval) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }
}
