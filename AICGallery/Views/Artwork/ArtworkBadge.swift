//
//  ArtworkBadge.swift
//  AICGallery
//
//  Created by Jared on 3/30/23.
//

import SwiftUI

struct ArtworkBadge: View {
    
    let artwork: Artwork
    
    var body: some View {
        NavigationLink(destination: ArtworkDetailView(artwork: artwork)) {
            VStack(alignment: .leading) {
                // Artwork
                AsyncImage(url: artwork.imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } placeholder: {
                    ProgressView()
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                }
                .accessibilityLabel(artwork.altText)
                
                // Label
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(artwork.title)
                            .headlineSerif
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Text(artwork.artistTitle ?? "Anonymous")
                            .subheadlineSerif
                            .foregroundColor(.primary)
                    }
                    .multilineTextAlignment(.leading)
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .offset(x: 0, y: -30)
            }
            .padding(.horizontal)
        }
        .accessibilityAddTraits(.isButton)
    }
}

struct ArtworkBadge_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkBadge(artwork: Artwork.example)
    }
}
