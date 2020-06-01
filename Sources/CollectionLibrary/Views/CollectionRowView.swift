//
//  CollectionRowView.swift
//  CollectionLibrary
//
//  Created by Igor Malyarov on 25.05.2020.
//  Copyright © 2020 Igor Malyarov. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CollectionRowView<Card: View>: View {
    public let collectionRow: CollectionRow
    public let cardView: (CollectionElement) -> Card
    
    public init(collectionRow: CollectionRow,
         @ViewBuilder cardView: @escaping (CollectionElement) -> Card) {
        
        self.collectionRow = collectionRow
        self.cardView = cardView
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            VStack(alignment: .leading, spacing: 0) {
                Text(collectionRow.title)
                    .font(.headline)
                
                Text(collectionRow.subtitle.uppercased())
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(collectionRow.elements) { element in
                        self.cardView(element)
                    }
                }
                .padding(.vertical, 3)
            }
        }
    }
}
