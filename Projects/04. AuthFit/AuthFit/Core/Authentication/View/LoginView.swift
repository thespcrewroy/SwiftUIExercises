//
//  LoginView.swift
//  AuthFit
//
//  Resposible for:
//  * Displaying the login form for the user to sign in
//  * Validating the form
//  * Making network calls to sign the user in with the provided credentials
//  * Send updates to myView to present the correct view when sign in goes through successfully
//  * Handle errors if user tries to sign in with an invalid email
//  * Update the UI
//
//  Created by Swapnil Roy on 3/11/24.
//

import SwiftUI

/// A view that represents the login screen.
struct LoginView: View {
    
    /**
     A view for the login screen. This view allows the user to enter their 
     email and password for authentication. This view requires an instance of 
     `AuthViewModel` to be injected as an environment object.
     */
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel // casts an AuthViewModel instance
    
    /**
     The login view of the authentication feature. This view displays a form 
     for users to enter their email address and password to sign in. It also 
     provides a sign-up button for users who do not have an account yet.
     */
    var body: some View {
        NavigationStack {
            VStack {
                // Image
                Image("authfit-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)
                
                // Form Fields
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    
                    // Emails should have no capitalization
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter password",
                              isSecureField: true)
                } // VStack
                .padding(.horizontal)
                .padding(.top, 12)
                
                /**
                 This code represents the sign-in button in the LoginView. 
                 When tapped, it triggers the signIn() method of the viewModel 
                 using the provided email and password. The button is styled 
                 with a blue background color, disabled if the form is not valid, 
                 and has a corner radius of 10.0. It is positioned at the top of 
                 the view with a padding of 24.
                 */
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email,
                                                   password: password)
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }  // HStack
                    // width of screen - 32, height: 42
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 42)
                } // Button
                .background(Color(.systemBlue))
                .disabled(!formIsValid) // implemeent form validation
                .opacity(formIsValid ? 1.0 : 0.5) // if form is not valid, make it faded
                .cornerRadius(10.0)
                .padding(.top, 24)
                
                Spacer()
                
                // Sign-Up Button
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an acount?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    } // HStack
                    .font(.system(size: 14))
                } // NavigationLink
            } // VStack
        } // NaviagationStack
    } // body
} // LoginView

/**
 A view representing the login form for authentication.

 This extension conforms to the `AuthenticationFormProtocol` protocol and 
 provides an implementation for the `formIsValid` property. The 
 `formIsValid` property is a computed property that returns a boolean 
 value indicating whether the login form is valid or not. This extension is 
 specific to the `LoginView` class. The form is considered valid if the 
 following conditions are met:
 - The `email` field is not empty.
 - The `email` field contains an '@' symbol.
 - The `password` field is not empty.
 - The `password` field has a length greater than 5 characters.
 */
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty // email field should not be empty
        && email.contains("@") // email field should have an '@'
        && !password.isEmpty // password field should not be empty
        && password.count > 5 // password should be greater than 5 characters
    } // formIsValid
} // extension


#Preview {
    LoginView()
} // Preview
