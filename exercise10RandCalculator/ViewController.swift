//
//  ViewController.swift
//  exercise10RandCalculator
//
//  Created by Diego Muñoz Herranz on 15/10/21.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - Outlets
	
	// Label
	@IBOutlet weak var resultLabel: UILabel!
	
	// Operadores
	@IBOutlet weak var operatorAddition: UIButton!
	@IBOutlet weak var operatorMultiplication: UIButton!
	@IBOutlet weak var operatorSubstraction: UIButton!
	@IBOutlet weak var operatorDivision: UIButton!
	
	
	// MARK: - Variables
	private var total: Int = 0
	private var randNumber: Int = 0
	private var resultString: String = ""
	
	// MARK: - Constantes
	private let kMaxLength = 9
	
	// Formate de valores auxiliares
	private let auxFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		let locale = Locale.current
		formatter.groupingSeparator = ""
		formatter.decimalSeparator = locale.decimalSeparator
		formatter.numberStyle = .decimal
		formatter.maximumIntegerDigits = 100
		formatter.minimumFractionDigits = 0
		formatter.maximumFractionDigits = 100
		return formatter
	}()
	
	// Formate de valores auxiliares
	private let auxTotalFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.groupingSeparator = ""
		formatter.decimalSeparator = ""
		formatter.numberStyle = .decimal
		formatter.maximumIntegerDigits = 100
		formatter.minimumFractionDigits = 0
		formatter.maximumFractionDigits = 100
		return formatter
	}()
	
	// Formateo de valores por pantalla por defeti
	private let printFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		let locale = Locale.current
		formatter.groupingSeparator = locale.groupingSeparator
		formatter.decimalSeparator = locale.decimalSeparator
		formatter.numberStyle = .decimal
		formatter.maximumIntegerDigits = 9
		formatter.minimumFractionDigits = 0
		formatter.maximumFractionDigits = 8
		return formatter
	}()
	
	// Formateo de valores por pantalla en formato científico
	private let printScientificFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .scientific
		formatter.maximumFractionDigits = 3
		formatter.exponentSymbol = "e"
		return formatter
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		operatorAddition.round()
		operatorMultiplication.round()
		operatorSubstraction.round()
		operatorDivision.round()
		
		total = randNumber(randNumber: randNumber)
		resultLabel.text = String(total)
	}
	
	/**
	 Función crea un número entero random
	 */
	private func randNumber(randNumber: Int) -> Int{
		let num = Int.random(in: 1..<1000)
		return num
	}
	
	@IBAction func additionAction(_ sender: Any) {
		total &+= randNumber(randNumber: randNumber)
		resultLabel.text = printNumber()
	}
	
	@IBAction func multiplicationAction(_ sender: Any) {
		total &*= randNumber(randNumber: randNumber)
		resultLabel.text = printNumber()
	}
	
	@IBAction func substractionAction(_ sender: Any) {
		total &-= randNumber(randNumber: randNumber)
		resultLabel.text = printNumber()
	}
	
	@IBAction func divisionAction(_ sender: Any) {
		total &= total / randNumber(randNumber: randNumber)
		resultLabel.text = printNumber()
	}
	
	private func printNumber() -> String{
		// Formateo en pantalla
		if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > kMaxLength{
			resultString = printScientificFormatter.string(from: NSNumber(value: total))!
		} else{
			resultString = printFormatter.string(from: NSNumber(value: total))!
		}
		
		return resultString
	}
}

