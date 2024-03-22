//
//  ConnectTestView.swift
//  Loch
//
//  Created by Phoenix Liu on 22/3/2024.
//

import SwiftUI
import CoreBluetooth

class ManagerDelegate: NSObject, CBCentralManagerDelegate, ObservableObject {
    //@State private var peripherals = []
    @Published var managerOn = "false"
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            managerOn = "true"
        }
    }
}

//class ManagerState: CBManagerState {
//    
//}
//    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral) {
//        self.peripherals.append(peripheral.name ?? "No peripheral found")
//    }

//    @Published var peripheralNames = []
//    override init()  {
//        super.init()
//        self.manager = CBCentralManager()
//    }

struct ConnectTestView: View {
//    private var managerDelegate: CBCentralManagerDelegate = CBCentralManagerDelegate()
    @State private var peripheral: CBPeripheral?
    @State private var managerOn = false
    private var manager = CBCentralManager()
    private var delegate = ManagerDelegate()
    
    
    var body: some View {
        
//        ForEach(peripherals { peripheral in
        Text("The manager is scanning: \(delegate.managerOn)")
            .foregroundStyle(.gray)
        Text(peripheral?.name ?? "unnamed")
            .foregroundStyle(.gray)
        Divider()
        Text("Peripherals")
            .task {
                delegate.centralManagerDidUpdateState(manager)
                manager.scanForPeripherals(
                    withServices: []
                )
                for peripheral in manager.retrievePeripherals(withIdentifiers: []) {
                    self.peripheral = peripheral
                    print("next")
                }
                
//                delegate.centralManagerDidUpdateState(manager)
                
                
            }
    }
}

//extension CBPeripheral: Identifiable {
//    public var id: String
//}
#Preview {
    ConnectTestView()
}
