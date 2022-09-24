//
//  ReachablityManager.swift
//  
//
//  Created by Vishweshwaran on 24/09/22.
//

import SwiftUI
import Network

public final class ReachablityManager: ObservableObject {
    
    @Published var isConnected = true
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "ReachablityManager")
    
    var connectionDescription: String? {
        if !isConnected {
            return "It looks like you're not connected to the internet"
        }
        return nil
    }
    
    public init() {
        startMonitoring()
    }
    
    private func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
