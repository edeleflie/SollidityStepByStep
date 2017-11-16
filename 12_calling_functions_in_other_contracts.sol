pragma solidity ^0.4.0;

/* 
 * Contracts can call functions on other contracts. This allows complex orgnisations of contracts,
 * transasctions and behaviours.
 * 
 * Here, the ArtBank contract changes the 'Present Owner' of an artwork in the ArtBank
 *
 * 
 * 
 */

contract ArtBank {

	mapping (address => ArtBank) artworks;
	uint artworks_count = 0;

	function registerNewArtwork(bytes32 artist, bytes32 workName, uint yearCreated) public {
		ArtWork newWork = new ArtWork(msg.sender, artist, workName, yearCreated);
		artworks_count ++;
		artworks[address(newWork)] = newWork;
	}

	// This function retrieves a contract from our list of artworks, and effectuates
	// a change in ownership
	function changeOwnership(address artWorkAddress, address newOwner) returns (bool){
		// First, we retrieve the contract at that address
		ArtWork work = artworks[artWorkAddress];
		// test that it is not dud
		if (work > 0) {
			work.setNewOwner(newOwner);
			return true;
		} else {
	        return false;
	    }
	}

	function countArtWorks() public view returns (uint) {
        return artworks_count;
	}

}

contract ArtWork {
	bytes32 public _artist;
	bytes32 public _workName;
	uint public _yearCreated;
	address public _currentOwner;
	
	function ArtWork(address owner, bytes32 artist, bytes32 workName, uint yearCreated) public{
		_artist = artist;
		_workName = workName;
		_yearCreated = yearCreated;
		_currentOwner = owner;
	}
	
	function setNewOwner(address newOwner) public {
	    _currentOwner = newOwner;
	}

	function getWorkName() public returns (bytes32) {
	    return _workName;
	}

}