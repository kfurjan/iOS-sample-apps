//
//  LoginView.swift
//  MyPetApp
//
//  Created by itrainer006 on 29/09/2020.
//  Copyright © 2020 iTrainer. All rights reserved.
//

import SwiftUI

struct RoundedContainerTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(color: Color.black, radius: 4, x: 0, y: 2)
            )
    }
}

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    
    @State private var username = ""
    @State private var password = ""
    @State private var isAlertVisible = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .blur(radius: 3)
                .edgesIgnoringSafeArea([.top, .bottom])
            
            VStack {
                TextField("Enter username", text: $username)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedContainerTextFieldStyle())
                
                SecureField("Enter password", text: $password)
                    .textFieldStyle(RoundedContainerTextFieldStyle())
                
                Button(action: { self.checkCredentials() }) {
                    Text("Login")
                        .font(.title)
                }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .shadow(radius: 6)
                        )
            }
            .padding()
        }
        .alert(isPresented: $isAlertVisible) {
            Alert(title: Text("Incorrect credentials"))
        }
    }
    
    private func checkCredentials() {
        if username == "admin" && password == "admin" {
            isLoggedIn = true
        } else {
            isLoggedIn = false
            isAlertVisible = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: .constant(false))
    }
}
