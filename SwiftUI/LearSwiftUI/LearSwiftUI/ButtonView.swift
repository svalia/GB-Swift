//
//  ButtonView.swift
//  LearSwiftUI
//
//  Created by Valia Smolin on 05.07.2024.
//

import SwiftUI
struct ButtonView: View {
    var tap: () -> Void
    var body: some View {
        Button {
            tap()
        } label: {
            HStack{
                Text("Далее")
                Image(systemName: "arrowshape.right.fill")
                    .resizable()
                    .frame(width: 10.0, height: 5.0)
            }
            .foregroundStyle(.white)
        }
        
    }
}
#Preview {
    ButtonView{print("Tap1")}
}
