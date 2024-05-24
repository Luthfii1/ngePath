//
//  DetailPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 23/05/24.
//

import SwiftUI

struct DetailPlace: View {
    var body: some View {
        VStack(alignment: .leading) {
            HeaderSheet(isCreate: false)
                .padding(6)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

#Preview {
    DetailPlace()
        .environmentObject(LocationViewModel())
}
