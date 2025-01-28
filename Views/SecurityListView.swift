//
//  SecurityListView.swift
//  ccSchwabManager
//
//  Created by Harold Tomlinson on 2025-01-01.
//

import SwiftUI
import SwiftData

struct SecurityListView: View
{
    @Query private var positions: [SapiPosition]
    @Environment(\.modelContext) private var context

    var body: some View
    {

        List( positions )
        { position in
            HStack {
                Text( position.symbol() )
                Text( String( format: "%0.2f", position.avgPrice() ) )
            }
        }

    }

}

#Preview
{
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SapiPosition.self, configurations: config)

    for i in 1..<8 {
        let position = SapiPosition(symbol: "Sym\(i)", averagePrice: Double(i) )
        container.mainContext.insert( position )
    }

    return SecurityListView()
        .modelContainer(container)

}
