//
//  ButtonMarkPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 27/05/24.
//

import SwiftUI

struct ButtonMarkPlace: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Button(action: {
                    vm.toggleMarkPlace()
                }, label: {
                    HStack(alignment: .center) {
                        Image(systemName: "scope")
                            .foregroundStyle(.white)
                        
                        Text("Mark Place")
                            .font(.subheadline)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background(Color.primaryPink)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                })
            }
            .buttonBorderShape(.circle)
            .padding(.horizontal, geometry.size.width * 0.03)
        }
    }
}

#Preview {
    ButtonMarkPlace()
}
