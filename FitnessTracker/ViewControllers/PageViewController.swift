//
//  PageViewController.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 4/23/20.
//  Copyright © 2020 V&M. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI



struct PageViewController: UIViewControllerRepresentable {
    
     var controllers: [UIViewController]
     var currentPage = 0
    
    // Conforms to UIViewControllerRepresentable protocal
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        
        //Creates a pageviewController with properties below
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        //Sets the dataSource to the coordinator created below
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        //Sets the background for each Controller
        controllers.forEach({$0.view.backgroundColor = .white })
        pageViewController.view.backgroundColor = UIColor(named: "bgColor")
        
        
        return pageViewController
        
        
    }
    
    func makeCoordinator() -> PageViewController.Coordinator {
           Coordinator(self)
       }
    
    
    //Confirms to UIViewControllerRepresentable protocal
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        
        //Updates the page Controller to show the correct page after scorolling
        pageViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true)
        
    }
    
    //Creates a Coordinator to handle datasource and delegat conformance

    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        //refrences parent PageViewController
        var parent: PageViewController
        
        init(_ controller: PageViewController) {
            self.parent = controller
        }
        
        
        //Implements pageViewController  for getting the previouse page if the user swips back
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            //stores the current page in index by finding the first instance of viewController
            guard let index  = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            //index = 0 implies there are no previous pages
            if index == 0 {
                return nil
            }
            return parent.controllers[index - 1]
        }
        
        //Implement pageViewController  for getting the previouse page if the user swips forward
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index  = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == parent.controllers.count - 1{
                return nil
            }
                      
            return parent.controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
                
                //creates a viewController that is equal to first view
                let visibleViewController = pageViewController.viewControllers?.first,
                
                //get the index of that view
                let index = parent.controllers.firstIndex(of: visibleViewController) {
                // make this cleaner by setting the current page to 0 then increasing it at the right spots
                parent.currentPage = index
            }
        }
    }

}

struct PageViewController_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
