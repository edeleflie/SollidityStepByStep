pragma solidity ^0.4.0;

/* 
 * Contracts can call functions on other contracts. This allows complex orgnisations of contracts,
 * transasctions and behaviours.
 * 
 * Here, the ArtBank contract changes the 'Current Owner' of an artwork in the ArtBank
 *
 * 
 * 
 */

contract ArtBank {

	mapping (address => ArtWork) artworks;
	uint artworks_count = 0;

	function registerNewArtwork(bytes32 artist, bytes32 workName, uint yearCreated) public returns (address){
		// Note that the artwork owner is whoever called this function
		ArtWork newWork = new ArtWork(msg.sender, artist, workName, yearCreated);
		artworks[address(newWork)] = newWork;
		artworks_count ++;
		return address(newWork);
	}

	// This function retrieves a contract from our list of artworks, and effectuates
	// a change in ownership
	function changeOwnership(address artWorkAddress, address newOwner) public returns (bool){
		// First, we retrieve the contract at that address
		ArtWork work = artworks[artWorkAddress];
		// test that the ArtWork contract is valid.
		if (work.exists()) {
			work.setNewOwner(newOwner);
			return true;
		} else {
	        return false;
	    }
	}

	// This function 
	function getArtworkOwner(address artWorkAddress) public view returns (address) {
		// First, we retrieve the contract at that address
		ArtWork work = artworks[artWorkAddress];
		// test that the ArtWork contract is valid.
		if (work.exists()) {
			return work.getCurrentOwner();
		} else {
	        return 0;
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
	bool public exists = false;
	
	function ArtWork(address owner, bytes32 artist, bytes32 workName, uint yearCreated) public{
		_artist = artist;
		_workName = workName;
		_yearCreated = yearCreated;
		_currentOwner = owner;
		exists = true;
	}
	
	function setNewOwner(address newOwner) public {
	    _currentOwner = newOwner;
	}

	function getCurrentOwner() public view returns (address) {
		return _currentOwner;
	}

	// This function is written to explicitly allow external contracts to
	// see if this contract actually exists 
	function exists() public view returns (bool){
	    return exists;
	}

}