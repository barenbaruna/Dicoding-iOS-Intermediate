import Cocoa

var value = 5
let workItem = DispatchWorkItem {
    value += 5
}

workItem.perform()

let queue = DispatchQueue(label: "com.dicoding.dispatchworkitem", qos: .utility)
queue.async(execute: workItem)

workItem.notify(queue: DispatchQueue.main) {
    print("Final values: \(value)")
}
