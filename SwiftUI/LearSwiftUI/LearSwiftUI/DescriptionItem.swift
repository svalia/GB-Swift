//
//  DescriptionItem.swift
//  LearSwiftUI
//
//  Created by Valia Smolin on 03.07.2024.
//

import SwiftUI
struct DescriptionItem: View {
    var imageName: String
    var textName: String
    var iconColor: Color
    var body: some View {
        HStack{
            Spacer()
                .frame(width: 16.0)
            Image(systemName: imageName)
                .resizable()
                .foregroundStyle(iconColor)
                .frame(width: 35.0, height: 35.0)
            Text(textName)
                .font(.body)
                .foregroundStyle(.white)
            Spacer()
        }
    }
    
}
#Preview {
    DescriptionItem(imageName: "sun.min.fill", textName: "", iconColor: .black)
}
