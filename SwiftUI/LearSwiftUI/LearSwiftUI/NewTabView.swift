//
//  NewTabView.swift
//  LearSwiftUI
//
//  Created by Valia Smolin on 12.07.2024.
//

import SwiftUI
struct NewTabView: View {
    var body: some View {
        TabView {
            VScrollView().tabItem { Label("VScroll", systemImage: "square.and.arrow.up.fill") }
            HScrollView().tabItem { Label(
                title: { Text("HScroll") },
                icon: { Image(systemName: "folder.fill.badge.plus")
                        .symbolRenderingMode(.multicolor)
                    .foregroundStyle(Color(red: 0, green: 0.7633269429, blue: 0.2772474885), .blue)}
            ) }
            VScrollView().tabItem { Label("VScroll", systemImage: "square.and.arrow.up.fill") }
            HScrollView().tabItem { Label(
                title: { Text("HScroll") },
                icon: { Image(systemName: "folder.fill.badge.plus")
                        .symbolRenderingMode(.multicolor)
                    .foregroundStyle(Color(red: 0, green: 0.7633269429, blue: 0.2772474885), .blue)}
            ) }
            VScrollView().tabItem { Label("VScroll", systemImage: "square.and.arrow.up.fill") }
            HScrollView().tabItem { Label(
                title: { Text("HScroll") },
                icon: { Image(systemName: "folder.fill.badge.plus")
                        .symbolRenderingMode(.multicolor)
                    .foregroundStyle(Color(red: 0, green: 0.7633269429, blue: 0.2772474885), .blue)}
            ) }
        
        }
    }
}

#Preview {
    NewTabView()
}
