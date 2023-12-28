//
//  ManageOrganizationView.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 22/12/2566 BE.
//

import SwiftUI
import Foundation

struct ManageOrganizationView: View {
    @Environment(\.openURL) var openURL
    @State private var name: String = "KMUTT"
    @State private var organization: Organization? = nil
    @State private var user: User? = nil
    @Binding var shouldPopToRootView: Bool
    @State private var isPresentingAlert: Bool = false
    @State private var isPresentingAlertUpgrade: Bool = false
    @State private var isPresentingLeaveOrgConfirm: Bool = false
    
    @StateObject var viewModel: ManageOrganizationViewModel = ManageOrganizationViewModel()
    
    var body: some View {
        
        Form {
            Section(header: Text("Your plan")) {
                LabeledContent("Subscription", value: "\(organization?.plan?.title ?? "ERROR")")
                
                if user?.role?.name == "administrator" {
                    Button(action: {
                        self.isPresentingAlertUpgrade = true
                    }, label: {
                        Text("Upgrade to Premium Plan").foregroundColor(.blue)
                    })
                }
            }
            
            Section(header: Text("Details")) {
                
                if organization != nil {
                    LabeledContent("Total employees", value: "\(organization!.employeeCount ?? 0) / \( organization!.plan!.limitEmployee)")
                    LabeledContent("Total customers", value: "\(organization!.contactCount ?? 0) / \( organization!.plan!.limitContact)")
                } else {
                    LabeledContent("Total employees", value: "0 / 0")
                    LabeledContent("Total customers", value: "0 / 0")
                }
            }
            
            Section(header: Text("Account")) {
                Button(action: {
                    isPresentingLeaveOrgConfirm = true
                }, label: {
                    Text("Leave an organization").foregroundColor(.red)
                })
            }
        }
        .navigationTitle("Manage an organization")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            bindViewModel()
            self.user = viewModel.getCurrentUser()
            Task {
                try await viewModel.fetch()
            }
        }
        .confirmationDialog("Are you sure?",
                            isPresented: $isPresentingLeaveOrgConfirm) {
            Button("Leave an organization ?", role: .destructive) {
                viewModel.leaveOrganization()
            }
        }
        .alert("To leave an organization successfully, the application will close in 3 seconds",
            isPresented: $isPresentingAlert) {
          }
        .alert("Please contact customer services to upgrade your plan.",
            isPresented: $isPresentingAlertUpgrade) {
          }
    }
    
    func bindViewModel() {
        viewModel.organization.bind {
            organization in
            if organization != nil {
                self.organization = organization
            }
        }
        
        viewModel.signal.bind {
            signal in
            if signal?.command == "LEAVE_AN_ORGANIZATION_SUCCESS" {
                isPresentingAlert = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    exit(-1)
              }
            }
        }
    }
}

#Preview {
    ManageOrganizationView(shouldPopToRootView: .constant(false))
}
