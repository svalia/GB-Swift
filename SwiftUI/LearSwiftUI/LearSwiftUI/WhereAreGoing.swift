//
//  WhereAreGoing.swift
//  LearSwiftUI
//
//  Created by Valia Smolin on 05.07.2024.
//

import SwiftUI

struct WhereAreGoing: View {
    @Environment(\.dismiss) var closeIcon
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.6358144879, green: 0.07771249861, blue: 0.01419980079, alpha: 1)).ignoresSafeArea()
            VStack {
                Text("Куда пойти?")
                        .font(.title)
                        .foregroundStyle(.white)
                Spacer()
                DescriptionItem(imageName: "figure.walk", textName: "Всегда актуальные события", iconColor: .yellow)
                DescriptionItem(imageName: "plus.circle.fill", textName: "Новое событие каждый день", iconColor: .green)
                DescriptionItem(imageName: "moon.zzz.fill", textName: "Скучать не приходится", iconColor: .yellow)
                Spacer()
                ButtonView{print("Tap2")}
            }
                
        }
        .navigationTitle("New Screen 2")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton {closeIcon()}
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    WhereAreGoing()
}
