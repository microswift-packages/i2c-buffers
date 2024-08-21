import HAL
import i2c

public extension Twi where Twsr.RegisterType == UInt8 {
    static func readIntoBuffer<T:BinaryInteger>(buffer: UnsafeMutableBufferPointer<T>,
    fromAddress address: UInt8,
    startRegister: UInt8,
    timeout: UInt16) -> Bool {

        guard start(timeout: timeout) else { return false }

        guard write(byte: ((address&0x7f)<<1), timeout: timeout) else { return false }
        guard write(byte: startRegister, timeout: timeout) else { return false }

        defer { stop(timeout: timeout) }

        guard start(timeout: timeout) else { return false }

        guard write(byte: ((address&0x7f)<<1)+1, timeout: timeout) else { return false }

        for i in 0..<buffer.count {
            let lastValue = i == buffer.count - 1

            var value: T = 0
            let l = MemoryLayout<T>.size(ofValue: value)
            let success = withUnsafeMutableBytes(of: &value) { ptr in
                for j in 0..<l {
                    let ack = !lastValue || j < l - 1

                    guard let byte = read(sendAck: ack, timeout: timeout) else {
                        return false
                    }

                    ptr[j] = byte
                }
            
                return true
            }
        
            guard success else { return false }

            buffer[i] = value
        }
    
        return true
    }
}
