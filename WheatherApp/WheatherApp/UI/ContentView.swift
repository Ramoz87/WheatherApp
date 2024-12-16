//
//  ContentView.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var modelData = WheatherViewModel.create()
    
    var body: some View {
        VStack {
            SearchView(text: $modelData.search)
            
            switch modelData.state {
            case .noCity:
                Spacer()
                NoDataView()
            case .selected(let city):
                CityWheatherView(wheather: city)
                    .padding(.top, 80)
            case .search(let city):
                if let city {
                    CityWheatherCard(model: city)
                        .padding(.top, 30)
                }
            }
            
            Spacer()
        }
        .padding()
        .alert(isPresented: .constant(modelData.alertError != nil),
               error: modelData.alertError,
               actions: { _ in
            Button("OK", role: .cancel) {
                modelData.alertError = nil
            }
        }, message: { error in
            Text(error.errorDescription ?? "Error")
        })
        .task {
            await modelData.update()
        }
    }
}

struct NoDataView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("No City Selected")
                .font(.system(size: 30, weight: .semibold))
            Text("Please Search For a City")
                .font(.system(size: 15, weight: .semibold))
        }
    }
}

#Preview {
    ContentView()
}


