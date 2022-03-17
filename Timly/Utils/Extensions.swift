//
//  Extensions.swift
//  Timly
//
//  Created by David Ohayon Jr. on 14/03/2022.
//

import Foundation
import SwiftUI

//MARK: - roundDouble() method extension on type Double

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

//MARK: - CornerRadius Extension on View

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

//MARK: - RoundedCorner struct of type Shape

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
