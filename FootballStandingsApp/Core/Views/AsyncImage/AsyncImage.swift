//
//  AsyncImage.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import SwiftUI

struct AsyncImageView: View {
    let url: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "photo.circle")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: width, height: height)
        }
        .frame(width: width, height: height)
    }
}
