//
//  NewScreen3.swift
//  LearSwiftUI
//
//  Created by Valia Smolin on 10.07.2024.
//

import SwiftUI
struct NewScreen3: View {
    enum Screens {
        case newScreen
        case whereAreGoing
        case contentView
    }
    @State var text: String = ""
    @State var changeScreen: Screens = .newScreen
    var body: some View {
        VStack {
            Spacer()
            Text(text)
            switch changeScreen {
            case .newScreen:
                NewScreen()
            case .whereAreGoing:
                WhereAreGoing()
            case .contentView : ContentView()
            }
            HStack{
                Button(action: {
                    changeScreen = .newScreen
                }, label: {
                    Text("Button 1")
                })
                Button(action: {
                    changeScreen = .whereAreGoing
                }, label: {
                    Text("Button 2")
                })
                Button(action: {
                    changeScreen = .contentView
                }, label: {
                    Text("Button 3")
                })
            }
        }
    }
}

#Preview {
    NewScreen3()
}
