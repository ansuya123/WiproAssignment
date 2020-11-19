//
//  DetailsRow.swift
//  WiproAssignment
//
//  Created by Anasuya Polu on 2020-11-19.
//

import SwiftUI

struct DetailsRow: View {
    private var details: Details

    init(_ details: Details) {
        self.details = details
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 10) {
                Text("")
                    .frame(width: 50, height: 50, alignment: .leading)
                    .background(WColors.Black)
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
