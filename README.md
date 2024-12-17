# i2c-buffers

This adds some buffer functions. In the first instance just a register read into buffer.

`static func readIntoBuffer<T:BinaryInteger>(buffer: UnsafeMutableBufferPointer<T>,
    fromAddress address: UInt8,
    startRegister: UInt8,
    timeout: UInt16) -> Bool`

The number of registers to read and the register type are inferred by the generic type parameter.

You specify the slave address of the device to read, and the startin register to read from.

Timeout is as in the standard i2c library.

Returns: true if all expected data was read.

Here is an example of use...

````
      guard let buffer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: 3) else { return false }

      guard readIntoBuffer(buffer: buffer,
       fromAddress: slaveAddress,
        startRegister: 0x01,
         timeout: 50_000) else {
             return false
      }
````

...this code reads 3 UInt8 bytes into the buffer you allocate from a slave, starting
at register 0x01. (So it will read registers 1, 2 and 3 in this case.)
