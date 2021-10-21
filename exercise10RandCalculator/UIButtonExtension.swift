//
//  UIButtonExtension.swift
//  exercise10RandCalculator
//
//  Created by Diego Muñoz Herranz on 15/10/21.
//

import Foundation
import UIKit

private let gray = UIColor(red: 51, green: 52, blue: 51, alpha: 1)

extension UIButton{
	// Borde redondo
	func round(){
		layer.cornerRadius = bounds.height / 2
		clipsToBounds = true
	}
}
