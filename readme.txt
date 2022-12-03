PancakeRouterWrapper

This contract provides a wrapper for another contract that implements the IPancakeRouter02 interface. It exposes the PancakeRouter contract interfaces in a way that allows them to be called in a specific block.

The constructor takes the address of a PancakeRouter contract that implements the IPancakeRouter02 interface and assigns it to the private pancakeRouter field. The contract then defines a number of functions that call the appropriate IPancakeRouter02 interface functions. Each of these functions has an onlyInBlock modifier that checks whether the function is called in a block with the number specified in the expectedBlockNumber argument, and throws an error if it is not called in the correct block.

