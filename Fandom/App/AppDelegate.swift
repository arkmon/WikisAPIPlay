//  AppDelegate.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	var appCoordinator: AppCoordinator?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		setUpDependencyInjection()
		setUpCoordinator()
		return true
	}
	
	func setUpDependencyInjection() {
		AppDIContainer.registries = [
			ConfigDIContainerRegistry.self,
			ListDIContainerRegistry.self,
			NetworkDIContainerRegistry.self
			]
		AppDIContainer.replaceContainer()
	}
	
	func applicationWillTerminate(_ application: UIApplication) {
		
	}
	
	func setUpCoordinator() {
		appCoordinator = AppCoordinator(with: self)
		appCoordinator?.start()
	}
	
	func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
		return true
	}
	
	func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
		return true
	}
}

extension AppDelegate: CoordinatorDelegate {
	
	func present(_ viewController: UIViewController) {
		window?.rootViewController = viewController
	}
	
	func dismiss(_ viewController: UIViewController) {
		if window?.rootViewController == viewController {
			window?.rootViewController = nil
		}
	}
}
