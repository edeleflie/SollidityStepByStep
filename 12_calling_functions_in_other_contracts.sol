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

	ArtWork[] artworks;

	function registerNewArtwork(bytes32 artist, bytes32 workName, uint yearCreated) public {
		ArtWork newWork = new ArtWork(artist, workName, yearCreated);
		artworks.push(newWork);
	}

	// This function retrieves a contract from our list of artworks, and effectuates
	// a change in ownership
	function changeOwnership(address artWorkAddress, address newOwner) returns (bytes32){
		// First, we re-create a local handle to the concerned contract
		// this is done simply by passing in the contract address as a constructor!
		ArtWork work = ArtWork(artWorkAddress);
		if (work)
        return work.getWorkName();
	}

	function countArtWorks() public view returns (uint) {
        return artworks.length;
	}

}

contract ArtWork {
	bytes32 public _artist;
	bytes32 public _workName;
	uint public _yearCreated;
	
	function ArtWork(bytes32 artist, bytes32 workName, uint yearCreated) public{
		_artist = artist;
		_workName = workName;
		_yearCreated = yearCreated;
	}
	
	function getWorkName() public returns (bytes32) {
	    return _workName;
	}

}