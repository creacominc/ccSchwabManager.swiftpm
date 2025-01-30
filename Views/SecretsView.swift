//
//  SecretsView.swift
//  ccSchwabManager
//
//  Created by Harold Tomlinson on 2025-01-10.
//

import SwiftUI

struct SecretsView: View
{
    @Environment(\.dismiss) var dismiss

    @State private var schwabClient : SchwabClient
    @Binding var appState: AppState

    init( schwabClient: SchwabClient, appState: Binding<AppState> )
    {
        self.schwabClient = schwabClient
        self._appState = appState
    }

    var body: some View
    {
        VStack
        {
            HStack
            {
                Text( "App Key: " )
                SecureField( "App Key", text: $schwabClient.secrets.appId )
                    .autocorrectionDisabled()
                    .autocapitalization( .none )
            }
            HStack
            {
                Text( "App Secret: " )
                SecureField( "App Secret", text: $schwabClient.secrets.appSecret )
                    .autocorrectionDisabled()
                    .autocapitalization( .none )
            }
            HStack
            {
                Text( "Redirect URL: " )
                TextField( "Redirect URL", text: $schwabClient.secrets.redirectUrl )
                    .autocorrectionDisabled()
                    .autocapitalization( .none )
            }
//            HStack
//            {
//                Text( "Code: " )
//                TextField( "Code", text: $schwabClient.secrets.code )
//            }
//            HStack
//            {
//                Text( "Session: " )
//                TextField( "Session", text: $schwabClient.secrets.session )
//            }
//            HStack
//            {
//                Text( "Access Token: " )
//                TextField( "Access Token", text: $schwabClient.secrets.accessToken )
//            }
//            HStack
//            {
//                Text( "Refresh Token: " )
//                TextField( "Refresh Token", text: $schwabClient.secrets.refreshToken )
//            }

            Button( "Save Secrets" )
            {
                storeSecrets( secrets: schwabClient.secrets )
                print( "saved" )
                appState = .Authorizing
                dismiss()
            }
            Button( "Load Secrets" )
            {
                var secrets : Secrets = loadSecrets()
                print( "loaded" )
                appState = .Initial
                dismiss()
            }

        }
    }

}

#Preview
{
    @Previewable
    @State  var appState : AppState = .Initial
    let schwabClient = SchwabClient( secrets: loadSecrets() )
    return SecretsView( schwabClient : schwabClient, appState : $appState )
}
