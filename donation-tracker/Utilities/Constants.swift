//
//  Constants.swift
//  donation-tracker
//
//  Created by An Tran on 11/21/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let TO_WELCOME_SCREEN = "ToWelcomeScreen"
let FROM_REGISTER_TO_LOGIN = "registerToLogin"
let FROM_LOGIN_TO_EMPLOYEE_DASHBOARD = "loginToEmployeeDashBoard"
let FROM_LOGIN_TO_USER_DASHBOARD = "loginToUserDashBoard"
let FROM_EMPLOYEE_DASHBOARD_TO_ADDITEM = "employeeDashBoardToAddItem"
let FROM_EMPLOYEE_DASHBOARD_TO_VIEWITEM = "employeeDashBoardToViewItem"


// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
let USER_TYPE = "userType"

// URL Constants
let BASE_URL = "http://localhost:3005/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_CREATE_USER = "\(BASE_URL)user/add"
let URL_GET_USER = "\(BASE_URL)user/byEmail/"
// header
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
