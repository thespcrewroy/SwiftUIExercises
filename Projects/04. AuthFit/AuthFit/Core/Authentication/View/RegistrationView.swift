//
//  RegistrationView.swift
//  AuthFit
//
//  Responsible for:
//  * Displaying the registration form for the user to create a new account
//  * Validating the form
//  * Making network calls to sign the user in with the provided credentials
//  * Send updates to myView to present the correct view when sign in goes through successfully
//  * Handle errors if user tries to sign in with an invalid email
//  * Update the UI
//
//  Created by Swapnil Roy on 3/13/24.
//

import SwiftUI


/// A view that displays the registration form for the user.
struct RegistrationView: View {
    
    /**
     This view contains the necessary state variables for user registration:
     * @State email
     * @State full name
     * @State password
     * @State confirm password
     
     It also includes environment variables for dismissing the view 
     and accessing the `AuthViewModel` instance.
     * @Environment (\.dismiss) var dismiss
     * @EnvironmentObject var viewModel: AuthViewModel

     - Note: This view assumes the existence of an `AuthViewModel` instance in the environment.

     - Warning: The `password` and `confirmPassword` states should be properly validated 
     before proceeding with registration.
     */
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel // casts an AuthViewModel instance
    
    /**
     This is the registration view for the authentication process.
     
     The view contains form fields for email address, full name, password, and confirm password.
     It also includes a sign-up button and a button to navigate to the sign-in view.
     
     - Parameters:
         - email: The email address entered by the user.
         - fullName: The full name entered by the user.
         - password: The password entered by the user.
         - confirmPassword: The confirmation password entered by the user.
         - formIsValid: A boolean value indicating whether the form is valid or not.
         - viewModel: An instance of the AuthViewModel class.
     
     - Returns: A SwiftUI view representing the registration screen.
     */
    var body: some View {
        VStack {
            /**
             This code represents the registration view of the authentication feature 
             in the AuthFit app. It contains a form with several input fields for 
             the user to enter their email address, full name, password, and c
             onfirm password. The email address field is not capitalized automatically.
             The confirm password field also includes a checkmark or xmark icon 
             depending on whether the password and confirm password match.
             
             - Parameters:
                 - email: A binding to the email address entered by the user.
                 - fullName: A binding to the full name entered by the user.
                 - password: A binding to the password entered by the user.
                 - confirmPassword: A binding to the confirm password entered by the user.
             
             - Returns: A VStack containing the input fields for the registration form.
             */
            VStack(spacing: 24) {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(.none) // no capitalization
                
                InputView(text: $fullName,
                          title: "Full Name",
                          placeholder: "enter your name")
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter password",
                          isSecureField: true)
                
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "confirm your password",
                              isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        } // if confirm password correct, display checkmark, else display xmark
                    } // if both password and confirm password fields have texr
                } // ZStack
            } // VStack
            .padding(.horizontal)
            .padding(.top, 12)
            
            /**
             This code represents the sign-up button in the RegistrationView. 
             When the button is tapped, it calls the createUser method from the 
             AuthViewModel asynchronously using the Task API. The createUser method 
             is responsible for creating a new user with the provided email, password, 
             and full name. The button is styled with a text label "SIGN UP" and 
             an arrow icon. It has a blue background color and is disabled if 
             the form is not valid. The opacity of the button is adjusted based on t
             he validity of the form, with a faded appearance if the form is not valid. 
             The button has a corner radius of 10.0 and is positioned with a top padding of 24.

             - Parameters:
                 - email: The email address entered by the user.
                 - password: The password entered by the user.
                 - fullName: The full name entered by the user.
                 - formIsValid: A boolean value indicating whether the form is valid or not.
             */
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email,
                                                   password: password,
                                                   fullName: fullName)
                } // calls createUser method from AuthViewModel
            } label: {
                HStack {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                } // HStack
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
            
            /**
             A button that allows the user to dismiss the current view and 
             navigate to the sign-in screen.
             */
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            } // Button
        } // VStack
    } // body
} // RegistrationView

/**
 A view that represents the registration form for authentication.
 
 This view conforms to the `AuthenticationFormProtocol` protocol and 
 provides an implementation for the `formIsValid` property. The `formIsValid` 
 property returns `true` if the registration form is valid, otherwise `false`.
 
 The registration form is considered valid if the following conditions are met:
 - The email field is not empty.
 - The email field contains an '@' symbol.
 - The password field is not empty.
 - The password field has more than 5 characters.
 - The confirm password field matches the password field.
 - The full name field is not empty.
 */
// MARK: - AuthenticationFormProtocol
extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty // email field should not be empty
        && email.contains("@") // email field should have an '@'
        && !password.isEmpty // password field should not be empty
        && password.count > 5 // password should be greater than 5 characters
        && confirmPassword == password // confirm password and password should match
        && !fullName.isEmpty // full name field should not be empty
    } // formIsValid
} // RegistrationView

#Preview {
    RegistrationView()
} // Preview
