//
//  VScrollView.swift
//  LearSwiftUI
//
//  Created by Valia Smolin on 12.07.2024.
//

import SwiftUI

struct VScrollView: View {
    var body: some View {
        ScrollView {
            LazyVStack
            {
                ForEach (0..<100) {item in
                    DescriptionItem(imageName: "square.and.arrow.up.fill", textName: "Blablabla", textColor: .black, iconColor: .pink)
                        
                }
            }
        }
        .frame(height: 300)
    }
}
#Preview {
    VScrollView()
}
