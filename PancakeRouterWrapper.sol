pragma solidity ^0.6.0;

import "./IPancakeRouter02.sol";

contract PancakeRouterWrapper {
    // Modyfikator sprawdzający, czy funkcja została wywołana w bloku o numerze podanym w "expectedBlockNumber"
    modifier onlyInBlock(uint expectedBlockNumber) {
        require(block.number == expectedBlockNumber, "Function must be called in correct block");
        _;
    }

    // Pole przechowujące adres kontraktu PancakeRouter implementującego interfejs IPancakeRouter02
    IPancakeRouter02 private pancakeRouter;

    // Konstruktor kontraktu PancakeRouterWrapper
    constructor(address pancakeRouterAddress) public {
        pancakeRouter = IPancakeRouter02(pancakeRouterAddress);
    }

    // Funkcja wywołująca funkcję swapExactTokensForTokens z kontraktu PancakeRouter
    function callSwapExactTokensForTokens(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline, uint expectedBlockNumber) 
    onlyInBlock(expectedBlockNumber) public returns (uint[] memory amounts){
        // Wywołanie funkcji swapExactTokensForTokens z kontraktu PancakeRouter
        return pancakeRouter.swapExactTokensForTokens(amountIn, amountOutMin, path, to, deadline);
    }
    

    function callSwapTokensForExactTokens( uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline, uint expectedBlockNumber) 
    onlyInBlock(expectedBlockNumber) public returns (uint[] memory amounts){
        // Wywołanie funkcji swapTokensForExactTokens z kontraktu PancakeRouter
        return pancakeRouter.swapTokensForExactTokens(amountOut, amountInMax, path, to, deadline);
    }

    function callSwapExactETHForTokens( uint amountOutMin, address[] calldata path, address to, uint deadline, uint expectedBlockNumber)
    onlyInBlock(expectedBlockNumber) public payable returns (uint[] memory amounts){
        // Wywołanie funkcji swapExactETHForTokens z kontraktu PancakeRouter
        return pancakeRouter.swapExactETHForTokens(amountOutMin, path, to, deadline);
    }

    function callSwapTokensForExactETH( uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline, uint expectedBlockNumber) 
    onlyInBlock(expectedBlockNumber) public returns (uint[] memory amounts){
        // Wywołanie funkcji swapTokensForExactETH z kontraktu PancakeRouter
        return pancakeRouter.swapTokensForExactETH(amountOut, amountInMax, path, to, deadline);
    }

    function callSwapExactTokensForETH( uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline, uint expectedBlockNumber) 
    onlyInBlock(expectedBlockNumber) public returns (uint[] memory amounts){
        // Wywołanie funkcji swapExactTokensForETH z kontraktu PancakeRouter
        return pancakeRouter.swapExactTokensForETH(amountIn, amountOutMin, path, to, deadline);
    }

    function callSwapETHForExactTokens( uint amountOut, address[] calldata path, address to, uint deadline, uint expectedBlockNumber) 
    onlyInBlock(expectedBlockNumber) public payable returns (uint[] memory amounts){
        // Wywołanie funkcji swapETHForExactTokens z kontraktu PancakeRouter
        return pancakeRouter.swapETHForExactTokens(amountOut, path, to, deadline);
    }

    function callSwapExactTokensForTokensSupportingFeeOnTransferTokens( uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline, uint expectedBlockNumber)
    onlyInBlock(expectedBlockNumber) public{
        // Wywołanie funkcji swapExactTokensForTokensSupportingFeeOnTransferTokens z kontraktu PancakeRouter
        pancakeRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens( amountIn, amountOutMin, path, to, deadline);
    }

    function callSwapExactETHForTokensSupportingFeeOnTransferTokens( uint amountOutMin, address[] calldata path, address to, uint deadline, uint expectedBlockNumber) onlyInBlock(expectedBlockNumber) 
    public payable{
        // Wywołanie funkcji swapExactETHForTokensSupportingFeeOnTransferTokens z kontraktu PancakeRouter
        pancakeRouter.swapExactETHForTokensSupportingFeeOnTransferTokens( amountOutMin, path, to, deadline);
    }

    function callSwapExactTokensForETHSupportingFeeOnTransferTokens( uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline, uint expectedBlockNumber)
    onlyInBlock(expectedBlockNumber)public{
        // Wywołanie funkcji swapExactTokensForETHSupportingFeeOnTransferTokens z kontraktu PancakeRouter
        pancakeRouter.swapExactTokensForETHSupportingFeeOnTransferTokens( amountIn, amountOutMin, path, to, deadline);
    }
}