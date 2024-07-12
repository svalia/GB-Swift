//
//  BackButton.swift
//  LearSwiftUI
//
//  Created by Valia Smolin on 10.07.2024.
//

import SwiftUI

struct BackButton: View {
    var action: () -> Void
    var body: some View {
        Button {
            action()
        }
    label: {
        HStack {
            Image(systemName: "arrowshape.left.fill")
                .resizable()
                .frame(width: 10, height: 5)
            Text("Назад")
        }
        .foregroundStyle(.white)
    }
    }
}

