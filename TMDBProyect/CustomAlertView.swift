//
//  CustomAlertView.swift
//  TMDBProyect
//
//  Created by Casa on 27/11/23.
//

import SwiftUI

struct CustomAlertView: View {
    let title: String
    let message: String
    let buttonText: String
    
    let action: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .foregroundStyle(.red.opacity(0.8))
            Text(title)
                .font(.title2)
                .bold()
            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
            Button(action: {
                action()
            },label: {
                Text(buttonText)
            })
            .buttonStyle(.bordered)
        }
        .frame(maxWidth: 200)
        .padding(15)
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    CustomAlertView(title: "Error", message: "No se han podido cargar los datos, inténtelo de nuevo", buttonText: "Que quieres?", action: {})
}
