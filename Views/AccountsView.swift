//
//  WorkflowButtonsView.swift
//  ccSchwabManager
//
//  Created by Harold Tomlinson on 2025-01-05.
//

import SwiftUI

struct AccountsView: View
{
    private var schwabClient : SchwabClient
    @State private var selectedAccountName: String = ""

    init( schwabClient: SchwabClient )
    {
        self.schwabClient = schwabClient
    }

    var body: some View
    {
        Picker( "", selection: $selectedAccountName )
        {
            Text( "All" ).tag( "All" )
            ForEach( self.schwabClient.secrets.accountNumbers, id: \.self )
            { account in
                Text( account ).tag( account )
            }
        }
        .pickerStyle( .menu )
        .onAppear { selectedAccountName = "All" }
    }
}
