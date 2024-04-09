//
//  Project.swift
//  Dependencies
//
//  Created by Максим Ермолаев on 30.11.2022.
//

import ProjectDescription

let projectName = "Profile"
let moduleBaseId = "com.rovkov.\(projectName)"
let target = DeploymentTarget.iOS(targetVersion: "17.0", devices: device)
let device = DeploymentDevice.iphone

let project = Project(
    name: projectName,
    targets: [
        Target(name: projectName,
               platform: .iOS,
               product: .staticFramework,
               bundleId: moduleBaseId,
               deploymentTarget: target,
               sources: ["Source/**"],
               dependencies: [.project(target: "Platform", path: .relativeToRoot("Core/Platform"))]),
    ]
)
