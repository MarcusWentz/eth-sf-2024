// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

// Unsigned
import { UD60x18 , convert } from "@prb/math/src/UD60x18.sol"; 

contract curveTest {

  function expTest() external pure returns (uint256 result) {
    UD60x18 x = convert(1);
    UD60x18 expRawValue = x.exp(); 
    result = expRawValue.unwrap();
  }

  function testEmulateFunction12() external pure returns (uint256 result) {
    UD60x18 x = convert(1.0 ether);
    UD60x18 y = convert(0.4 ether);
    UD60x18 subtractValue = x - y; 
    UD60x18 lnRawValue = subtractValue.ln(); 
    UD60x18 divValue = convert(1);
    UD60x18 divideByVarN = lnRawValue.div(divValue); 
    UD60x18 expRawValue = divideByVarN.exp(); 
    result = expRawValue.unwrap();
  }

  /// @notice Calculates the square root for the given signed number.
  function unsignedSquareRootTestSmallValueReturnRawValue() external pure returns (UD60x18 result) {
    // 1 wei in uint256 is actually 1 ether in UD60x18 fixed point types.
   
    // // 9 decimal places in precision.
    // UD60x18 x = UD60x18.wrap(1);
   
    // 18 decimal places in precision.
    UD60x18 x = convert(1);
    // Returns 1000000000, since: 
    // 1 ether = 10**18 = (10**9)**2
    result = x.sqrt(); 
  }

  /// @notice Calculates the square root for the given signed number.
  function unsignedSquareRootTestReturnUint256() external pure returns (uint256 result) {

    // // 9 decimal places in precision.
    // UD60x18 x = UD60x18.wrap(1);
   
    // 18 decimal places in precision.
    UD60x18 x = convert(1);

    // Returns 1000000000, since: 
    // 1 ether = 10**18 = (10**9)**2
    UD60x18 sqrtRawValue = x.sqrt(); 
    result = sqrtRawValue.unwrap();
  }

  /// @notice Calculates the square root for the given signed number.
  // Try with x = 1000000000000000000 to get matching results with other functions.
  function unsignedSquareRoot(UD60x18 x) external pure returns (UD60x18 result) {
    // Will show another 9 decimal places if you unwrapped the values as a uint256.
    result = x.sqrt();
  }

}