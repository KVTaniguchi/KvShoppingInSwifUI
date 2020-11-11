//
//  SignIn.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 10/25/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import AuthenticationServices
import Foundation
import SwiftUI

// sign in with apple

class Authorize: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    var anchor: ASPresentationAnchor?
    
    var anchorProvider: ASAuthorizationControllerDelegate?
    
    func authButtonTapped() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        
        request.requestedScopes = [.email, .fullName]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        handleError(error)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            if let email = credential.email {
                saveEmail(email)
            }
            
            let userId = credential.user
            receiveUserId(userId)
        }
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        if let anchor = anchor {
            return anchor
        } else if let window = UIApplication.shared.windows.first {
            return window
        } else {
            return UIWindow()
        }
    }
    
    func saveEmail(_ email: String) {
        
    }
    
    func receiveUserId(_ userId: String) {
        
    }
    
    func handleError(_ error: Error) {
        
    }
}
