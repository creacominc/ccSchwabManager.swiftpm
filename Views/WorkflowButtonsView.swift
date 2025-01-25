//
//  WorkflowButtonsView.swift
//  ccSchwabManager
//
//  Created by Harold Tomlinson on 2025-01-05.
//

import SwiftUI

struct WorkflowButtonsView: View
{
    @State private var selectedWorkflow: String = ""
    var body: some View
    {
        VStack
        {
            let pickerValues : [String] = WorkflowEnum.allCases.map(\.rawValue)
            Picker( "", selection: $selectedWorkflow )
            {
                ForEach(pickerValues, id: \.self) 
                { value in
                    Text( value )
                        .tag( value )
                        .padding()
                }
            }
            .pickerStyle( .segmented )
            .onAppear { selectedWorkflow = WorkflowEnum.allCases.first?.rawValue ?? "Sell" }
        } // VStack
    }
}

//#Preview
//{
//
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: Account.self, configurations: config)
//
//    for i in 1..<5 {
//        let account = Account( accountNumber: "10\(i)" )
//        container.mainContext.insert( account )
//    }
//
//    return WorkflowButtonsView()
//        .modelContainer(container)
//
//}
//
