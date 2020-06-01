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

//  MARK: -
@available(iOS 13.0, *)
struct CollectionRowView_Previews: PreviewProvider {
    static func card(element: Elementable) -> some View {
        Rectangle()
            .fill(Color.blue)
            .aspectRatio(2/3, contentMode: .fit)
            .frame(width: 120)
    }
    
    static var previews: some View {
        VStack {
            CollectionRowView(collectionRow: CollectionRow.moscow) { element in
                card(element: element)
            }
            
            CollectionRowView(
                collectionRow: CollectionRow.moscow
            ) { element in
                VStack(alignment: .trailing) {
                    Text(element.header)
                    Text(element.subheader)
                    Rectangle()
                        .fill(Color.pink).opacity(0.5)
                        .frame(width: 100, height: 50)
                }
                .font(.footnote)
                .background(Color.blue.opacity(0.3))
            }
            
            CollectionRowView(
                collectionRow: CollectionRow.moscow
            ) { element in
                VStack(alignment: .leading, spacing: 6) {
                    Text("Simple card")
                        .foregroundColor(.blue)
                    Rectangle()
                        .fill(Color.orange).opacity(0.5)
                        .frame(width: 100, height: 120)
                }
                .background(Color.green.opacity(0.3))
            }
        }
        .padding(.horizontal)
        .background(Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all))
//        .environment(\.colorScheme, .dark)
        .previewLayout(.sizeThatFits)
    }
}

