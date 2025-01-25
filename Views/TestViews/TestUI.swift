//
//  TestUI.swift
//  ccPositionManager
//
//  Created by Harold Tomlinson on 2025-01-10.
//

import SwiftUI

struct TestUI: View
{
    @State private var schwabClient: SchwabClient

    init( schwabClient: SchwabClient )
    {
        self.schwabClient = schwabClient
    }

    var body: some View
    {
        VStack {
            SecretsTestView( schwabClient: schwabClient )
                .padding()
            AuthorizeTestView( schwabClient: schwabClient )
                .padding()
            QuotesTestView( schwabClient: schwabClient )
                .padding()
        }
        
    }

    
}



//#Preview
//{
//    let schwabClient = SchwabClient( secrets: getSecretsFromFile() )
//    TestUI( schwabClient : schwabClient )
//}

