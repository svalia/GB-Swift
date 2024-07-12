//
//  HScrollView.swift
//  LearSwiftUI
//
//  Created by Valia Smolin on 12.07.2024.
//

import SwiftUI

struct HScrollView: View {
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            LazyHStack (spacing: 20) {
                ForEach (0..<100) {item in
                    DescriptionItem(imageName: "square.and.arrow.up.fill", textName: "Blablabla", textColor: .black, iconColor: .pink)
                }
            }
        }
        .frame(height: 300)
    }
}
#Preview {
    HScrollView()
}
