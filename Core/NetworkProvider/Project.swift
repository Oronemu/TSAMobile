//
//  Project.swift
//  Dependencies
//
//  Created by Максим Ермолаев on 30.11.2022.
//

import ProjectDescription

let projectName = "NetworkProvider"
let moduleBaseId = "com.rovkov.\(projectName)"
let target = DeploymentTarget.iOS(targetVersion: "17.0", devices: device)
let device = DeploymentDevice.iphone

let project = Project(
    name: projectName,
    targets: [
        Target(name: projectName,
               platform: .iOS,
               product: .framework,
               bundleId: moduleBaseId,
               deploymentTarget: target,
               sources: ["Source/**"],
               dependencies: [/*.project(target: "Common", path: .relativeToRoot("Core/Common"))*/],
               settings: configSettings())
    ]
)

func configSettings() -> Settings {
    let configDebug = Configuration.debug(name: "Debug", settings: ["OTHER_LDFLAGS[arch=*]": "-ObjC"])
    let configRelease = Configuration.release(name: "Release", settings: ["OTHER_LDFLAGS[arch=*]": "-ObjC"])
    return Settings.settings(configurations: [configDebug, configRelease])
}
