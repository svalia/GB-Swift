//
//  ContentView.swift
//  LearSwiftUI
//
//  Created by Valia Smolin on 03.07.2024.
//

import SwiftUI

struct ContentView: View {
    enum Screens {
        case newScreen
        case whereAreGoing
    }
    @State var isSheet: Bool = false
    @State var screenNum: Screens = .newScreen
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color(#colorLiteral(red: 0.6358144879, green: 0.07771249861, blue: 0.01419980079, alpha: 1)).ignoresSafeArea()
                VStack {
                    Image("img")
                        .resizable()
                        .frame(width: 250, height: 150)
                        .onTapGesture {
                            screenNum = .whereAreGoing
                            isSheet.toggle()
                        }
                    Spacer()
                    NavigationLink {NewScreen()} label: {
                        Text ("App Name")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.all)
                            .border(.red, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.red)
                    }
                    Spacer()
                    NavigationLink("Tap") {
                        NewScreen()
                    }
                    .foregroundStyle(.white)
                    Spacer()
                    Button("Продолжить") {
                        print("Tap")
                        screenNum = .newScreen
                        isSheet.toggle()
                    }
                    .font(.body)
                    .padding(.all)
                    .border(.red, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.red)
                }
                .padding()
                
            }
//            .sheet(isPresented: $isSheet, content: {
//                NewScreen()
//            })
            .navigationDestination(isPresented: $isSheet) {
                switch screenNum {
                case .newScreen : NewScreen()
                case .whereAreGoing : WhereAreGoing()
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
