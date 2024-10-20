// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

// Unsigned
import { SD59x18 , convert } from "@prb/math/src/SD59x18.sol"; 

contract CurveTest {

  function testEmulateFunction12() external pure returns (int256 result) {
    // SD59x18 x = convert(1.0 ether);
    SD59x18 oneEther = convert(1 ether);
    SD59x18 twoEther = convert(2 ether);
    SD59x18 lnOfTwo = twoEther.ln();
    SD59x18 zeroEther = convert(1 ether - 1 ether);
    SD59x18 xExp = lnOfTwo.mul(zeroEther);
    SD59x18 x = (xExp.exp()*oneEther);

    // SD59x18 y = convert(0.4 ether);
    SD59x18 positiveFactor = convert(25);
    SD59x18 yLnPos = positiveFactor.ln();
    SD59x18 yLnNeg = convert(10).ln();
    SD59x18 yLnDeltaRaw = yLnPos - yLnNeg;
    SD59x18 yLnDeltaNegative = -yLnDeltaRaw;
    SD59x18 y = (yLnDeltaNegative.exp()*oneEther);

    // SD59x18 subtractValue = x - y; 
    SD59x18 lnRawValue = (x-y).ln(); 
    SD59x18 divideByVarN = lnRawValue.div(convert(1)); 
    SD59x18 expRawValue = divideByVarN.exp(); 
    
    // result = 1;
    result = expRawValue.unwrap() / (1 ether);


  }

  function testEmulateFunction12Raw() public pure returns (SD59x18 result) {
    SD59x18 x = convert(1.0 ether);
    SD59x18 y = convert(0.4 ether);
    SD59x18 subtractValue = x - y; 
    SD59x18 lnRawValue = subtractValue.ln(); 
    SD59x18 divValue = convert(1 ether);
    SD59x18 divideByVarN = lnRawValue.div(divValue); 
    SD59x18 expRawValue = divideByVarN.exp(); 
    result = expRawValue;
  }

  function testEmulateFunction13() external pure returns (int256 result) {
    SD59x18 Ry = convert(1.0 ether);
    SD59x18 oneEther = convert(1.0 ether);
    SD59x18 num = oneEther - testEmulateFunction12Raw();
    SD59x18 den = testEmulateFunction12Raw();
    SD59x18 ratio = num.div(den);
    SD59x18 delta = Ry - ratio;
    result = delta.unwrap();
  }

  function testEmulateFunction14() external pure returns (int256 result) {
    SD59x18 Rx = convert(1.0 ether);
    SD59x18 oneEther = convert(1.0 ether);
    SD59x18 num = oneEther - testEmulateFunction12Raw();
    SD59x18 den = testEmulateFunction12Raw();
    SD59x18 ratio = num.div(den);
    SD59x18 delta = ratio - Rx;
    result = delta.unwrap();
  }

  function debugValueY() external pure returns (int256 result) {
    SD59x18 oneEther = convert(1 ether);
    SD59x18 positiveFactor = convert(25);
    SD59x18 yLnPos = positiveFactor.ln();
    SD59x18 yLnNeg = convert(10).ln();
    SD59x18 yLnDelta = yLnPos - yLnNeg;
    SD59x18 y = (yLnDelta.exp()*oneEther);
    result = y.unwrap() / (1 ether);
  }

  function debugValueExp() external pure returns (int256 result) {
    SD59x18 x = convert(25);
    SD59x18 expRawValue = x.exp(); 
    result = expRawValue.unwrap();
  }

}