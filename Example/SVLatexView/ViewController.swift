//
//  ViewController.swift
//  SVLatexView
//
//  Created by Mazorati on 07/11/2019.
//  Copyright (c) 2019 Mazorati. All rights reserved.
//

import UIKit
import SVLatexView
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    lazy var latexView: SVLatexView = {
        let v = SVLatexView(frame: CGRect.zero, using: SVLatexView.Engine.MathJax, contentWidth: 300)
        //v.backgroundColor = .
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.gray.cgColor
        v.customCSS = ".formula-wrap {line-height: 24px;}"
        //v.isHidden = true
        return v
    }()
  
  func latex_factory() -> SVLatexView {
    let v = SVLatexView(frame: CGRect.zero, using: SVLatexView.Engine.MathJax)
    //v.backgroundColor = .
    v.translatesAutoresizingMaskIntoConstraints = false
    v.layer.borderWidth = 1
    v.layer.borderColor = UIColor.gray.cgColor
    v.customCSS = ".formula-wrap {line-height: 24px;}"
    //v.isHidden = true
    return v
  }
  
  func load_content(file_name: String) -> String {
    let path = Bundle.main.path(forResource: file_name, ofType: nil)!
    return try! String(contentsOfFile: path)
  }
    
    lazy var button: UIButton = {
        let v = UIButton(type: UIButtonType.system)
        v.frame = CGRect(x: 30, y: 400, width: 140, height: 20)
        v.setTitle("Change contents", for: UIControlState.normal)
        return v
    }()
    
//    lazy var latexViewHeight: NSLayoutConstraint = {
//        return latexView.heightAnchor.constraint(equalToConstant: 70)
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
      let latex_1 = latex_factory()
      let latex_2 = latex_factory()
      let latex_3 = latex_factory()
      let latex_4 = latex_factory()
      let latex_5 = latex_factory()
      
      let stack = UIStackView(arrangedSubviews: [latex_1, latex_2, latex_3, latex_4, latex_5])
      stack.axis = .vertical
      stack.distribution = .fill
      stack.alignment = .fill
      
      view.addSubview(stack)
      stack.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
        stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
//        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -2),
        stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
      ])
      
      latex_1.loadLatexString(latexString: load_content(file_name: "formula.txt"))
      latex_2.loadLatexString(latexString: load_content(file_name: "formula2.txt"))
      latex_3.loadLatexString(latexString: load_content(file_name: "formula3.txt"))
      latex_4.loadLatexString(latexString: load_content(file_name: "formula4.txt"))
      latex_5.loadLatexString(latexString: load_content(file_name: "formula5.txt"))
        
//        view.addSubview(latexView)
//
//        NSLayoutConstraint.activate([
//            latexView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
//            //latexView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
//            latexView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
//            //latexViewHeight
//            ])
//
//        view.addSubview(button)
//
//        let path = Bundle.main.path(forResource: "formula5", ofType: "txt")!
//        let f = try! String(contentsOfFile: path)
//
//        latexView.loadLatexString(latexString: f)
//
//        button.rx.tap
//            .subscribe(onNext: { [weak self] _ in
//                self?.latexView.loadLatexString(latexString: "Small string should resize view")
//            })
//            .disposed(by: disposeBag)
        
//        latexView.scrollView.rx
//            .observe(CGSize.self, "contentSize")
//            .map {
//                $0?.height
//            }
//            .subscribe { [weak self] e in
//                if let eh = e.element, let h = eh {
//                    if h > 10.0 {
//                        self?.latexViewHeight.constant = h
//                    }
//                }
//
//            }
//            .disposed(by: disposeBag)
    }

}

