// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.26 and less than 0.9.0
pragma solidity ^0.8.26;

contract Trans {
    bool transient x;
    function store() public returns(bool res){
    assembly{
    tstore(x.slot,true,)
    res:=tload(x.slot)
 }
}

}



Contract Caller{
Trans t;

function getTrans() external {
//encode data for call
bytes memory data = abi.encodeWithSignature("store()");
//want to call the contract that sets transient storage 

t.call(data);
}

}
