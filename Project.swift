import ProjectDescription

let configProjectDebug = Configuration.debug(name: "Debug", xcconfig: .relativeToRoot("Config/GigaChat.xcconfig"))
let configProjectRelease = Configuration.release(name: "Release", xcconfig: .relativeToRoot("Config/GigaChat.xcconfig"))
let settingsProject = Settings.settings(configurations: [configProjectDebug, configProjectRelease])

let device = DeploymentDevice.iphone
let target = DeploymentTarget.iOS(targetVersion: "17.0", devices: device)

let project = Project(
    name: "TSA",
    settings: settingsProject,
    targets: [Target(
      name: "TSA",
      platform: .iOS,
      product: .app,
      bundleId: "com.rovkov.GigaChat",
      deploymentTarget: target,
      infoPlist: "GigaChat-Info.plist",
      sources: ["GigaChat/Sources/**"],
      resources: ["GigaChat/Resources/**"],
      dependencies: [
        .project(target: "Platform", path: .relativeToRoot("Core/Platform")),
        .project(target: "Auth", path: .relativeToRoot("Features/Auth")),
        .project(target: "Profile", path: .relativeToRoot("Features/Profile")),
      ]
//      settings: configSettings()
    )]
)

func configSettings() -> Settings {
    let configDebug = Configuration.debug(name: "Debug", settings: ["CODE_SIGN_IDENTITY": "iPhone Developer"], xcconfig: "GigaChat.xcconfig")
    let configRelease = Configuration.release(name: "Release", settings: ["CODE_SIGN_IDENTITY": "iPhone Distribution"], xcconfig: "GigaChat.xcconfig")
    return Settings.settings(configurations: [configDebug, configRelease])
}
