//
//  BagModel.swift
//  ShopLog
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 02/05/22.
//

import SwiftUI

struct BagModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var price: String
}

var bags = [
    BagModel(image: "bag1", title: "Bolsa azul", price: "R$234"),
    BagModel(image: "bag2", title: "Bolsa Marrom", price: "R$295"),
    BagModel(image: "bag3", title: "Bolsa de mão preta", price: "R$204"),
    BagModel(image: "bag4", title: "Old Fashion", price: "R$334"),
    BagModel(image: "bag5", title: "Bolsa Vermelha", price: "R$434"),
    BagModel(image: "bag6", title: "Notebook", price: "R$134"),
]

var scrollTabs = ["Bolsas", "Jóias", "Sapatos", "Beleza"]
