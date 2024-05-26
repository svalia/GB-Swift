//
//  ContentView.swift
//  swiftuiApplication
//
//  Created by Valia Smolin on 25.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
            LoginView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        Text("Home View")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
    }
}

struct LoginView: View {
    @State private var login: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            TextField("Логин", text: $login)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Пароль", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                print("Login: \(login), Password: \(password)")
            }) {
                Text("Войти")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}



#Preview {
    ContentView()
}
