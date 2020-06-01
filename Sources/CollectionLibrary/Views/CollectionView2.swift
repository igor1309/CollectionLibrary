//
//  CollectionView2.swift
//  CollectionLibrary
//
//  Created by Igor Malyarov on 02.06.2020.
//  Copyright © 2020 Igor Malyarov. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CollectionView2<Content: View>: View {
    public let collection: [CollectionRow]
    public let rowView: (CollectionRow) -> Content
    
    public init(collection: [CollectionRow],
         @ViewBuilder rowView: @escaping (CollectionRow) -> Content) {
        
        self.collection = collection
        self.rowView = rowView
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                ForEach(collection) { row in
                    self.rowView(row)
                }
                .padding(.horizontal)
            }
        }
    }
}
