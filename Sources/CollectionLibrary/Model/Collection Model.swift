//
//  Collection Model.swift
//  TestingAreaCharts
//
//  Created by Igor Malyarov on 25.05.2020.
//  Copyright © 2020 Igor Malyarov. All rights reserved.
//

import SwiftUI

public struct CollectionRow: Identifiable {
    public var id = UUID()
    
    public let title: String
    public let subtitle: String
    public let elements: [CollectionElement]
}

public extension CollectionRow {
    static var moscow = CollectionRow(
        title: "Moscow",
        subtitle: "Russia",
        elements: [
            CollectionElement.moscowDriving,
            CollectionElement.moscowWalking,
            CollectionElement.moscowTransit
    ])
}

public struct CollectionElement: Identifiable {
    public var id = UUID()
    
    public let header: String
    public let subheader: String
    public let series: [CGFloat]
}

public extension CollectionElement {
    static var moscowDriving = CollectionElement(
        header: "Driving",
        subheader: "moving average",
        series: series)
    
    static var moscowWalking = CollectionElement(
        header: "Walking",
        subheader: "moving average",
        series: series)
    
    static var moscowTransit = CollectionElement(
        header: "Transit",
        subheader: "moving average",
        series: series)
        
    static let series: [CGFloat] = [100.0,92.66,95.29,96.42,107.5,101.22,93.41,87.91,94.76,98.07,101.52,114.06,105.16,85.92,91.57,91.79,93.18,98.02,110.46,109.24,83.39,91.31,92.84,93.88,97.57,111.75,117.34,89.88,91.7,95.7,97.68,103.34,118.61,113.45,95.82,100.99,99.87,102.57,104.23,115.72,117.34,87.97,91.49,92.14,94.63,97.48,114.48,115.21,87.01,92.87,93.89,98.65,100.54,108.43,114.48,86.13,92.2,85.1,81.65,69.1,66.28,58.17,40.65,36.57,30.15,27.35,25.2,24.13,18.74,14.97,15.46,16.52,15.32,16.05,17.14,13.4,12.84,15.43,14.55,14.39,13.84,13.76,12.71,12.03,14.26,13.54,13.32,12.73,13.37,12.52,11.25,12.75,14.13,13.42,13.34,13.46,12.1,12.61,14.58,13.49,14.06,14.03,13.83,14.08,12.19,14.98,16.01,15.39,14.9,16.51,16.37,15.64,18.02,17.96,17.03,17.64,16.14,15.41,14.63,18.45,18.54,20.14,19.17,17.42,20.05,20.02]
}
