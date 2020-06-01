//
//  CollectionCardView.swift
//  CollectionLibrary
//
//  Created by Igor Malyarov on 25.05.2020.
//  Copyright © 2020 Igor Malyarov. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CollectionCardView<T: Elementable, Card: View>: View {
    public let element: T  //CollectionElement
    public let card: (T) -> Card
    
    public init(element: T, @ViewBuilder card: @escaping (T) -> Card) {
        self.element = element
        self.card = card
    }
     
    public var body: some View {
        VStack(alignment: .leading) {
            
            card(element)
            
            Text(element.header)
                .font(.caption)
            Text(element.subheader)
                .foregroundColor(.secondary)
                .font(.caption)
        }
    }
}
