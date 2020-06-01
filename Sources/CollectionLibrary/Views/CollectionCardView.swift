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

//  MARK: -
@available(iOS 13.0, *)
struct CollectionCardView_Previews: PreviewProvider {
    static let element = CollectionElement(
        header: "driving",
        subheader: "moving average",
        series: CollectionElement.series)
    
    static func card(element: Elementable) -> some View {
        Rectangle()
            .fill(Color.blue)
            .aspectRatio(2/3, contentMode: .fit)
            .frame(width: 120)
    }
    
    static var previews: some View {
        Group {
            CollectionCardView(element: element) { element in
                card(element: element)
            }
            
            CollectionCardView(element: element) { element in
                VStack(alignment: .trailing) {
                    Text(element.header)
                    Text(element.subheader)
                    Rectangle()
                        .fill(Color.pink).opacity(0.5)
                        .frame(width: 100, height: 100)
                }
                .font(.footnote)
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all))
        .environment(\.colorScheme, .dark)
        .previewLayout(.sizeThatFits)
    }
}
