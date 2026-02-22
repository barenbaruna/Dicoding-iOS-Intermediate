// MARK: Completion Block (Callback) untuk menghubungkan satu thread ke lainnya (thread dependency)
// Merupakan sebuah Closure, yang artinya harus mengirimkan sebuah fungsi (function) sebagai parameter


/*
 Non-escaping closure → selesai dijalankan sebelum fungsi keluar.

 Escaping closure → bisa dipanggil setelah fungsi keluar (misalnya karena dijalankan di background thread atau disimpan untuk nanti).
 
*/

import Cocoa

func expensiveTask(data: String, completion: @escaping (String) -> Void) {
    let queue = DispatchQueue(label: "com.dicoding.completionblock")
    
    queue.async {
        print("Processing: \(data)")
        sleep(2) //Imitate expensive task
        completion("Processing \(data) finished")
    }
}

let mainQueue = DispatchQueue(label: "com.dicoding.main", qos: .userInteractive)
mainQueue.async {
    expensiveTask(data: "Get user") { result in print(result)}
    
    print("Main Queue Run")
}

// MARK: Implementasi Delegation
protocol TaskDelegate {
    func taskFinished(result: String)
}

struct Task {
    var delegate: TaskDelegate?
    
    func expensiveTask(data: String) {
        let queue = DispatchQueue(label: "com.dicoding.completionblock")
        
        queue.async {
            print("Processing: \(data)")
            sleep(2)
            
            self.delegate?.taskFinished(result: "Processing \(data) finished")
        }
    }
}


struct Main: TaskDelegate {
    func run() {
        let mainQueue = DispatchQueue(label: "com.dicoding.main", qos: .userInteractive)
        
        mainQueue.async {
            var task = Task()
            task.delegate = self
            task.expensiveTask(data: "Get User")
            print("Main Queue Run")
        }
    }
    
    func taskFinished(result: String) {
        print(result)
    }
}



let main = Main()
main.run()
