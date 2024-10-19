//
//  ViewController.swift
//  Clima
//
//  Created by murad on 18.10.2024.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: - Properties
    
    private let weatherView = WeatherView()

    //MARK: - Life cycle
    
    override func loadView() {
        view = weatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

