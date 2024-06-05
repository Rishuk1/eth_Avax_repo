// SPDX-License-Identifier: MIT
// For this project, write a smart contract that implements the require(), assert() and revert() statements.pragma solidity ^0.8.0;
pragma solidity ^0.7.0;
contract funcAndErrors{
    // ok so we have to include the require(), assert() and revert() statements in the contract 
    //so what we can do is we can create a authentication smart contract
    // which will take email password and then you can give your number, if your email and password are correct. 
     string email="";
     string password="";
     int aNumber;
     function setEmail(string memory _uEmail) public {
        email =_uEmail;
 assert(keccak256(abi.encodePacked(email)) == keccak256(abi.encodePacked(_uEmail)));

     }
     function setPass(string memory _uPass)public {
        password=_uPass;
 assert(keccak256(abi.encodePacked(password)) == keccak256(abi.encodePacked(_uPass)));

     }
     function setUserNumber(int _aNumber) private{
       aNumber=_aNumber;
     }
     function resetTheNum() public {
      if(aNumber==0){
        revert("value is already zero");
      }
      aNumber=0;
     }
     function AuthenticateUser(string memory _email, string memory _pass,int _aNumber) public {
       require((keccak256((abi.encodePacked(email))) == keccak256(abi.encodePacked(_email)))&&(keccak256(abi.encodePacked(password)) == keccak256(abi.encodePacked(_pass))),"wrong email");   
        setUserNumber(_aNumber);
     }
}
