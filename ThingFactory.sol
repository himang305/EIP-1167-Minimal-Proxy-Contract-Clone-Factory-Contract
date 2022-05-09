
// SPDX-License-Identifier: MIT
pragma solidity ^0.4.23;

import "./Thing.sol";
import "@optionality.io/clone-factory/contracts/CloneFactory.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";

contract ThingFactory is Ownable, CloneFactory {

  Thing[] public ThingAddresses;
  address public libraryAddress;

  event ThingCreated(address newThingAddress);

  constructor(address _libraryAddress) public {
    libraryAddress = _libraryAddress;
  }

  function setLibraryAddress(address _libraryAddress) public onlyOwner {
    libraryAddress = _libraryAddress;
  }

  function createThing(string _name, uint _value) public onlyOwner {
    // address clone = createClone(libraryAddress);
    // Thing(clone).init(_name, _value);
    
    Thing metaCoin = Thing(
            createClone(libraryAddress)
        );
        metaCoin.init(_name, _value);

        ThingAddresses.push(metaCoin);
            // emit ThingCreated(clone);

    }

    function getMetaCoins() external view returns (Thing[] memory) {
        return ThingAddresses;
    }
  
}
