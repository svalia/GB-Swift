//
//  NewScreen.swift
//  LearSwiftUI
//
//  Created by Valia Smolin on 03.07.2024.
//

import SwiftUI

struct NewScreen: View {
    @State var isSheet: Bool = false
    @Environment (\.dismiss) var back
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.6358144879, green: 0.07771249861, blue: 0.01419980079, alpha: 1)).ignoresSafeArea()
            VStack{
                Spacer()
                    .frame(height: 16)
                Text("Дождь, солнце, снег?")
                    .font(.title)
                    .foregroundStyle(.white)
                Spacer()
                DescriptionItem(imageName: "sun.min.fill", textName: "Всегда актуальная погода", iconColor: .yellow)
                DescriptionItem(imageName: "cloud.rain.fill", textName: "Подскажем, когда необходимо взять зонт", iconColor: .blue)
                DescriptionItem(imageName: "snowflake", textName: "Не дадим замерзнуть", iconColor: .white)
                Spacer()
                ButtonView{                 print("Tap1")
                    isSheet.toggle()
                }
                .fullScreenCover(isPresented: $isSheet, content: {
                    WhereAreGoing()
                })
            }
        }
        .navigationTitle("New Screen")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    back()
                }
            label: {
                Image(systemName: "arrowshape.left.fill")

            }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    NewScreen()
}
