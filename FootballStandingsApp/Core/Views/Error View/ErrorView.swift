//
//  ErrorView.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import SwiftUI

struct ErrorView: View {
    let errorText: String
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Image(systemName: "exclamationmark.shield")
                
                Text("Произошла ошибка!")
            }
            .font(.title)
            .padding([.horizontal, .top])
            
            Text(errorText)
                .padding([.horizontal, .bottom])
        }
        .foregroundColor(.white)
        .background(Color.mint.cornerRadius(10))
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorText: "Описание ошибки")
    }
}
