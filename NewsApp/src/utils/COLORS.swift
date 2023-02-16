//
//  COLORS.swift
//  NewsApp
//
//  Created by Александр Фатеев on 16.02.2023.
//

import SwiftUI

let PrimaryColor = getColor(hexColor: "#0E4C70")
let TextNoteColor = Color.gray
func getColor(hexColor: String? = "#CAD454") -> Color? {
    let color = Color(hex: hexColor!)
    return color ?? .black
}

extension Color {
    init?(hex: String) {
        var localHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        localHex = localHex.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let len = localHex.count

        guard Scanner(string: localHex).scanHexInt64(&rgb) else {
            return nil
        }

        if len == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if len == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, opacity: a)
    }
}
