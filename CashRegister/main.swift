//
//  main.swift
//  CashRegister
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import Foundation

let vine = Product(name: "vine", quantity: 4, price: 5000)
let oldVine = Product(name: "oldVine", quantity: 1, price: 25000)
let cheese = Product(name: "cheese", quantity: 2, price: 25000)
let pad = Product(name: "pad", quantity: 1, price: 4500)
let beer = Product(name: "beer", quantity: 1, price: 500)

var products = [Product]()
products.append(vine)
products.append(oldVine)
products.append(cheese)
products.append(pad)
products.append(beer)

let sut = Receipt(products: products)

sut.receiptOutput()
