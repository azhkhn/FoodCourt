//
//  Constants.swift
//  Food Aggregator
//
//  Created by Chashmeet on 13/11/18.
//  Copyright © 2018 Chashmeet Singh. All rights reserved.
//

import UIKit

extension Client {
    
    struct ResponseMessages {
        static let InvalidParams = "Email ID / Password incorrect"
        static let ServerError = "Problem connecting to server!"
        static let SignedOut = "Successfully logged out"
        static let PasswordInvalid = "Password chosen is invalid."
    }
    
    struct APIURL {
        static let IPAddress = "http://167.99.179.118:8081"
    }
    
    struct Methods {
        static let Login = "/signIn"
        static let FoodCourts = "/getFoodCourtByCity"
        static let FoodMenu = "/FoodMenu"
        static let PlaceOrder = "/user/placeOrder"
        static let Logout = "/user/logout"
        static let GetOrders = "/user/getOrdersForUser"
        static let UpdateProfile = "/user/updateProfile"
        static let Register = "/register"
        static let UpdateOrder = "/user/updateOrderStatus"
    }
    
    struct Keys {
        static let Email = "email"
        static let Password = "password"
        static let Status = "status"
        static let Token = "token"
        static let Message = "message"
        static let Name = "name"
        static let FCList = "fcList"
        static let Id = "id"
        static let FoodCourtName = "foodCourtName"
        static let Address = "address"
        static let City = "city"
        static let OpenTime = "open_time"
        static let CloseTime = "close_time"
        static let Restaurants = "restaurants"
        static let IconName = "iconName"
        static let FCID = "fc_id"
        static let RestaurantName = "restaurantName"
        static let ItemList = "ItemList"
        static let Category = "category"
        static let Cost = "cost"
        static let FoodCourtId = "foodCourtId"
        static let RestaurantId = "restaurant_id"
        static let TimeToPrepareInMinutes = "timeToPrepareInMinutes"
        static let OrderDetails = "orderDetails"
        static let FirstName = "first_name"
        static let LastName = "last_name"
        static let PhoneNumber = "phone_number"
        static let EmailID = "email_id"
        static let FoodItemIds = "foodItemIds"
        static let Quantity = "quantity"
        static let CustomerOrder = "customerOrder"
        static let OrderTime = "orderTime"
        static let UserId = "userId"
        static let Username = "userName"
        static let TotalCost = "totalCost"
        static let OrderStatus = "orderStatus"
        static let PreparationTime = "prepTime"
        static let OrderId = "orderId"
        static let ItemCost = "itemCost"
        static let OrderItemList = "orderItemList"
        static let OrderList = "OrderList"
        static let UserRole = "user_role"
        static let Active = "ACTIVE"
        static let Completed = "COMPLETED"
        static let PhoneNum = "PhoneNum"
        static let Phone_Number = "phoneNumber"
        static let Customerorder = "customer order"
        static let First_Name = "firstName"
        static let Last_Name = "lastName"
        static let RestaurantID = "restaurantId"
    }
    
    struct Colors {
        static let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
    }
    
}
