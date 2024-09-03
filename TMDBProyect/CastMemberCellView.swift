//
//  CastMemberCellView.swift
//  TMDBProyect
//
//  Created by Casa on 29/11/23.
//

import SwiftUI

struct CastMemberCellView: View {
    let castMember: CastMemberPresentation
    
    var body: some View {
        
        VStack {
            AsyncImage(url: castMember.imageMovie) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 150)
            } placeholder: {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 150)
            }
            Text(castMember.name)
            Text("Abrir la Wiki\n del actor")
        }
    }
}

#Preview {
    CastMemberCellView(castMember: .castMemberTest)
}
