//
//  CollectionView.swift
//  CollectionLibrary
//
//  Created by Igor Malyarov on 25.05.2020.
//  Copyright © 2020 Igor Malyarov. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CollectionView<Card: View>: View {
    public let collection: [CollectionRow]
    public let cardView: (CollectionElement) -> Card
    
    public init(collection: [CollectionRow],
         @ViewBuilder cardView: @escaping (CollectionElement) -> Card) {
        
        self.collection = collection
        self.cardView = cardView
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                ForEach(collection) { row in
                    CollectionRowView(collectionRow: row, cardView: self.cardView)
                }
                .padding(.horizontal)
            }
        }
    }
}
