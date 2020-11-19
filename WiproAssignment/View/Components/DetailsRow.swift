//
//  DetailsRow.swift
//  WiproAssignment
//
//  Created by Anasuya Polu on 2020-11-19.
//

import SDWebImageSwiftUI
import SwiftUI

struct DetailsRow: View {
    private var details: Details

    init(_ details: Details) {
        self.details = details
    }
    
    private var imageUrl: URL? {
        if let encoded = self.details.imageHref?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
           let url = URL(string: encoded) {
            return url
        }
        else {
            return nil
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 10) {
                WebImage(url: self.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50, alignment: .leading)
                    .background(WColors.BrownGray)
                    .cornerRadius(10)
                    .clipped()
                
                VStack(spacing: 10) {
                    Text(details.title ?? "")
                        .foregroundColor(WColors.Black)
                        .font(Font.system(size: 16, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(details.description ?? "")
                        .foregroundColor(WColors.BrownGray)
                        .font(Font.system(size: 14, weight: .regular, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
            }
        }
        .padding(.vertical, 10)
    }
}
