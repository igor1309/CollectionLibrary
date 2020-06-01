//
//  Collection Protocols.swift
//  TestingAreaCharts
//
//  Created by Igor Malyarov on 25.05.2020.
//  Copyright © 2020 Igor Malyarov. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
public protocol Collectionable {
    associatedtype T: Elementable & Identifiable
    
    var title: String { get }
    var subtitle: String { get }
    var elements: [T] { get }
}
extension CollectionRow: Collectionable {}

public protocol Elementable {
    var header: String { get }
    var subheader: String { get }
    var series: [CGFloat] { get }
}
extension CollectionElement: Elementable {}
