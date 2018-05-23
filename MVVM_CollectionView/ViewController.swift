//
//  ViewController.swift
//  MVVM_CollectionView
//
//  Created by Bartlomiej Bocian on 23.05.2018.
//  Copyright © 2018 Bartlomiej Bocian. All rights reserved.
//

import UIKit
import SwiftIcons
import RxSwift
import RxCocoa

class ViewController: UIViewController {
	
	@IBOutlet weak var photoCollectionView: UICollectionView!
	@IBOutlet weak var addButton: UIButton!
	@IBOutlet weak var removeAllButton: UIButton!
	
	private let disposeBag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		 setUpViews()
	}
	
	func setUpViews () {
		addButton.setIcon(icon: .googleMaterialDesign(.addCircleOutline), iconSize: 45, forState: .normal)
		removeAllButton.setIcon(icon: .googleMaterialDesign(.delete), iconSize: 45, forState: .normal)
	}
	
	func setUpRx () {
		
	}
	
	private func bindSourceData() {
		https://stackoverflow.com/questions/50480224/rxswift-generic-parameter-self-could-not-be-inferred
		let countryArray = ["Bangladesh", "India", "Pakistan", "Nepal", "Bhutan", "China", "Malaysia", "Myanmar", "Sri Lanka", "Saudi Arabia"]
		let data = Observable.of(countryArray)
		
		data.bind(to: photoCollectionView.rx.items(cellIdentifier: "photoCell")) { index, model, cell in
			cell.titleLabel.text = model
		}
		.disposed(by: disposeBag)
	}
	
}
