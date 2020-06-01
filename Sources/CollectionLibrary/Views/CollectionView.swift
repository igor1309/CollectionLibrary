//
//  CollectionView.swift
//  TestingAreaCharts
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

//  MARK: -
@available(iOS 13.0, *)
struct CollectionView_Previews: PreviewProvider {
    static var collection = [CollectionRow.moscow,
                             CollectionRow.moscow,
                             CollectionRow.moscow]
    
    static func card(element: Elementable) -> some View {
        Rectangle()
            .fill(Color.blue)
            .aspectRatio(2/3, contentMode: .fit)
            .frame(width: 120)
    }
    
    static var previews: some View {
        CollectionView(collection: collection) { element in
            card(element: element)
        }
        .background(Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all))
        .environment(\.colorScheme, .dark)
        .previewLayout(.sizeThatFits)
    }
}
