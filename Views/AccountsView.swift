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
        .pickerStyle( .segmented )
        .onAppear { selectedAccountName = "All" } /** @TODO:  add this to secrets for persistance. */
    }
}

#Preview
{
    let schwabClient : SchwabClient = SchwabClient( secrets: getSecretsFromFile() )
    schwabClient.secrets.accountNumbers = ["*7890", "*6789"]

    return AccountsView( schwabClient: schwabClient )
}
