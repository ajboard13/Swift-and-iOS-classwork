#!/usr/bin/env xcrun swift

import Foundation

class execution{

class func execute(path: String, arguments: [String]? = nil) -> Int {
    let task = Process()
    task.launchPath = path
        if arguments != nil {
            task.arguments = arguments!
        }
    task.launch()
    task.waitUntilExit()
    return Int(task.terminationStatus)
    }
}

var status : Int = 0

status = execution.execute(path: "/bin/ls")


print("Status: \(status)")

status = execution.execute(path: "/bin/ls", arguments: ["/"])
print("Status: \(status)")
